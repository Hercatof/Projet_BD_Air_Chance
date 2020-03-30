CREATE TABLE Modele (
    nom_modele VARCHAR(100) NOT NULL,
    nombre_pilotes_minimum INT,
    rayon_maximum INT,
    PRIMARY KEY (nom_modele)
)

CREATE TABLE Avion (
  numero_avion INT NOT NULL,
  nom_modele VARCHAR(100) NOT NULL,
  capacite INT,
  nombre_places_eco INT,
  nombre_places_premiere INT,
  nombre_places_affaire INT,
  PRIMARY KEY (numero_avion),
  FOREIGN KEY (nom_modele) REFERENCES Modele(nom_modele)
)

CREATE TABLE Vol (
  numero_vol INT NOT NULL,
  numero_avion INT NOT NULL,
  aeroport_origine VARCHAR(100),
  aeroport_destination VARCHAR(100),
  horaire_date_depart DATE,
  horaire_date_arrivee DATE,
  distance_vol INT,
  terminaison_vol BOOLEAN,
  nombre_pilotes_minimum INT,
  PRIMARY KEY (numero_vol),
  FOREIGN KEY (numero_avion) REFERENCES Avion(numero_avion)
)

CREATE TABLE Place (
  numero_place INT NOT NULL,
  numero_avion INT NOT NULL,
  classe VARCHAR(100),
  position INT,
  PRIMARY KEY (numero_place),
  FOREIGN KEY (numero_avion) REFERENCES Avion(numero_avion)
)

CREATE TABLE Place_Vol (
  numero_vol INT NOT NULL,
  numero_place INT NOT NULL,
  PRIMARY KEY (numero_vol,numero_place),
  FOREIGN KEY (numero_vol) REFERENCES Vol(numero_vol),
  FOREIGN KEY (numero_place) REFERENCES Place(numero_place)
)


CREATE TABLE Client (
  numero_client INT,
  numero_passeport INT,
  nom VARCHAR(100),
  prenom VARCHAR(100),
  adresse_numero INT,
  adresse_rue VARCHAR(100),
  adresse_code_postal INT,
  adresse_ville VARCHAR(100),
  adresse_pays VARCHAR(100),
  PRIMARY KEY (numero_client)
)

CREATE TABLE Reservation (
  numero_reservation INT NOT NULL,
  numero_client INT NOT NULL
  numero_vol INT NOT NULL,
  numero_place INT NOT NULL,
  date_reservation DATE,
  prix DECIMAL,
  PRIMARY KEY (numero_reservation),
  FOREIGN KEY (numero_client) REFERENCES Client(numero_client),
  FOREIGN KEY (numero_vol, numero_place) REFERENCES Place_Vol(numero_vol, numero_place)
)

--TO CHECK
CREATE TABLE Pilote (
  numero_personnel INT NOT NULL,
  nom VARCHAR(100),
  prenom VARCHAR(100),
  adresse_numero INT,
  nombre_vols_total VARCHAR(100),
  nombre_heures_vol_total INT,
  PRIMARY KEY (numero_personnel)
)

CREATE TABLE Langue (
  libelle VARCHAR(100) NOT NULL,
  PRIMARY KEY (libelle)
)

CREATE TABLE Hotesse (
  numero_personnel INT NOT NULL,
  nom VARCHAR(100),
  prenom VARCHAR(100),
  adresse_numero INT,
  nombre_heures_vol_total INT,
  PRIMARY KEY (numero_personnel)
  --est qualifié pour un avion
)

--CONSTRAINTS
--contraintes sur le nombre mini de places par avion pour chaque classe
--position = {hublot, couloir, centre}
--avion.capacité >= vol.capacité
--avion.rayon d''action >= vol.distance
