<?php

if(isset($_POST['signup-submit'])){
    require 'dbhandler.php';

    $username = $_POST['uname'];
    $email = $_POST['email'];
    $pass = $_POST['pwd'];
    $pass_rep = $_POST['con-pwd'];
    $fname = $_POST['fname'];
    $lname = $_POST['lname'];

   if($pass !== $pass_rep){
       header("Location: ../signup.php?error=diffPasswords");
       exit();
   } 

   else{
       $sqlstate = "SELECT uname FROM users WHERE uname=?";
       $statement = mysqli_stmt_init($conn);
       if(!mysqli_stmt_prepare($statement, $sqlstate)){
        header("Location: ../signup.php?error=SQLInjection");
        exit();
       }
       else{
        mysqli_stmt_bind_param($statement, "s", $username);
        mysqli_stmt_execute($statement);
        mysqli_stmt_store_result($statement);
        $check = mysqli_stmt_num_rows($statement);

        if($check > 0){
            header("Location: ../signup.php?error=UsernameTaken");
            exit();
        }
else{
    $sqlstate = "INSERT INTO users (lname, fname, email, uname, password) VALUES (?, ?, ?, ?, ?)";
    $statement = mysqli_stmt_init($conn);

    if(!mysqli_stmt_prepare($statement, $sqlstate)){
     header("Location: ../signup.php?error=SQLInjection");
     exit();
    }
    else{
        $hash = password_hash($pass, PASSWORD_BCRYPT);
        mysqli_stmt_bind_param($statement, "sssss",$fname,$lname,$email, $username,$hash);
        mysqli_stmt_execute($statement);
        mysqli_stmt_store_result($statement);

        $sqlImg = "INSERT INTO profiles (uname, fname) VALUES ('$username', '$fname')";
        mysqli_query($conn, $sqlImg);

        header("Location: ../signup.php?signup=success");
        exit();
    }
}
       }
       mysqlii_stmt_close($statement);
       mysqli_close($conn);
   }
}else{
    header("Location: ../signup.php");
    exit();
}