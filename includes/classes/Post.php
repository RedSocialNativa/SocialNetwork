<?php 
class Post{
	private $user_obj;
	private $con;

	public function __construct($con, $user){
		$this->con = $con;
		$this->user_obj = new User($con,$user);
	}

	public function submitPost(){
		$body = strip_tags($body); //remove html tags
		$body = mysqli_real_escape_string($this->con, $body);
		$check_empty = preg_replace('/\s+/', '', $body); //delete all spaces
		if ($check_empty != "") {
			//current date and time
			$date_added = date("Y-m-d H:i:s");
			//Get username
			$added_by = $this->user_obj->getUsername();
			//if user is on own profile, user_to is 'none'
			if ($user_to = $added_by) {
				$user_to = "none";
			}
		}
	}
}
?>