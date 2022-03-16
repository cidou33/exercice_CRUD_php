<?php
session_start();

function connectBDD(){
$sqlQuery = new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
    $sqlQuery->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


    $sql = "SELECT id, lastName, firstName, is_infected, birth, image FROM users WHERE is_public = 1";
    $stm = $sqlQuery->prepare($sql);
    $stm->execute();

    return $stm->fetchAll(PDO::FETCH_ASSOC);
};

    function nbVax($value){
        $sqlVax = new PDO( 'mysql:host=localhost;dbname=ecode2022;charset=UTF8','root');
        $sqlVax->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $reqVax = "SELECT name FROM vaccines WHERE id_user= :id_user";
        $stmVax = $sqlVax->prepare($reqVax);
        $stmVax->execute([
            'id_user' => $value['id'],
        ]);
        $userVax = COUNT($stmVax->fetchAll(PDO::FETCH_ASSOC));
        return $userVax;
    };

    function nameColor($status){
        if($status==0){
            $color='bgNeg';
        }
        else{
            $color='bgPos';
        }
        return $color;

    
    };
    function getFormatedDate($dateRecup){
        $d = $dateRecup;
        $t = new DateTime($d);
        return $t->format('d-m-Y');
    }
    
    ?>