<?php

if(!isset($_POST)) die();

$host = 'localhost';
$username = 'root';
$password = '';
$db_name = 'iconix';

$response = [];

$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');

$username = mysqli_real_escape_string($connect, trim($_POST['username']));
$postId = $_POST['postId'];

$querySelect = "SELECT * FROM `likes` WHERE username='$username' AND post_id='$postId'";
$resultSelect = mysqli_query($connect,$querySelect);


if(mysqli_num_rows($resultSelect) > 0){
	echo "like again";
}else{
	$query = "INSERT INTO `likes`(`username`, `post_id`) VALUES ('".$username."','".$postId."')";
	$resultInsert = mysqli_query($connect,$query);
	$queryUpdate = "UPDATE `Icons` SET rating=rating+1 WHERE id='$postId'";
	$resultUpdate = mysqli_query($connect,$queryUpdate);
	echo "liked";
}


?>