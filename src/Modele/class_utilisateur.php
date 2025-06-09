<?php

// Ne pas toucher ! NE RIEN CHANGER POUR LE MOMENTS

class Utilisateur{
    
    private $db;
    private $insert;
    private $connect;

    public function __construct($db){
        $this->db = $db;

        $this->insert = $this->db->prepare("insert into utilisateur(email, mdp, nom, prenom) values (:email, :mdp, :nom, :prenom)"); // Étape 2}
        $this->connect = $this->db->prepare("select email, mdp from utilisateur where email=:email");

    }

    public function insert($email, $mdp, $nom, $prenom){ // Étape 3
        $r = true;
        $this->insert->execute(array(':email'=>$email, ':mdp'=>$mdp,':nom'=>$nom, ':prenom'=>$prenom));
        if ($this->insert->errorCode()!=0){
        print_r($this->insert->errorInfo());
        $r=false;
        }
        return $r;
    }

    public function connect($email){
        $this->connect->execute(array(':email'=>$email));
        if ($this->connect->errorCode()!=0){
        print_r($this->connect->errorInfo());
        }
        return $this->connect->fetch();
    }

}