CREATE TABLE Modele (
    nomModele VARCHAR2(3),
    nbPilotesMin NUMBER(3,0),
    rayonMax NUMBER(7,0),
    CONSTRAINT cp PRIMARY KEY (nomModele)
);

CREATE TABLE Avion (
  numAvion NUMBER(7,0),
  nomModele VARCHAR2(100) NOT NULL,
  capacite(5,0) NUMBER,
  nbEconomique NUMBER(4,0),
  nbPremiere NUMBER(4,0),
  nbAffaire NUMBER(4,0),
  CONSTRAINT cp PRIMARY KEY (numAvion),
  CONSTRAINT cf FOREIGN KEY (nomModele) REFERENCES Modele(nomModele),
  CONSTRAINT cCapacite CHECK (capacite = (nbEconomique + nbPremiere + nbAffaire))
);

CREATE TABLE Vol (
  numVol NUMBER(10,0),
  numAvion NUMBER(7,0) NOT NULL,
  origine VARCHAR2(100),
  destination VARCHAR2(100),
  heureDep TIME,
  jourDep DATE,
  heureAr TIME,
  jourAr DATE,
  distance NUMBER(6,0),
  volTermine BOOLEAN,
  nbPilotesMin NUMBER(3,0),
  CONSTRAINT cp PRIMARY KEY (numVol),
  CONSTRAINT cf FOREIGN KEY (numAvion) REFERENCES Avion(numAvion)
);
--pour Modele.nomModele = Avion.nomModele et Avion.nomAvion = Vol.nomAvion Modele.nbPilotesMin <= Vol.nbPilotesMin

CREATE TABLE Place (
  numPlace NUMBER(5,0),
  numAvion NUMBER(7,0) NOT NULL,
  classe VARCHAR2(100),
  position VARCHAR(7),
  CONSTRAINT cp PRIMARY KEY (numPlace),
  CONSTRAINT cf FOREIGN KEY (numAvion) REFERENCES Avion(numAvion),
  CONSTRAINT cClasse CHECK (classe IN ('ECONOMIQUE', 'PREMIERE', 'AFFAIRE'),
  CONSTRAINT cPosition CHECK (position IN ('HUBLOT', 'COULOIR', 'CENTRE')
);

CREATE TABLE PlaceVol (
  numVol NUMBER(10,0),
  numPlace NUMBER(5,0),
  CONSTRAINT cp PRIMARY KEY (numVol,numero_place),
  CONSTRAINT cf1 FOREIGN KEY (numVol) REFERENCES Vol(numVol),
  CONSTRAINT cf2 FOREIGN KEY (numPlace) REFERENCES Place(numPlace)
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
  CONSTRAINT cp PRIMARY KEY (numClient)
);

CREATE TABLE Reservation (
  numReservation NUMBER(14,0),
  numClient NUMBER(11,0) NOT NULL,
  numVol NUMBER(10,0) NOT NULL,
  numPlace NUMBER(5,0) NOT NULL,
  dateReservation DATE,
  prix NUMBER(9,2),
  CONSTRAINT cp PRIMARY KEY (numReservation),
  CONSTRAINT cf1 FOREIGN KEY (numClient) REFERENCES Client(numClient),
  CONSTRAINT cf2 FOREIGN KEY (numVol, numPlace) REFERENCES PlaceVol(numVol, numPlace)
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
  CONSTRAINT cp PRIMARY KEY (numPilote)
);

CREATE TABLE Langue (
  libLangue VARCHAR2(100),
  CONSTRAINT cp PRIMARY KEY (libLangue)
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
  CONSTRAINT cp PRIMARY KEY (numHotesse)
);

CREATE TABLE ParleLangue (
  numHotesse NUMBER,
  libLangue VARCHAR2(100),
  CONSTRAINT cp PRIMARY KEY (numHotesse, libLangue),
  CONSTRAINT cf1 FOREIGN KEY (libLangue) REFERENCES Langue(libLangue),
  CONSTRAINT cf2 FOREIGN KEY (numHotesse) rEFERENCES Hotesse(numHotesse)
);

--CONSTRAINTS
--contraintes sur le nombre mini de places par avion pour chaque classe
--avion.capacité >= vol.capacité
--avion.rayon d''action >= vol.distance
