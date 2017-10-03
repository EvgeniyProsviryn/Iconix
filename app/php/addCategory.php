<?php



	if(!isset($_POST)) die();

	$host = 'localhost';
	$username = 'root';
	$password = '';
	$db_name = 'iconix';

	$connect = mysqli_connect ($host, $username, $password, $db_name) or die ('error');
	$key = md5(uniqid());

	$category_name = mysqli_real_escape_string($connect, trim($_POST['categoryName']));
	$file_name = $_FILES['file']['name'];
	if(!empty($_FILES)){
		$path = 'upload/'.$file_name;
		if(move_uploaded_file($_FILES['file']['tmp_name'], $path)){
			$insertQuery = "INSERT INTO Categories (`category_name`,`image`,`key`) VALUES ('".$category_name."','".$file_name."','".$key."')";
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