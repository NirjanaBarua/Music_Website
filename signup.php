<?php

	session_start();
	$db = new mysqli("localhost","root","","open");

	if(isset($_POST['submit'])){
		$username = $_POST['username'];
		$password = $_POST['password'];
		$email = $_POST['email'];
		$user_type = $_POST['user_type'];
		$query = "INSERT INTO information(username, password, email,user_type) VALUES ('$username' , '$password', '$email','$user_type')";
		$run = mysqli_query($db, $query);

		if($run){
			echo "Registration successful.!";
		}else{
			echo "error".mysql_error($db);
		}
	}

	if(isset($_POST['login'])){
		$username = $_POST['lusername'];
		$password = $_POST['lpassword'];

		$mysqli = new mysqli("localhost","root","","open");
		$result = $mysqli->query("SELECT * FROM information WHERE username = '$username' AND password ='$password'");
		$row = $result->fetch_assoc();
		if($row['user_type'] == 'admin'){

			$_SESSION['admin_name'] = $row['name'];
			$_SESSION['admin_email'] = $row['email'];
			header('location:index.php');
   
		 }elseif($row['user_type'] == 'user'){
   
			$_SESSION['user_name'] = $row['name'];
			$_SESSION['user_email'] = $row['email'];
			
			header('location:music.php');
   
		 }else{
			$message1 = "Login Unsuccessful.!";
			echo "<script type='text/javascript'>alert('$message1');</script>";
		}
	}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="ms.css">
    <script src="https://kit.fontawesome.com/c8e4d183c2.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="bg-img">
	    <div class="login-page">
			<div class="form">
		<form action="#" method="post" class="signup-form">
			<h2><p style="color:white;">Sign Up</p></h2>
		<label for="user_type">Select a type to continue:</label>
				<select name="user_type" class="box">
					<option value="user">user</option>
					<option value="admin">admin</option>
			</select>
				<input type="text" name="username" placeholder="user name">
				<input type="password" name="password" placeholder="password">
				<input type="text" name="email" placeholder="email id">
				<button name="submit">Create</button>
				<p class="message">You have an account?<a href="#">Login</a></p>
			</form>
			<form action="#" method="post" class="login-form">
				<h2><p style="color:white;">Login</p></h2>
				<input type="text" name="lusername" placeholder="user name">
				<input type="password" name="lpassword" placeholder="password">
				<button name="login">Log in</button>
				<p class="message">Don't have an account?<a href="#">Sign Up</a></p>
			</form>
            </div>
        </div>
</div>
            <script src='http://code.jquery.com/jquery-3.3.1.min.js'></script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/custom.js"></script>

	<script>
		$('.message a').click(function(){
			$('form').animate({height: "toggle",opacity: "toggle"}, "slow");
		});
	</script>

    </body>
    </html>
	