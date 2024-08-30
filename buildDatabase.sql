DROP TABLE IF EXISTS podkast CASCADE;
DROP TABLE IF EXISTS kategori CASCADE;
DROP TABLE IF EXISTS bruker CASCADE;
DROP TABLE IF EXISTS abonnement CASCADE;

CREATE TABLE kategori (
	KategoriID SERIAL,
	Navn VARCHAR(40),
	PRIMARY KEY(KategoriID)
);

CREATE TABLE podkast (
  PodkastID SERIAL,
  Fengende_navn VARCHAR(60) NOT NULL,
  Kort_beskrivelse VARCHAR(255),
  Spraak VARCHAR(50),
  Utgiver VARCHAR(100),
  Bilde_url VARCHAR(100),
  KategoriID INT,
  PRIMARY KEY(PodkastID),
  CONSTRAINT fk_kategori
		FOREIGN KEY(KategoriID)
		REFERENCES kategori(KategoriID)
		ON DELETE CASCADE
);

CREATE TABLE bruker (
	BrukerID SERIAL,
	Navn VARCHAR(100),
	Epost VARCHAR(100),
	Passord VARCHAR(100),
	PRIMARY KEY(BrukerID)
);

CREATE TABLE abonnement (
	PodkastID INT,
	BrukerID INT,
	CONSTRAINT fk_podkast
		FOREIGN KEY(PodkastID)
		REFERENCES podkast(PodkastID),
	CONSTRAINT fk_bruker
		FOREIGN KEY(BrukerID)
		REFERENCES bruker(BrukerID)
		ON DELETE CASCADE
);

INSERT INTO kategori (kategoriid, navn)
VALUES 
(
	DEFAULT,
	'Underholdning'
), 
(
	DEFAULT,
	'Skrekk'
);

INSERT INTO bruker (brukerid, navn, epost, passord)
VALUES 
(
	DEFAULT,
	'Lars Monsen',
	'Villmann@skogselsker.no',
	'JegElskerSkogen123'
),
(
	DEFAULT,
	'Line Monsen',
	'Ekspedisjon@antarktis.no',
	'HvorDroMannenMin123'
);

INSERT INTO podkast (podkastid, fengende_navn, kort_beskrivelse, spraak, utgiver, bilde_url, kategoriid)
VALUES (
	DEFAULT,
	'Villmannen',
	'En eventyrlig podkast med skogens mann',
	'Norsk',
	'Podkast senter 123',
	'https://bildeavlarsern.no',
	1
),
(
	DEFAULT,
	'Livet på Arktis',
	'En eventyrlig podkast med isens dronning',
	'Engelsk',
	'Podkast senter 123',
	'https://bildeavLine.no',
	2
);

INSERT INTO abonnement (podkastid, brukerid)
VALUES 
(
	1,
	1
),
(
	2,
	2
);