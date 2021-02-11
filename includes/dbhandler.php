<?php

$servename = "localhost";
$DBuname = "phpmyadmin";
$DBPass = "Husain1!";
$DBname = "cs230";

$conn = mysqli_connect($servename, $DBuname, $DBPass, $DBname);

if (!$conn) {
    die("Connection failed...".mysqli_connect_error());
    # code...
}