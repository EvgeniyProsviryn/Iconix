<?php 
	$host = 'localhost';
	$username = 'root';
	$password = '';
	$db_name = 'iconix';

	$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');

	$key = $_POST['key'];
	
	$query = "DELETE FROM `Categories` WHERE id='$key' ";

	if(mysqli_query($connect,$query)){
				echo "Deleted";
			}else{
				echo "Not Deleted";
			}

	
	

?>