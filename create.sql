CREATE TABLE Modele (
    nomModele VARCHAR2(100),
    nbPilotesMin NUMBER(3,0),
    rayonMax NUMBER(7,0),
    CONSTRAINT cPrimaryModele PRIMARY KEY (nomModele)
);

CREATE TABLE Avion (
  numAvion NUMBER(7,0),
  nomModele VARCHAR2(100) NOT NULL,
  capacite NUMBER(5,0),
  nbEconomique NUMBER(4,0),
  nbPremiere NUMBER(4,0),
  nbAffaire NUMBER(4,0),
  CONSTRAINT cPrimaryAvion PRIMARY KEY (numAvion),
  CONSTRAINT cForeignAvion FOREIGN KEY (nomModele) REFERENCES Modele(nomModele),
  CONSTRAINT cCapaciteAvion CHECK (capacite = (nbEconomique + nbPremiere + nbAffaire))
);

CREATE TABLE Vol (
  numVol NUMBER(10,0),
  numAvion NUMBER(7,0) NOT NULL,
  origine VARCHAR2(100),
  destination VARCHAR2(100),
  heureDep DATE,
  jourDep DATE,
  heureAr DATE,
  jourAr DATE,
  distance NUMBER(6,0),
  volTermine NUMBER(1,0),
  nbPilotesMin NUMBER(3,0),
  CONSTRAINT cPrimaryVol PRIMARY KEY (numVol),
  CONSTRAINT cForeignVol FOREIGN KEY (numAvion) REFERENCES Avion(numAvion),
  CONSTRAINT cVolTermine CHECK (volTermine IN (0, 1))
);
--pour Modele.nomModele = Avion.nomModele et Avion.nomAvion = Vol.nomAvion Modele.nbPilotesMin <= Vol.nbPilotesMin

CREATE TABLE Place (
  numPlace NUMBER(5,0),
  numAvion NUMBER(7,0) NOT NULL,
  classe VARCHAR2(100),
  position VARCHAR(7),
  CONSTRAINT cPrimaryPlace PRIMARY KEY (numPlace),
  CONSTRAINT cForeignPlace FOREIGN KEY (numAvion) REFERENCES Avion(numAvion),
  CONSTRAINT cClasse CHECK (classe IN ('ECONOMIQUE', 'PREMIERE', 'AFFAIRE')),
  CONSTRAINT cPosition CHECK (position IN ('HUBLOT', 'COULOIR', 'CENTRE'))
);

CREATE TABLE PlaceVol (
  numVol NUMBER(10,0),
  numPlace NUMBER(5,0),
  CONSTRAINT cPrimaryPlaceVol PRIMARY KEY (numVol,numPlace),
  CONSTRAINT cForeign1PlaceVol FOREIGN KEY (numVol) REFERENCES Vol(numVol),
  CONSTRAINT cForeign2PlaceVol FOREIGN KEY (numPlace) REFERENCES Place(numPlace)
);


CREATE TABLE Client (
  numClient NUMBER(11,0),
  numPasseport NUMBER(20,0),
  nom VARCHAR2(100),
  prenom VARCHAR2(100),
  adrNum NUMBER(8,0),
  adrRue VARCHAR2(100),
  adrCodePostal NUMBER(5,0),
  adrVille VARCHAR2(100),
  adrPays VARCHAR2(100),
  CONSTRAINT cPrimaryClient PRIMARY KEY (numClient)
);

CREATE TABLE Reservation (
  numReservation NUMBER(14,0),
  numClient NUMBER(11,0) NOT NULL,
  numVol NUMBER(10,0) NOT NULL,
  numPlace NUMBER(5,0) NOT NULL,
  dateReservation DATE,
  prix NUMBER(9,2),
  CONSTRAINT cPrimaryReservation PRIMARY KEY (numReservation),
  CONSTRAINT cForeign1Reservation FOREIGN KEY (numClient) REFERENCES Client(numClient),
  CONSTRAINT cForeign2Reservation FOREIGN KEY (numVol, numPlace) REFERENCES PlaceVol(numVol, numPlace)
);

CREATE TABLE Pilote (
  numPilote NUMBER(11,0),
  nom VARCHAR2(100),
  prenom VARCHAR2(100),
  adrNum NUMBER(8,0),
  adrRue VARCHAR2(100),
  adrCodePostal NUMBER(5,0),
  adrVille VARCHAR2(100),
  adrPays VARCHAR2(100),
  nbHeuresVolTotal NUMBER(6,0),
  CONSTRAINT cPrimaryPilote PRIMARY KEY (numPilote)
);

CREATE TABLE MembrePilote (
  numPilote NUMBER(11,0),
  numVol NUMBER(10,0),
  CONSTRAINT cPrimaryMembrePilote PRIMARY KEY (numPilote, numVol),
  CONSTRAINT cForeign2MembrePilote FOREIGN KEY (numPilote) REFERENCES Pilote(numPilote),
  CONSTRAINT cForeign1MembrePilote FOREIGN KEY (numVol) REFERENCES Vol(numVol)
);

CREATE TABLE Langue (
  libLangue VARCHAR2(100),
  CONSTRAINT cPrimaryLangue PRIMARY KEY (libLangue)
);

CREATE TABLE Hotesse (
  numHotesse NUMBER(11,0),
  nom VARCHAR2(100),
  prenom VARCHAR2(100),
  adrNum NUMBER(8,0),
  adrRue VARCHAR2(100),
  adrCodePostal NUMBER(5,0),
  adrVille VARCHAR2(100),
  adrPays VARCHAR2(100),
  nbHeuresVolTotal NUMBER(6,0),
  CONSTRAINT cPrimaryHotesse PRIMARY KEY (numHotesse)
);

CREATE TABLE ParleLangue (
  numHotesse NUMBER,
  libLangue VARCHAR2(100),
  CONSTRAINT cPrimaryParleLangue PRIMARY KEY (numHotesse, libLangue),
  CONSTRAINT cForeign1ParleLangue FOREIGN KEY (libLangue) REFERENCES Langue(libLangue),
  CONSTRAINT cForeign2ParleLangue FOREIGN KEY (numHotesse) REFERENCES Hotesse(numHotesse)
);

CREATE TABLE MembreHotesse (
  numHotesse NUMBER(11,0),
  numVol NUMBER(10,0),
  CONSTRAINT cPrimaryMembreHotesse PRIMARY KEY (numHotesse, numVol),
  CONSTRAINT cForeign2MembreHotesse FOREIGN KEY (numHotesse) REFERENCES Hotesse(numHotesse),
  CONSTRAINT cForeign1MembreHotesse FOREIGN KEY (numVol) REFERENCES Vol(numVol)
);

--CONSTRAINTS
--contraintes sur le nombre mini de places par avion pour chaque classe
--avion.capacité >= vol.capacité
--avion.rayon d''action >= vol.distance
