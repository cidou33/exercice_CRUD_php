<?php

session_start();



    

if(isset($_POST["login"])){
    
    $pdoConnect= new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
    $pdoConnect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


    $sql = "SELECT u.id, u.firstName, u.lastName, u.id_role, u.mail, r.poids, password 
    FROM users u
    JOIN roles r ON r.id = u.id_role
    WHERE u.mail = :post_mail";

    $stm = $pdoConnect->prepare($sql);
    $stm->execute([
        'post_mail' => $_POST['mail']
    ]);

    $user = $stm->fetch(PDO::FETCH_ASSOC);
    //var_dump(password_verify($_POST['password'], $user['password']));
    if($user != false){
        $isPasswordVerify = password_verify($_POST['password'], $user['password']);
        if($isPasswordVerify == true){

            $_SESSION['user']['id'] = $user['id'];
            $_SESSION['user']['firstname'] = $user['firstName'];
            $_SESSION['user']['mail'] = $user['mail'];
            $_SESSION['user']['poids'] = $user['poids'];


        }
        
    }
    header('Location:index.html');
}


?>