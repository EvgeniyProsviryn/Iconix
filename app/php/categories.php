<?php 
header('Access-Control-Allow-Origin: *');
header('Content-type: application/json');

session_start();

$host = 'localhost';
$username = 'root';
$password = '';
$db_name = 'iconix';

$response = [];

$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');

?>