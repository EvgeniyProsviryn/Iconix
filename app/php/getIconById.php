<?php 
	$host = 'localhost';
	$username = 'root';
	$password = '';
	$db_name = 'iconix';

	$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');
	$response = [];
	$key = $_POST['key'];

	$output = '';
	
	$query = "SELECT * FROM `Icons` WHERE id='$key' ";

	$result = mysqli_query($connect,$query);

	while($row = mysqli_fetch_array($result)){
		$output[] = $row;
	}

	echo json_encode($output);

?>