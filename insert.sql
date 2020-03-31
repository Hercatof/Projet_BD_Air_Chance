--Modele
INSERT INTO Modele VALUES ('Coursier Ailé', 1, 10000);
INSERT INTO Modele VALUES ('Smaug', 2, 5000);
INSERT INTO Modele VALUES ('Aigle Géant', 1, 1000);
INSERT INTO Modele VALUES ('Pégase', 1, 10000);
INSERT INTO Modele VALUES ('Chimère', 2, 3000);

--Avion
INSERT INTO Avion VALUES (1, 'Coursier Ailé', 40, 22, 10, 8);
INSERT INTO Avion VALUES (2, 'Coursier Ailé', 40, 30, 6, 4);
INSERT INTO Avion VALUES (3, 'Smaug', 100, 50, 30, 20);
INSERT INTO Avion VALUES (4, 'Smaug', 100, 70, 20, 10);
INSERT INTO Avion VALUES (5, 'Aigle Géant', 30, 16, 8, 6);
INSERT INTO Avion VALUES (6, 'Aigle Géant', 30, 20, 6, 4);
INSERT INTO Avion VALUES (7, 'Pégase', 10, 5, 3, 2);
INSERT INTO Avion VALUES (8, 'pégase', 10, 7, 2, 1);
INSERT INTO Avion VALUES (9, 'Chimère', 50, 30, 10, 10);
INSERT INTO Avion VALUES (10, 'Chimère', 50, 35, 10, 5);

--Vol
INSERT INTO Vol VALUES (1, 1, 'Grenoble', 'Paris', TO_DATE('2015/10/12', 'yyyy/mm/dd'), '12:30:00',  TO_DATE('2020/10/12', 'yyyy/mm/dd'), '14:00:00', 550, FALSE);
INSERT INTO Vol VALUES (2, 2, 'Grenoble', 'Chambéry', TO_DATE('2016/08/09', 'yyyy/mm/dd'), '10:30:00',  TO_DATE('2020/08/09', 'yyyy/mm/dd'), '18:00:00', 2500, FALSE, 2);
INSERT INTO Vol VALUES (3, 3, 'Grenoble', 'Annecy', TO_DATE('2015/10/12', 'yyyy/mm/dd'), '12:30:00',  TO_DATE('2015/10/12', 'yyyy/mm/dd'), '14:00:00', 550, FALSE, 2);
--INSERT INTO Vol VALUES (4, 4, 'Grenoble', 'Lyon', , , , , , , );
--INSERT INTO Vol VALUES (5, 5, 'Grenoble', 'Marseille', , , , , , , );
--INSERT INTO Vol VALUES (6, 6, 'Grenoble', 'Toulouse', , , , , , , );
--INSERT INTO Vol VALUES (7, 7, 'Grenoble', 'Nice', , , , , , , );
--INSERT INTO Vol VALUES (8, 8, 'Grenoble', 'Nantes', , , , , , , );
--INSERT INTO Vol VALUES (9, 9, 'Grenoble', 'Ajaccio', , , , , , , );
--INSERT INTO Vol VALUES (10, 10, 'Grenoble', 'Strasbourg', , , , , , , );
--INSERT INTO Vol VALUES (11, 1, 'Paris', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (12, 2, 'Chambéry', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (13, 3, 'Annecy', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (14, 4, 'Lyon', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (15, 5, 'Marseille', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (16, 6, 'Toulouse', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (17, 7, 'Nice', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (18, 8, 'Nantes', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (19, 9, 'Ajaccio', 'Grenoble', , , , , , , );
--INSERT INTO Vol VALUES (20, 10, 'Strasbourg', 'Grenoble', , , , , , , );

--Place
--INSERT INTO Place VALUES ();

--PlaceVol


--Client


--Reservation


--Pilote
INSERT INTO Pilote VALUES (1,'Lafondu','Robert',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 260,);
INSERT INTO Pilote VALUES (2,'Sainte','Galadrielle',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 200);
INSERT INTO Pilote VALUES (3,'Malou','Eddy',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 100);
INSERT INTO Pilote VALUES (4,'Célère','Jack',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 260);
INSERT INTO Pilote VALUES (5,'Lenouveaunoir','Saruman',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 260);
INSERT INTO Pilote VALUES (6,'Legrisclair','Gandalf',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 1200);
INSERT INTO Pilote VALUES (7,'Monprécieux','Gollum',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 300);
INSERT INTO Pilote VALUES (8,'Sacquet','Bilbon',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 120);

--MembrePilote
INSERT INTO MembrePilote VALUES (1, 2);
INSERT INTO MembrePilote VALUES (1, 1);
INSERT INTO MembrePilote VALUES (2, 1);

--Langue
INSERT INTO Langue VALUES('Anglais');
INSERT INTO Langue VALUES('Espagnol');
INSERT INTO Langue VALUES('Allemand');
INSERT INTO Langue VALUES('Italien');
INSERT INTO Langue VALUES('Sindarin');
INSERT INTO Langue VALUES('Quenia');
INSERT INTO Langue VALUES('Mandarin');

--Hotesse
INSERT INTO Hotesse VALUES (1,'Sacquet','Elendil',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 120);
INSERT INTO Hotesse VALUES (2,'Javel','Aude',45,'Avenue de la Charrondière', 74800, 'La Roche sur Foron', 'France', 120);

--ParleLangue
INSERT INTO ParleLangue VALUES (1,'Anglais');
INSERT INTO ParleLangue VALUES (1,'Espagnol');
INSERT INTO ParleLangue VALUES (1,'Allemand');
INSERT INTO ParleLangue VALUES (1,'Italien');
INSERT INTO ParleLangue VALUES (1,'Sindarin');
INSERT INTO ParleLangue VALUES (1,'Quenia');
INSERT INTO ParleLangue VALUES (2,'Anglais');
INSERT INTO ParleLangue VALUES (2,'Allemand');
INSERT INTO ParleLangue VALUES (2,'Mandarin');

--MenbreHotesse
INSERT INTO MembreHotesse VALUES (1, 1);
INSERT INTO MembreHotesse VALUES (2, 1);
INSERT INTO MembreHotesse VALUES (2, 1);
