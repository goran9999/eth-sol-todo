pragma solidity  >=0.4.22 <0.9.0;


contract TodoList{

    uint public brojZadataka  = 0;

    constructor() public {
        kreirajZadatak("Prvi default zadatak!");
    }

    struct Zadatak{
        uint id;
        string tekst;
        bool zavrsen;
    }



    mapping(uint=>Zadatak) public zadaci;

    event DodajZadatak(
        uint id,
        string tekst,
        bool zavrsen
    );
        
    event IzmeniZadatak(
        uint id,
        bool zavrsen
    );

    function kreirajZadatak(string memory _tekst) public {
        brojZadataka++;
        zadaci[brojZadataka]=Zadatak(brojZadataka,_tekst,false);

        emit DodajZadatak(brojZadataka, _tekst, false);
    }

    function promeniStatusZadatka(uint _id) public {
        Zadatak memory _zadatak=zadaci[_id];
        _zadatak.zavrsen=!_zadatak.zavrsen;
        zadaci[_id]=_zadatak;
        emit IzmeniZadatak(_id, _zadatak.zavrsen);
    }

}