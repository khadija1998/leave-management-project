<?php
require('top.inc.php');
if(isset($_GET['type']) && $_GET['type']=='delete' && isset($_GET['id'])){
	$id=mysqli_real_escape_string($con,$_GET['id']);
	mysqli_query($con,"delete from `leave` where id='$id'");
}
if(isset($_GET['type']) && $_GET['type']=='update' && isset($_GET['id'])){
	$id=mysqli_real_escape_string($con,$_GET['id']);
	$status=mysqli_real_escape_string($con,$_GET['status']);
	mysqli_query($con,"update `leave` set leave_status='$status' where id='$id'");

}
if($_SESSION['ROLE']==1){ 
	$sql="select `leave`.*, employee.name,employee.id as eid from `leave`,employee where `leave`.employee_id=employee.id order by `leave`.id desc";
}else{
	$eid=$_SESSION['USER_ID'];
	$sql="select `leave`.*, employee.name ,employee.id as eid from `leave`,employee where `leave`.employee_id='$eid' and `leave`.employee_id=employee.id order by `leave`.id desc";
}
$res=mysqli_query($con,$sql);
?>
<div class="content pb-0">                          
            <div class="orders">
               <div class="row">
                  <div class="col-xl-12">
                     <div class="card">
                        <div class="card-body">
                           <h4 class="box-title">Leave </h4>
						    <?php if($_SESSION['ROLE']==2){ ?>
						   <h4 class="box_title_link"><a href="add_leave.php">Add Leave</a> </h4>
						   <?php } ?>   
						   <!-- hnaya l'eemployee i9dar izid wahd leave  -->
                        </div>
                        <div class="card-body--">
                           <div class="table-stats order-table ov-h">
                              <table class="table ">
                                 <thead>
                                    <tr>
                                       <th width="5%">order</th>
                                       <th width="5%">ID</th>
									   <th width="15%">Employee Name</th>
                                       <th width="14%">From</th>
									   <th width="14%">To</th>
									   <th width="15%">Description</th>
									   <th width="18%">Leave Status</th>
									   <th width="10%"></th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <?php 
									$i=1;
									while($row=mysqli_fetch_assoc($res)){?>
									<!-- La while boucle exécute un bloc de code tant que la condition spécifiée est vraie. -->
									<tr>
                                       <td><?php echo $i?></td>
									   <td><?php echo $row['id']?></td>
									   <td><?php echo $row['name'].' ('.$row['eid'].')'?></td>
                                       <td><?php echo $row['leave_from']?></td>
									   <td><?php echo $row['leave_to']?></td>
									   <td><?php echo $row['leave_description']?></td>
									   <td>
									   <!-- ( td howa wahd tag likay3tina simple tableau f html m3a 2 rows O 4 lkhanat abc et d)had l partie hiya limas2OLA LINA 3la les info dyl l conge
									3la salarie li9adam demande dyl l congé bhal matalan lamyaa  -->
										   <?php
											if($row['leave_status']==1){
												echo "Applied";
											}if($row['leave_status']==2){
												echo "Approved";
											}if($row['leave_status']==3){
												echo "Rejected";
											}
											
										
										   ?>
										   <?php if($_SESSION['ROLE']==1){ ?>
										   <select class="form-control" onchange="update_leave_status('<?php echo $row['id']?>',this.options[this.selectedIndex].value)">
											<option value="">Update Status</option>
											<option value="2">Approved</option>
											<option value="3">Rejected</option>
										   </select>

										   <!-- hnaya l parie dy admin  -->
										   <?php } ?>
									   </td>
									   <td>
									   <?php
									   if($row['leave_status']==1){ ?>
									   <a href="leave.php?id=<?php echo $row['id']?>&type=delete">Delete</a>


									   <!-- l'admin  mli ylh kiylawnsi l'employee demande I9DAR admin imas7o -->
									   <?php } ?>
									   
									   
									   </td>
									   
                                    </tr>
									<?php 
									$i++;
									} ?>
                                 </tbody>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
		  </div>
         <script>
		 function update_leave_status(id,select_value){
			 window.location.href='leave.php?id='+id+'&type=update&status='+select_value;
			// (js) L' window.locationobjet peut être utilisé pour obtenir l'adresse de page actuelle (URL) et pour rediriger le navigateur vers une nouvelle page.
			// 

		 }
		 </script>
<?php
require('footer.inc.php');
?>