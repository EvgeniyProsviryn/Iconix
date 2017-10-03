<?php
header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');

if(!isset($_POST)) die();

session_start();

$host = 'localhost';
$username = 'root';
$password = '';
$db_name = 'iconix';

$response = [];

$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');

$username = mysqli_real_escape_string($connect, trim($_POST['username']));
$password = mysqli_real_escape_string($connect, trim($_POST['password']));


$query = "SELECT * FROM `Users` WHERE username='$username' AND password='$password' AND admin=1";
$queryAll = "SELECT * FROM `Users` WHERE username='$username' AND password='$password' AND admin=0";

$resultAdmin = mysqli_query($connect,$query);
$resultAll = mysqli_query($connect,$queryAll);

if(mysqli_num_rows($resultAdmin) > 0){
	$response['status'] = 'loggedAdmin';
	$response['admin'] = true;
	$response['user'] = $username;
	$response['useruniqueid'] = md5(uniqid());
	$_SESSION['useruniqueid'] = $response['useruniqueid'];
}else{
	$response['status'] = 'error';
}

if(mysqli_num_rows($resultAll) > 0){
	$response['status'] = 'logged';
	$response['admin'] = false;
	$response['user'] = $username;
	$response['useruniqueid'] = md5(uniqid());
	$_SESSION['useruniqueid'] = $response['useruniqueid'];
}



/*if(isset($_POST) && isset($_POST['username'])){
	if($_POST['username'] == 'admin' && $_POST['password'] == 'admin'){
		
	}
	else
	{
		
	}
}*/

echo json_encode($response);
/*
print_r($_POST);
*/
?>