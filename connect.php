<?php

$sqlQuery = new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
$sqlQuery->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


$sql = 'SELECT id, lastName, firstName, is_infected FROM users';
$stm = $sqlQuery->prepare($sql);
$stm->execute();

$users = $stm->fetchAll(PDO::FETCH_ASSOC);
?>