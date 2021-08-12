DROP TABLE IF EXISTS plants, pots, crops, audits, users, locations;

CREATE TABLE plants (
  id INT NOT NULL AUTO_INCREMENT,
  plant_name VARCHAR(50),
  plant_variant VARCHAR(50),
  plant_color VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE pots (
  id INT NOT NULL AUTO_INCREMENT,
  pot_type VARCHAR(50),
  pot_size VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE crops (
  id INT NOT NULL AUTO_INCREMENT,
  plant_id INT(11) DEFAULT NULL,
  pot_id INT(11) DEFAULT NULL,
  location_id INT(11) DEFAULT NULL,
  planted_date date DEFAULT NULL,
  projected_date date DEFAULT NULL,
  available_date date DEFAULT NULL,
  planted_quantity int(11) DEFAULT NULL,
  available_quantity int(11) DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE audits (
  id int(11) unsigned NOT NULL AUTO_INCREMENT,
  user_id varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  delta text COLLATE utf8_unicode_ci,
  date_time timestamp NULL DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT NOT NULL AUTO_INCREMENT,
  username VARCHAR(50),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE locations (
  id INT NOT NULL AUTO_INCREMENT,
  location_id VARCHAR(5),
  location_description VARCHAR(50),
  PRIMARY KEY (id)
);

INSERT INTO users
  (username, first_name, last_name)
VALUES
  ("Robert.Parker","Robert","Parker"),
  ("Leah.Heath","Leah","Heath"),
  ("Andrew.Mendez","Andrew","Mendez"),
  ("Joseph.Oliver","Joseph","Oliver"),
  ("April.Fisher","April","Fisher"),
  ("Andrew.Morris","Andrew","Morris"),
  ("Sabrina.Wilson","Sabrina","Wilson"),
  ("Christine.Larson","Christine","Larson"),
  ("Robert.Rodgers","Robert","Rodgers"),
  ("Kenneth.Hale","Kenneth","Hale");

INSERT INTO pots
  (pot_type, pot_size)
VALUES
  ("Flat","18-ct"),
  ("Basket",NULL),
  ("Round","17cm");

INSERT INTO locations
  (location_id, location_description)
VALUES
  ("01","Greenhouse - 1"),
  ("02","Greenhouse - 2"),
  ("03","Greenhouse - 3"),
  ("04","Greenhouse - 4"),
  ("05","Greenhouse - 5"),
  ("06","Greenhouse - 6"),
  ("07","Greenhouse - 7"),
  ("08","Greenhouse - 8"),
  ("09","Greenhouse - 9"),
  ("10","Greenhouse - 10"),
  ("11","Greenhouse - 11"),
  ("12","Greenhouse - 12"),
  ("13","Greenhouse - 13"),
  ("14","Greenhouse - 14"),
  ("15","Greenhouse - 15"),
  ("16","Greenhouse - 16"),
  ("17","Greenhouse - 17"),
  ("18","Greenhouse - 18"),
  ("19","Greenhouse - 19"),
  ("20","Greenhouse - 20"),
  ("21","Greenhouse - 21"),
  ("22","Greenhouse - 22"),
  ("23","Greenhouse - 23"),
  ("24","Greenhouse - 24"),
  ("25","Greenhouse - 25"),
  ("26","Greenhouse - 26"),
  ("27","Greenhouse - 27"),
  ("28","Greenhouse - 28"),
  ("29","Greenhouse - 29"),
  ("30","Greenhouse - 30"),
  ("31","Greenhouse - 31"),
  ("32","Greenhouse - 32"),
  ("33","Greenhouse - 33");

INSERT INTO plants
  (plant_name, plant_variant, plant_color)
VALUES
  ("Pansy","Colossus","Blue Blotch"),
  ("Pansy","Colossus","Mix Blotch"),
  ("Pansy","Colossus","Ocean Blotch"),
  ("Pansy","Colossus","Purple Blotch"),
  ("Pansy","Colossus","Red Blotch"),
  ("Pansy","Colossus","Rose Blotch"),
  ("Pansy","Colossus","White Blotch"),
  ("Pansy","Colossus","Yellow Blotch"),
  ("Pansy","Delta Pure","Beaconsfield"),
  ("Pansy","Delta Pure","Citrus Mix"),
  ("Pansy","Delta Pure","Coolwater Mix"),
  ("Pansy","Delta Pure","Deep Orange"),
  ("Pansy","Delta Pure","Lemon"),
  ("Pansy","Delta Pure","Light Blue"),
  ("Pansy","Delta Pure","Mix"),
  ("Pansy","Delta Pure","Pink Shades"),
  ("Pansy","Delta Pure","Primrose"),
  ("Pansy","Delta Pure","Red"),
  ("Pansy","Delta Pure","Rose"),
  ("Pansy","Delta Pure","True Blue"),
  ("Pansy","Delta Pure","Violet"),
  ("Pansy","Delta Pure","White"),
  ("Pansy","Delta Pure","Wine &amp; Cheese"),
  ("Pansy","Delta Pure","Yellow"),
  ("Pansy","Imperial","Antique Shades"),
  ("Snapdragon","Snaptastic","Magenta"),
  ("Snapdragon","Snaptastic","Mix"),
  ("Snapdragon","Snaptastic","Orange Flame"),
  ("Snapdragon","Snaptastic","Pink"),
  ("Snapdragon","Snaptastic","Red"),
  ("Snapdragon","Snaptastic","Yellow"),
  ("Snapdragon","Snaptini","Mix"),
  ("Snapdragon","Snaptini","Peach"),
  ("Snapdragon","Snaptini","Red"),
  ("Snapdragon","Snaptini","Sunglow"),
  ("Snapdragon","Snaptini","White"),
  ("Snapdragon","Snaptini","Yellow"),
  ("Viola","Penny","Blue"),
  ("Viola","Penny","Citrus Mix"),
  ("Viola","Penny","Jump Up Mix"),
  ("Viola","Penny","Jump Up Orange"),
  ("Viola","Penny","Jump Up Yellow"),
  ("Viola","Penny","Orange"),
  ("Viola","Penny","Violet"),
  ("Viola","Penny","White"),
  ("Viola","Penny","Yellow"),
  ("Pansy","FreeFall XL","Azure Blue"),
  ("Pansy","FreeFall XL","Golden Yellow"),
  ("Pansy","FreeFall XL","Mix"),
  ("Pansy","FreeFall XL","Purple Face"),
  ("Dusty Miller","Dusty Miller","Silver Dust"),
  ("Dianthus","Dianthus","Ideal Mix"),
  ("Dianthus","Dianthus","Telstar Scarlet"),
  ("Dianthus","Dianthus","Telstar White"),
  ("Cabbage","Pigeon","Red"),
  ("Cabbage","Pigeon","White"),
  ("Kale","Glamour","Red"),
  ("Kale","Nagoya","Red"),
  ("Kale","Nagoya","White"),
  ("Kale","Peacock","Red"),
  ("Kale","Peacock","White"),
  ("Kale","Red Bar","Red Bar"),
  ("Swiss Chard","Bright Lights","Bright Lights");