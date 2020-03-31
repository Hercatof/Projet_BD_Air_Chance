--Requête 2:
UPDATE Vol
SET 		
    numAvion = 2,
	hDepart = '12:30:00',  
	dateArrivee = TO_DATE('2020/10/12', 'yyyy/mm/dd'), 
	hArrivee = '14:00:00',
WHERE numVol=1;


Insert into MembrePilote values(1, 2);
Insert into MembreHôtesse values(2, 1);
Delete from MembrePilote where numVol=1 and numPilote=1;
Delete from MembreHôtesse where numVol=1 and numHôtesse=1;

Delete from Vol where numVol=1;

--Requête 3: 

--A partir de cette question nous utilisons des fonctions qui auraient pour but d'être utilisées par le java pour effectuer les actions demandées.

--Ceci est une fonction qui prend le numéro d'un vol annulé en paramètre et qui prends en compte le nombre de places de chaque classe 
--dans les avions suivants qui effectuent le même trajet pour savoir si oui ou non il est possible de transférer tous les passagers.
CREATE OR REPLACE FUNCTION TransfertPassagers (NumeroVol in integer, Possible in boolean)
                    RETURN boolean
                    IS

BEGIN

--Je récupère dans un premier temps le nombre de places des avions futures remplissant les conditions.
--Je soustrait ensuite à ce résultat le nombre de place déjà prises et le nombre de passager à transférer du précédent avion.
--Si le résultat est supérieur à 0 on peut placer tous les passagers sinon non.
if (
Select (count(nbEco) from model natural join Avion natural join Vol 
where origine=
(select origine from Vol where numVol=NumeroVol)
and count(numPlace) from PlaceVol where numVol=NumeroVol;
destination=
(select destination from Vol where numVol=NumeroVol)
and
(hDepart - (select hDepart from Vol where numVol=NumeroVol)>0 or dateDepart - (select dateDepart from Vol where numVol=1)))
- (select count (numPlace) from Reservation natural join PlaceVol natural join Place 
where Classe='Eco') - (select count(numPlace) from PlaceVol natural join Place where numVol=NumeroVol and Classe='Eco'); < 0)
then RETURN FALSE;

if (
Select (count(nbPremière) from model natural join Avion natural join Vol
where origine=
(select origine from Vol where numVol=NumeroVol)
and
destination=
(select destination from Vol where numVol=NumeroVol)
and
(hDepart - (select hDepart from Vol where numVol=NumeroVol)>0 or dateDepart - (select dateDepart from Vol where numVol=1)))
- (select count (numPlace) from Reservation natural join PlaceVol natural join Place 
where Classe='Premiere') - (select count(numPlace) from PlaceVol natural join Place where numVol=NumeroVol and Classe='Premiere'); < 0)
then RETURN FALSE;

if (
Select (count(nbAffaire) from model as Affaires natural join Avion natural join Vol 
where origine=
(select origine from Vol where numVol=NumeroVol)
and
destination=
(select destination from Vol where numVol=NumeroVol)
and
(hDepart - (select hDepart from Vol where numVol=NumeroVol)>0 or dateDepart - (select dateDepart from Vol where numVol=1)))
- (select count (numPlace) from Reservation natural join PlaceVol natural join Place 
where Classe='Affaire') - (select count(numPlace) from PlaceVol natural join Place where numVol=NumeroVol and Classe="Affaire"); < 0)
then RETURN FALSE;

Return True;

END;

--Requete 4: 

CREATE OR REPLACE FUNCTION TerminaisonVol(NumeroVol in integer, Termine in boolean)
                    RETURN boolean
                    IS

BEGIN
if (select to_char(sysdate,'yyyymmdd hh24:mi:ss') from Dual < concat((select jourAr from Vol where numVol=NumeroVol),(select heureAr from Vol where numVol=NumeroVol))
then Return True;
ELSE Return False;
END;

--Requête 5:

CREATE OR REPLACE FUNCTION AjoutPilote(NumeroVol in integer, NumeroPersonnel in integer)
                    RETURN integer
                    IS

BEGIN
UPDATE MembrePilote
SET    numPilote=NumeroPersonnel
WHERE  numVol=NumeroVol;
RETURN 1;
END;

CREATE OR REPLACE FUNCTION AjoutHôtesse(NumeroVol in integer, NumeroPersonnel in integer)
                    RETURN integer
                    IS

BEGIN
UPDATE MembreHôtesse
SET    numHôtesse=NumeroPersonnel
WHERE  numVol=NumeroVol;
RETURN 1;
END;

--Requête 6:
CREATE OR REPLACE FUNCTION InfoClient(NumeroClient in integer)
                    RETURN integer
                    IS
					
Select numReservation, dateReservation, numClient, numPlace, numVol, dateDepart, heureDep, dateAr, heureAr, classe, Position, prix 
from Place natural join Vol natural join PlaceVol natural join Reservation natural join Client
where numClient=NumeroClient
order by numClient;

RETURN 1;
