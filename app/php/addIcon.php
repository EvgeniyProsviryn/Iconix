<?php

	if(!isset($_POST)) die();

	$host = 'localhost';
	$username = 'root';
	$password = '';
	$db_name = 'iconix';

	$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');

	$category = mysqli_real_escape_string($connect, trim($_POST['categorySelect']));
	$iname = mysqli_real_escape_string($connect, trim($_POST['iname']));




	$file = $_FILES['file']['name'];
	if(!empty($_FILES)){
		$path = 'upload/icons/'.$file;
		if(move_uploaded_file($_FILES['file']['tmp_name'], $path)){
			$insertQuery = "INSERT INTO Icons (`category`,`file`,`name`) VALUES ('".$category."','".$file."','".$iname."')";
			if(mysqli_query($connect,$insertQuery)){
				echo "File Uploaded";
			}else{
				echo "File not Saved";
			}
		}
	}else{
		echo "error";
	}
	
?>