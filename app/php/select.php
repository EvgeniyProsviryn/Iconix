<?php 
	$host = 'localhost';
	$username = 'root';
	$password = '';
	$db_name = 'iconix';

	$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');

	$output = '';

	$query = "SELECT * FROM `Categories` ORDER BY id DESC";

	$result = mysqli_query($connect,$query);

	while($row = mysqli_fetch_array($result)){
		$output[] = $row;
	}

	echo json_encode($output);
?>