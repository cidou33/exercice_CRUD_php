<?php 
session_start();
$formError= [];

    
    //fonction de récupération de l'ID en GET
    function recupId(){
        $sqlQuery = new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
        $sqlQuery->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        //ma requete
        $sql = "SELECT * From `users` WHERE id = :get_id";
        $stm = $sqlQuery->prepare($sql);
        $stm->execute([
        'get_id' => $_GET['id'],
        ]);
        
        return $stm->fetch(PDO::FETCH_ASSOC);

    }
    //recuperation dans une variable du tableau renvoyé par la fonction recupId
    $iduser = recupId();
    //var_dump(recupId());



    if($iduser===false){
        header('Location: index.html');
    //exit();
    }
    if(isset($_GET['id'])){
    recupId();
    if(count($_POST) > 0){
        //$formError = validationForm();
        //if($formError['isFormValid']==true){
            modifyUser();
        //};
      };
}
//else{
    //header('Location: index.html');
    //exit();
//}
    

    function modifyUser(){
    $sqlQuery = new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
    $sqlQuery->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    
    $sql = "UPDATE `users` SET `lastName`=:lastname,`firstName`=:firstname,`is_infected`=:infectstat,`birth`=:birth, `mail`=:mail, `image`=:image WHERE id=:id";
    $stm = $sqlQuery->prepare($sql);
    $stm->execute([
        'lastname' => $_POST['lastname'],
        'firstname' => $_POST['firstname'],
        'infectstat' => (int) isset($_POST['infectStat']),
        'birth' => $_POST['birth'],
        'mail' => $_POST['mail'],
        'id' => $_GET['id'],
        'image' => $_FILES['image']['name'],
    ]);
    move_uploaded_file($_FILES['image']['tmp_name'], 'public/img/'.$_GET['id'].'/'.$_FILES['image']['name']);
    //header('Location: index.html');
    //exit();
}

    
    function verifyMailNotExist(){
        $sqlQuery = new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
        $sqlQuery->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        
        $sql = "SELECT mail From `users` WHERE mail = :post_mail";
        $stm = $sqlQuery->prepare($sql);
        $stm->execute([
        'post_mail' => $_POST['mail']
        ]);
        $testMail = $stm->fetch(PDO::FETCH_ASSOC);
        return $testMail;

    }



   function validationForm():array{
       $errorForm = [
          'isFormValid' => true,
          'errLastname' => null,
          'errMail' => null,
      ];

        if(strlen( $_POST['lastname']) == 0){
            $errorForm['isFormValid'] = false;
            $errorForm['errLastname'] = 'le nom ne peut pas être vide';
        }
        elseif(verifyMailNotExist() !==false){
            $errorForm['isFormValid'] = false;
            $errorForm['errMail'] = 'ce mail existe déjà';
        }
        return $errorForm;
   }





