<?php
session_start();
session_destroy(); //mettre fin à la session 
header("Location: accueil.php"); //redirection automatique
exit;