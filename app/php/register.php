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

$first_name = mysqli_real_escape_string($connect, trim($_POST['firstname']));
$last_name = mysqli_real_escape_string($connect, trim($_POST['lastname']));
$email = mysqli_real_escape_string($connect, trim($_POST['email']));
$username = mysqli_real_escape_string($connect, trim($_POST['username']));
$pass = mysqli_real_escape_string($connect, trim($_POST['password']));

$usernameCheck = "SELECT * FROM `Users` WHERE username='$username'";

$query = "INSERT INTO Users (`first_name`,`last_name`,`username`,`password`) VALUES ('".$first_name."', '".$last_name."', '".$username."', '".$pass."')";



$resultCheck = mysqli_query($connect,$usernameCheck);



if(mysqli_num_rows($resultCheck) > 0){
	$response['status'] = 'error';
}else if(mysqli_num_rows($resultCheck) <= 0){
	$result = mysqli_query($connect,$query) or die();
	$response['status'] = 'registered';
	$response['user'] = $username;
	$response['useruniqueid'] = md5(uniqid());
	$_SESSION['useruniqueid'] = $response['useruniqueid'];
}


echo json_encode($response);


?>