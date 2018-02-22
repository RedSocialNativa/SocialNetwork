<?php 
include("includes/header.php");


if (isset($_GET['profile_username'])) { //parametro get de la url establecida en .htaccess
	$username = $_GET['profile_username'];
	$user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$username'");
	$user_array = mysqli_fetch_array($user_details_query);
	//var_dump($user_array['friend_array']);
	$num_friends = (substr_count($user_array['friend_array'], ",")) - 1; //Contar el número de cadenas repetidas
}

if (isset($_POST['remove_friend'])) {
	$user = new User($con, $userLoggedIn);
	$user->removeFriend($username);
}

if (isset($_POST['add_friend'])) {
	$user = new User($con, $userLoggedIn);
	$user->sendRequest($username);
}

if (isset($_POST['response_request'])) {
	header("Location: requests.php");
}
?>
	<style type="text/css">
		.wrapper{
			margin-left: 0px;
			padding-left: 0px;
		}
	</style>
	<div class="profile_left">
		<img src="<?php echo $user_array['profile_pic']; ?>" alt="No hay imagen">
		<div class="profile_info">
			<p><?php echo "Posts: " . $user_array['num_posts']; ?></p>
			<p><?php echo "Likes: " . $user_array['num_likes']; ?></p>
			<p><?php echo "Friends: " . $num_friends; ?></p>
		</div>
		<form action="<?php echo $username; ?>" method="post">
			<?php
			$profile_user_obj = new User($con, $username);
			if ($profile_user_obj->isClosed()) {
				header("Location: user_closed.php");
			}

			$logged_in_user_obj = new User($con, $userLoggedIn);

			if ($userLoggedIn != $username) {
				if ($logged_in_user_obj->isFriend($username)) {
					echo '<input type="submit" name="remove_friend" class="danger" value="Remove Friend"><br>';
				} else if ($logged_in_user_obj->didReceiveRequest($username)) {
					echo '<input type="submit" name="response_request" class="warning" value="Respond to Request"><br>';
				} else if ($logged_in_user_obj->didSendRequest($username)) {
					echo '<input type="submit" name="" class="default" value="Request Sent"><br>';
				} else{
					echo '<input type="submit" name="add_friend" class="success" value="Add Friend"><br>';
				}
			}
			?>
		</form>
		<input type="submit" class="deep_blue" data-toggle="modal" data-target="#post_form" value="Post Something">
	</div>

	<div class="main_column column">
		<?php echo $username; ?>
	</div>

	<div class="modal fade" id="post_form">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Post something!</h4>
				</div>
				<div class="modal-body">
					<p>This will appear on the user's profile page and also their newsfeed for your friends to see!</p>
					<form class="profile_post" action="" method="post">
						<div class="form-group">
							<textarea class="form-control" name="post_body"></textarea>
							<input type="hidden" name="user_from" value="<?php echo $userLoggedIn ?>">
							<input type="hidden" name="user_to" value="<?php echo $username ?>">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Post</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>