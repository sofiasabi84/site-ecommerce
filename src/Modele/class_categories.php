<?php

// Ne pas toucher ! NE RIEN CHANGER POUR LE MOMENTS

class Categories{
    private $db;
    private $selectcat;
    public function __construct($db){

    $this->db = $db;
    
    $this->selectcat = $db->prepare("select * from categorie c where c.id=:id");

    }

    public function selectcat($id){
        $this->selectcat->execute(array(':id'=>$id));
        if ($this->selectcat->errorCode()!=0){
        print_r($this->selectcat->errorInfo());
        }
        return $this->selectcat->fetchAll();
    }

}

?>