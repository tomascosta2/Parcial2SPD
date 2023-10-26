<?php
session_start();
session_destroy();
include('./template-parts/header.php');
header("Location: login.php");