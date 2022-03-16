<?php 
session_start();

$formError=[];
    if(count($_POST) > 0){
        $formError = validationForm();
        if($formError['isFormValid']==true){
            setUser();
        };
      };
    
      
      function getMsgErrorForm($formErrors, $index){
        if(isset($formErrors[$index])){
            return $formErrors[$index];
        }else{
            return '';
        }
      }



    function setUser(){
    $sqlQuery = new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
    $sqlQuery->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    
    $sql = "INSERT INTO `users`(`lastName`, `firstName`, `is_infected`, `birth`, `mail`, `password`, `is_public`,`image` ) VALUES (:lastname,:firstname,:infectStat,:birth, :mail, :password, :status, :photo)";
    $stm = $sqlQuery->prepare($sql);
    $stm->execute([
        'lastname' => $_POST['lastname'],
        'firstname' => $_POST['firstname'],
        'infectStat' => (int) isset($_POST['infectStat']),
        'birth' => $_POST['birth'],
        'mail' => $_POST['mail'],
        'password' => password_hash($_POST['password'], PASSWORD_BCRYPT),
        'status' =>(int) isset($_POST['statusProfil']),
        'photo' => $_FILES['image']['name'],
        ]);


    $sqlPhoto = "SELECT `id`FROM `users` WHERE `mail`=:post_mail";
    $stmPhoto = $sqlQuery->prepare($sqlPhoto);
    $stmPhoto->execute([
        'post_mail'=> $_POST['mail']
    ]);
    $usersPhoto= $stmPhoto->fetch(PDO::FETCH_ASSOC);
    if($usersPhoto != false){
        mkdir('public/img/'.$usersPhoto['id']);
    };
    move_uploaded_file($_FILES['image']['tmp_name'], 'public/img/'.$usersPhoto['id'].'/'.$_FILES['image']['name']);


    //header('Location: index.html'); 
    //exit();
    };

    
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
          'errPassword' => null, 
      ];
      if(preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/' , $_POST['password'])==0){
        $errorForm['isFormValid'] = false;
        $errorForm['errPassword'] = 'le mdp n\'est pas au bon format';
      }
        if(strlen( $_POST['lastname']) == 0){
            $errorForm['isFormValid'] = false;
            $errorForm['errLastname'] = 'le nom ne peut pas être vide';
        }
        elseif(filter_var($_POST['mail'], FILTER_VALIDATE_EMAIL) == false){
            $errorForm['isFormValid'] = false;
            $errorForm['errMail'] = 'Le courriel n\'est pas bon';
        }
        elseif(verifyMailNotExist() !==false){
            $errorForm['isFormValid'] = false;
            $errorForm['errMail'] = 'ce mail existe déjà';
        }
        return $errorForm;
   }
   
   if(isset($_POST["logout"])){
    
    $pdoConnect= new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
    $pdoConnect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


    $sql = "SELECT mail, password FROM users WHERE mail= :post_mail";
    $stm = $pdoConnect->prepare($sql);
    $stm->execute([
        'post_mail' => $_POST['mail']
    ]);

    $user = $stm->fetch(PDO::FETCH_ASSOC);
    var_dump($_SESSION);
    if($_SESSION['user']['
    mail']==$_POST['mail']){
    if($user != false){
        $isPasswordVerify = password_verify($_POST['password'], $user['password']);
        if($isPasswordVerify == true){
            $sql = "DELETE FROM users WHERE mail= :post_mail";
            $stm = $pdoConnect->prepare($sql);
            $stm->execute([
                'post_mail' => $_POST['mail']
            ]);
            header('Location: index.html'); exit();
        }
    }
        
    }
}





