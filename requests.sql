--Requête 1:

Insert Into ModelAvion values ('CoursierAilé', 1, 3000);
Insert Into Model Avion values ('Smaug', 3, 10 000); 
Insert into Avion values (1, 'CoursierAilé', 20, 14, 4, 2);
Insert into Avion values (2, 'Smaug', 50, 35, 10, 5);
Insert into Vol values(1, 1, 'Grenoble', 'Paris', TO_DATE('2015/10/12', 'yyyy/mm/dd'), '12:30:00',  TO_DATE('2020/10/12', 'yyyy/mm/dd'), '14:00:00', 550, FALSE);
Insert into Vol values(
Insert into Pilote values(1,'Lafondu','Robert',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 260,);
Insert into Pilote values(2,'Sainte','Galadrielle',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 200);
Insert into Pilote values(3,'Malou','Eddy',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 100);
Insert into Pilote values(4,'Célère','Jack',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 260);
Insert into Pilote values(5,'Lenouveaunoir','Saruman',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 260);
Insert into Pilote values(6,'Legrisclair','Gandalf',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 1200);
Insert into Pilote values(7,'Monprécieux','Gollum',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 300);
Insert into Pilote values(8,'Sacquet','Bilbon',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 120);
Insert into Hôtesse values(1,'Sacquet','Elendil',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 120);
Insert into Hôtesse values(2,'Javel','Aude',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 120);

Insert into Parle values(1,'Anglais');
Insert into Parle values(1,'Espagnol');
Insert into Parle values(1,'Allemand');
Insert into Parle values(1,'Italien');
Insert into Parle values(1,'Sindarin');
Insert into Parle values(1,'Quenia');

Insert into Parle values(2,'Anglais');
Insert into Parle values(2,'Allemand');
Insert into Parle values(2,'Mandarin');

Insert into MembrePilote values(1, 1);
Insert into MembrePilote values(2, 1);
Insert into MembreHôtesse values(1, 1);
Insert into MembreHôtesse values(2, 1);
 
Insert into Vol values(2, 2, 'Pekin', 'Taïwan', TO_DATE('2016/08/09', 'yyyy/mm/dd'), '10:30:00',  TO_DATE('2020/08/09', 'yyyy/mm/dd'), '18:00:00', 2500, FALSE, 2);
Insert into Vol values(1, 1, 'Grenoble', 'Paris', TO_DATE('2015/10/12', 'yyyy/mm/dd'), '12:30:00',  TO_DATE('2015/10/12', 'yyyy/mm/dd'), '14:00:00', 550, FALSE, 2);

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
--Ceci est une fonction qui prend le numéro d'un vol annulé en paramètre et qui prends en compte le nombre de places de chaque classe 
--dans les avions suivants qui effectuent le même trajet pour savoir si oui ou non il est possible de transférer tous les passagers.
CREATE OR REPLACE FUNCTION TransfertPassagers (NumeroVol in integer, Possible in boolean)
                    RETURN boolean
                    IS

BEGIN

--Select numPlace, numVol, classe as lesplaces from Place natural join PlaceVol natural join Vol 
--where numVol=NumeroVol;
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


--minus 
--(Select numVol from Vol)


--Requête 6:
Select numPlace, numVol, classe from Place natural join PlaceVol natural join Vol
  where (select nom from 
