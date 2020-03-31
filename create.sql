CREATE TABLE Modele (
    nomModele VARCHAR2(100) NOT NULL,
    nbPilotesMin NUMBER,
    rayonMax NUMBER,
    PRIMARY KEY (nomModele)
)

CREATE TABLE Avion (
  numAvion NUMBER NOT NULL,
  nomModele VARCHAR2(100) NOT NULL,
  capacite NUMBER,
  nbPlacesEco NUMBER,
  nbPlacesPremiere NUMBER,
  nbPlacesAffaire NUMBER,
  PRIMARY KEY (numAvion),
  FOREIGN KEY (nomModele) REFERENCES Modele(nomModele)
)

CREATE TABLE Vol (
  numVol NUMBER NOT NULL,
  numAvion NUMBER NOT NULL,
  origine VARCHAR2(100),
  destination VARCHAR2(100),
  heureDep TIME,
  jourDep DATE,
  heureAr TIME,
  jourAr DATE,
  distance NUMBER,
  volTermine BOOLEAN,
  nbPilotesMin NUMBER,
  PRIMARY KEY (numVol),
  FOREIGN KEY (numAvion) REFERENCES Avion(numAvion)
)

CREATE TABLE Place (
  numPlace NUMBER NOT NULL,
  numAvion NUMBER NOT NULL,
  classe VARCHAR2(100),
  position NUMBER,
  PRIMARY KEY (numPlace),
  FOREIGN KEY (numAvion) REFERENCES Avion(numAvion)
)

CREATE TABLE PlaceVol (
  numVol NUMBER NOT NULL,
  numPlace NUMBER NOT NULL,
  PRIMARY KEY (numVol,numero_place),
  FOREIGN KEY (numVol) REFERENCES Vol(numVol),
  FOREIGN KEY (numPlace) REFERENCES Place(numPlace)
)


CREATE TABLE Client (
  numClient NUMBER,
  numPasseport NUMBER,
  nom VARCHAR2(100),
  prenom VARCHAR2(100),
  adrNum NUMBER,
  adrRue VARCHAR2(100),
  adrCodePostal NUMBER,
  adrVille VARCHAR2(100),
  adrPays VARCHAR2(100),
  PRIMARY KEY (numClient)
)

CREATE TABLE Reservation (
  numReservation NUMBER NOT NULL,
  numClient NUMBER NOT NULL
  numVol NUMBER NOT NULL,
  numPlace NUMBER NOT NULL,
  dateReservation DATE,
  prix DECIMAL,
  PRIMARY KEY (numReservation),
  FOREIGN KEY (numClient) REFERENCES Client(numClient),
  FOREIGN KEY (numVol, numPlace) REFERENCES PlaceVol(numVol, numPlace)
)

CREATE TABLE Pilote (
  numPilote NUMBER NOT NULL,
  nom VARCHAR2(100),
  prenom VARCHAR2(100),
  adrNum NUMBER,
  nbVols VARCHAR2(100),
  nbHeuresVol NUMBER,
  PRIMARY KEY (numPilote)
)

CREATE TABLE Langue (
  libelle VARCHAR(100) NOT NULL,
  PRIMARY KEY (libelle)
)

CREATE TABLE Hotesse (
  numHotesse NUMBER NOT NULL,
  nom VARCHAR2(100),
  prenom VARCHAR2(100),
  adrNum NUMBER,
  nbHeuresVol NUMBER,
  PRIMARY KEY (numHotesse)
)

--CONSTRAINTS
--contraintes sur le nombre mini de places par avion pour chaque classe
--position = {hublot, couloir, centre}
--avion.capacité >= vol.capacité
--avion.rayon d''action >= vol.distance
