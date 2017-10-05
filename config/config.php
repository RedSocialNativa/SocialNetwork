<?php
ob_start(); //Turns on output buffering
session_start();
$timezone = date_default_timezone_get("America/Lima");
$con = mysqli_connect("localhost", "root", "root", "social");
if (mysqli_connect_errno()) {
	echo "Failed to connect ".mysqli_connect_errno();	
}
?>