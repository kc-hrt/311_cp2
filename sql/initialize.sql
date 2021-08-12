DROP TABLE IF EXISTS `crops`, `locations`, `plants`, `pots`, `users`;

-- Create Tables
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` varchar(5) DEFAULT NULL,
  `location_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_name` varchar(50) DEFAULT NULL,
  `plant_variant` varchar(50) DEFAULT NULL,
  `plant_color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `pots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pot_type` varchar(50) DEFAULT NULL,
  `pot_size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `crops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_id` int(11) DEFAULT NULL,
  `pot_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `planted_date` date DEFAULT NULL,
  `projected_date` date DEFAULT NULL,
  `available_date` date DEFAULT NULL,
  `planted_quantity` int(11) DEFAULT NULL,
  `available_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plant_id` (`plant_id`),
  KEY `pot_id` (`pot_id`),
  KEY `location_id` (`location_id`),
  FOREIGN KEY (`plant_id`) REFERENCES `plants` (`id`),
  FOREIGN KEY (`pot_id`) REFERENCES `pots` (`id`),
  FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`)
);

-- Populate Tables with Test Data
INSERT INTO `locations` (`location_id`, `location_description`)
VALUES
	('GH01','Greenhouse - 1'),
	('GH02','Greenhouse - 2'),
	('GH03','Greenhouse - 3'),
	('GH04','Greenhouse - 4'),
	('GH05','Greenhouse - 5'),
	('GH06','Greenhouse - 6'),
	('GH07','Greenhouse - 7'),
	('GH08','Greenhouse - 8'),
	('GH09','Greenhouse - 9'),
	('GH10','Greenhouse - 10'),
	('GH11','Greenhouse - 11'),
	('GH12','Greenhouse - 12'),
	('GH13','Greenhouse - 13'),
	('GH14','Greenhouse - 14'),
	('GH15','Greenhouse - 15'),
	('GH16','Greenhouse - 16'),
	('GH17','Greenhouse - 17'),
	('GH18','Greenhouse - 18'),
	('GH19','Greenhouse - 19'),
	('GH20','Greenhouse - 20'),
	('GH21','Greenhouse - 21'),
	('GH22','Greenhouse - 22'),
	('GH23','Greenhouse - 23'),
	('GH24','Greenhouse - 24'),
	('GH25','Greenhouse - 25'),
	('GH26','Greenhouse - 26'),
	('GH27','Greenhouse - 27'),
	('GH28','Greenhouse - 28'),
	('GH29','Greenhouse - 29'),
	('GH30','Greenhouse - 30'),
	('GH31','Greenhouse - 31'),
	('GH32','Greenhouse - 32'),
	('GH33','Greenhouse - 33');

INSERT INTO `plants` (`plant_name`, `plant_variant`, `plant_color`)
VALUES
	('Pansy','Colossus','Blue Blotch'),
	('Pansy','Colossus','Mix Blotch'),
	('Pansy','Colossus','Ocean Blotch'),
	('Pansy','Colossus','Purple Blotch'),
	('Pansy','Colossus','Red Blotch'),
	('Pansy','Colossus','Rose Blotch'),
	('Pansy','Colossus','White Blotch'),
	('Pansy','Colossus','Yellow Blotch'),
	('Pansy','Delta Pure','Beaconsfield'),
	('Pansy','Delta Pure','Citrus Mix'),
	('Pansy','Delta Pure','Coolwater Mix'),
	('Pansy','Delta Pure','Deep Orange'),
	('Pansy','Delta Pure','Lemon'),
	('Pansy','Delta Pure','Light Blue'),
	('Pansy','Delta Pure','Mix'),
	('Pansy','Delta Pure','Pink Shades'),
	('Pansy','Delta Pure','Primrose'),
	('Pansy','Delta Pure','Red'),
	('Pansy','Delta Pure','Rose'),
	('Pansy','Delta Pure','True Blue'),
	('Pansy','Delta Pure','Violet'),
	('Pansy','Delta Pure','White'),
	('Pansy','Delta Pure','Wine &amp; Cheese'),
	('Pansy','Delta Pure','Yellow'),
	('Pansy','Imperial','Antique Shades'),
	('Snapdragon','Snaptastic','Magenta'),
	('Snapdragon','Snaptastic','Mix'),
	('Snapdragon','Snaptastic','Orange Flame'),
	('Snapdragon','Snaptastic','Pink'),
	('Snapdragon','Snaptastic','Red'),
	('Snapdragon','Snaptastic','Yellow'),
	('Snapdragon','Snaptini','Mix'),
	('Snapdragon','Snaptini','Peach'),
	('Snapdragon','Snaptini','Red'),
	('Snapdragon','Snaptini','Sunglow'),
	('Snapdragon','Snaptini','White'),
	('Snapdragon','Snaptini','Yellow'),
	('Viola','Penny','Blue'),
	('Viola','Penny','Citrus Mix'),
	('Viola','Penny','Jump Up Mix'),
	('Viola','Penny','Jump Up Orange'),
	('Viola','Penny','Jump Up Yellow'),
	('Viola','Penny','Orange'),
	('Viola','Penny','Violet'),
	('Viola','Penny','White'),
	('Viola','Penny','Yellow'),
	('Pansy','FreeFall XL','Azure Blue'),
	('Pansy','FreeFall XL','Golden Yellow'),
	('Pansy','FreeFall XL','Mix'),
	('Pansy','FreeFall XL','Purple Face'),
	('Dusty Miller','Dusty Miller','Silver Dust'),
	('Dianthus','Dianthus','Ideal Mix'),
	('Dianthus','Dianthus','Telstar Scarlet'),
	('Dianthus','Dianthus','Telstar White'),
	('Cabbage','Pigeon','Red'),
	('Cabbage','Pigeon','White'),
	('Kale','Glamour','Red'),
	('Kale','Nagoya','Red'),
	('Kale','Nagoya','White'),
	('Kale','Peacock','Red'),
	('Kale','Peacock','White'),
	('Kale','Red Bar','Red Bar'),
	('Swiss Chard','Bright Lights','Bright Lights');

INSERT INTO `pots` (`pot_type`, `pot_size`)
VALUES
	('Flat','18-ct'),
	('Basket',NULL),
	('Round','17cm');

INSERT INTO `users` (`username`, `first_name`, `last_name`)
VALUES
	('Robert.Parker','Robert','Parker'),
	('Leah.Heath','Leah','Heath'),
	('Andrew.Mendez','Andrew','Mendez'),
	('Joseph.Oliver','Joseph','Oliver'),
	('April.Fisher','April','Fisher'),
	('Andrew.Morris','Andrew','Morris'),
	('Sabrina.Wilson','Sabrina','Wilson'),
	('Christine.Larson','Christine','Larson'),
	('Robert.Rodgers','Robert','Rodgers'),
	('Kenneth.Hale','Kenneth','Hale');

INSERT INTO `crops` (
  `plant_id`,
  `pot_id`,
  `location_id`,
  `planted_date`,
  `projected_date`,
  `planted_quantity`
)
VALUES
	('1','1','11','2021-08-02 00:00:00','2021-09-12 00:00:00','327'),
	('2','1','11','2021-08-02 00:00:00','2021-09-12 00:00:00','325'),
  ('3','1','11','2021-08-02 00:00:00','2021-09-12 00:00:00','328'),
  ('4','1','11','2021-08-02 00:00:00','2021-09-12 00:00:00','327'),
  ('5','1','12','2021-08-02 00:00:00','2021-09-12 00:00:00','325'),
  ('6','1','12','2021-08-02 00:00:00','2021-09-12 00:00:00','323'),
  ('7','1','12','2021-08-03 00:00:00','2021-09-12 00:00:00','420'),
  ('8','1','13','2021-08-03 00:00:00','2021-09-12 00:00:00','422');