<?php

    include_once "../config/dbconnect.php";
    
    $s_id=$_POST['record'];
    $query="DELETE FROM songs where songs_id='$s_id'";

    $data=mysqli_query($conn,$query);

    if($data){
        echo"Song Deleted";
    }
    else{
        echo"Not able to delete";
    }
    
?>