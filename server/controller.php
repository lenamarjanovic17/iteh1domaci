<?php
include "korisnikServis.php";
include "broker.php";
include "util.php";

class Controller{

    private $korisnikServis;

    public function __construct(){
        $korisnikServis=new KorisnikServis(Broker::getBroker());
    }

    public function izvrsi(){
        $akcija=($_SERVER['REQUEST_METHOD']=="POST")?$_POST["akcija"]:$_GET["akcija"];
        try {
           
            if($akcija=="vratiKorisnike"){
                return $this->vratiOdgovor($this->korisnikServis->vratiSve());
            }
            if($akcija=='kreirajKorisnika'){
                $this->korisnikServis->kreiraj($_POST["ime"],$_POST["prezime"],$_POST["prosekPrimanja"],$_POST["period"]);
                $this->vratiOdgovor();
            }
            if($akcija=='izmeniKorisnika'){
                $this->korisnikServis->izmeni($_POST['id'],$_POST["ime"],$_POST["prezime"],$_POST["prosekPrimanja"],$_POST["period"]);
                $this->vratiOdgovor();
            }
            if($akcija=='obrisiKorisnika'){
                $this->korisnikServis->obrisi($_POST['id']);
                $this->vratiOdgovor();
            }
            return json_encode($this->vratiGresku("Metoda nije podrzana"));
        } catch (Exception $ex) {
            return json_encode($this->vratiGresku($ex->getMessage()));
        }
    }
     private function vratiOdgovor($podaci){
        if(!isset($podaci)){
            return[
                "status"=>true,
            ];
        }
        return[
            "status"=>true,
            "data"=>$podaci
        ];
    }
     private function vratiGresku($greska){
        return[
            "status"=>false,
            "error"=>$greska
        ];
    }
}

$controller=new Controller();

?>