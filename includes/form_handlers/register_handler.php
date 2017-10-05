<?php
//Declaring variables to prevent errors
$fname="";
$lname="";
$em="";
$em2="";
$password="";
$password2="";
$date="";
$error_array=array();

if (isset($_POST['register_button'])) {

	//first name
	$fname=strip_tags($_POST['reg_fname']); //remove html tags
	$fname=str_replace(' ', '', $fname); //remove spaces if user put it
	$fname=ucfirst(strtolower($fname)); //uppercase first letter
	$_SESSION['reg_fname'] = $fname; //stores fname into session variable

	//last name
	$lname=strip_tags($_POST['reg_lname']); //remove html tags
	$lname=str_replace(' ', '', $lname); //remove spaces if user put it
	$lname=ucfirst(strtolower($lname)); //uppercase first letter
	$_SESSION['reg_lname'] = $lname;
	//email
	$em=strip_tags($_POST['reg_email']); //remove html tags
	$em=str_replace(' ', '', $em); //remove spaces if user put it
	$em=ucfirst(strtolower($em)); //uppercase first letter
	$_SESSION['reg_email'] = $em;
	//email2
	$em2=strip_tags($_POST['reg_email2']); //remove html tags
	$em2=str_replace(' ', '', $em2); //remove spaces if user put it
	$em2=ucfirst(strtolower($em2)); //uppercase first letter
	$_SESSION['reg_email2'] = $em2;
	//password
	$password=strip_tags($_POST['reg_password']); //remove html tags
	$password2=strip_tags($_POST['reg_password2']); //remove html tags

	$date=date("Y-m-d");

	if ($em == $em2) {
		//check if email is a valid format
		if (filter_var($em, FILTER_VALIDATE_EMAIL)) {
			$em = filter_var($em, FILTER_VALIDATE_EMAIL);
			//check if email already exists
			$e_check = mysqli_query($con, "SELECT email FROM users WHERE email = '$em'");
			//count the number of rows returned
			$num_rows = mysqli_num_rows($e_check);
			if ($num_rows > 0) {
				array_push($error_array, "Email already in use<br>");
			}
		}else{
			array_push($error_array, "invalid format<br>");
		}
	}else{
		array_push($error_array, "Emails dont match<br>");
	}

	if (strlen($fname) > 25 || strlen($fname) < 2) {
		array_push($error_array, "Your first name must be between 2 and 25 characters<br>");
	}
	if (strlen($lname) > 25 || strlen($lname) < 2) {
		array_push($error_array, "Your last name must be between 2 and 25 characters<br>");
	}
	if ($password != $password2) {
		array_push($error_array, "Your password do not match<br>");
	}else{
		if (preg_match('/[^A-Za-z0-9]/', $password)) {
			array_push($error_array, "Your password can only contain english characters or numbers<br>");
		}
	}
	if (strlen($password > 30 || strlen($password) < 5)) {
		array_push($error_array, "Your password must be between 5 and 30 characters<br>");
	}

	if (empty($error_array)) {
		$password = md5($password); //Encrypt password before sending to db
		//Generate username concatenating first name and lastname
		$username = strtolower($fname . "_" . $lname);
		$check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username = '$username'");
		$i = 0;
		//if username exists add number to username
		while (mysqli_num_rows($check_username_query) != 0) {
			$i++;
			$username = $username . "_" . $i;
			$check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username = '$username'");
		}
		//Profile picture assigment
		$rand = rand(1,2); //Random number between 1 and 2
		if($rand == 1)
			$profile_pic = "assets/images/profile_pics/defaults/head_deep_blue.png";
		else if($rand == 2)
			$profile_pic = "assets/images/profile_pics/defaults/head_emerald.png";

		$query = mysqli_query($con, "INSERT INTO users VALUES ('', '$fname', '$lname', '$username', '$em', '$password', '$date', '$profile_pic', '0', '0', 'no', ',')");

		array_push($error_array, "<span style='color: #14c800;'>You're all set! Go ahead and login!</span><br>");
		//Clear session variables
		$_SESSION['reg_fname'] = "";
		$_SESSION['reg_lname'] = "";
		$_SESSION['reg_email'] = "";
		$_SESSION['reg_email2'] = "";
	}
}


?>