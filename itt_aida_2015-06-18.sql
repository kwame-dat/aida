# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 192.168.0.2 (MySQL 5.1.73)
# Database: itt_aida
# Generation Time: 2015-06-18 12:32:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`adminId`, `userName`, `password`)
VALUES
	(1,'explorerone','password');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table as_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `as_comments`;

CREATE TABLE `as_comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `posted_by` int(11) NOT NULL,
  `posted_by_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `post_time` datetime NOT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `as_comments` WRITE;
/*!40000 ALTER TABLE `as_comments` DISABLE KEYS */;

INSERT INTO `as_comments` (`comment_id`, `posted_by`, `posted_by_name`, `comment`, `post_time`)
VALUES
	(1,2,'itechytony','hi','2014-11-19 00:08:20'),
	(2,2,'itechytony','hello world!','2015-01-04 02:33:25');

/*!40000 ALTER TABLE `as_comments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table as_login_attempts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `as_login_attempts`;

CREATE TABLE `as_login_attempts` (
  `id_login_attempts` int(11) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `attempt_number` int(11) NOT NULL DEFAULT '1',
  `date` date NOT NULL,
  PRIMARY KEY (`id_login_attempts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `as_login_attempts` WRITE;
/*!40000 ALTER TABLE `as_login_attempts` DISABLE KEYS */;

INSERT INTO `as_login_attempts` (`id_login_attempts`, `ip_addr`, `attempt_number`, `date`)
VALUES
	(10,'127.0.0.1',3,'2014-12-30'),
	(11,'80.229.23.220',1,'2015-01-07'),
	(12,'160.9.42.63',1,'2015-01-17'),
	(13,'160.9.42.63',1,'2015-03-03');

/*!40000 ALTER TABLE `as_login_attempts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table as_social_logins
# ------------------------------------------------------------

DROP TABLE IF EXISTS `as_social_logins`;

CREATE TABLE `as_social_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'email',
  `provider_id` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table as_user_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `as_user_details`;

CREATE TABLE `as_user_details` (
  `id_user_details` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `first_name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(35) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_user_details`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `as_user_details` WRITE;
/*!40000 ALTER TABLE `as_user_details` DISABLE KEYS */;

INSERT INTO `as_user_details` (`id_user_details`, `user_id`, `first_name`, `last_name`, `phone`, `address`)
VALUES
	(1,2,'Tony','Ampomah','07598431497','142 Fifth Ave, York '),
	(5,6,'Tony','Ampomah','07598 431497','Fifth Avenue'),
	(6,7,'admin','admin','',''),
	(7,8,'Demo','Uni','','');

/*!40000 ALTER TABLE `as_user_details` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table as_user_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `as_user_roles`;

CREATE TABLE `as_user_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `as_user_roles` WRITE;
/*!40000 ALTER TABLE `as_user_roles` DISABLE KEYS */;

INSERT INTO `as_user_roles` (`role_id`, `role`)
VALUES
	(1,'user'),
	(2,'editor'),
	(3,'admin');

/*!40000 ALTER TABLE `as_user_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table as_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `as_users`;

CREATE TABLE `as_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `password_reset_key` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_reset_confirmed` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `password_reset_timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `register_date` date NOT NULL,
  `user_role` int(4) NOT NULL DEFAULT '1',
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `banned` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `as_users` WRITE;
/*!40000 ALTER TABLE `as_users` DISABLE KEYS */;

INSERT INTO `as_users` (`user_id`, `email`, `username`, `password`, `confirmation_key`, `confirmed`, `password_reset_key`, `password_reset_confirmed`, `password_reset_timestamp`, `register_date`, `user_role`, `last_login`, `banned`)
VALUES
	(1,'admin@dev.aid.com','admin','$2a$13$Y1ikK38jObs0InjHMZGFx.E1Z.8JuJkCoh.kRgbfst98wAgqKgBay','','Y','','N','0000-00-00 00:00:00','2014-11-18',3,'0000-00-00 00:00:00','N'),
	(2,'itechytony@gmail.com','itechytony','$2a$13$Y1ikK38jObs0InjHMZGFx.dCVWt/ODCWN6Yc/q2hGE.HYMiixBcHK','b91df42b0f5904700026f4b658d6a631','Y','','Y','2014-12-30 18:03:14','2014-11-18',3,'2015-05-06 17:17:31','N'),
	(6,'tony@itechytony.com','tony','$2a$13$Y1ikK38jObs0InjHMZGFx.Ki34bUUk6csVMt4TmmvS3811VNOWljy','','Y','','N','0000-00-00 00:00:00','2015-01-07',1,'2015-01-07 21:01:45','Y'),
	(7,'admin@itechytony.com','aida_admin','$2a$13$Y1ikK38jObs0InjHMZGFx.tBfwPjQy0EVWdpLi6wgN9GT5PvCuaM.','','Y','','N','0000-00-00 00:00:00','2015-01-08',3,'0000-00-00 00:00:00','N'),
	(8,'demo@leedsbeck.ac.uk','demo','$2a$13$Y1ikK38jObs0InjHMZGFx.tBfwPjQy0EVWdpLi6wgN9GT5PvCuaM.','','Y','','N','0000-00-00 00:00:00','2015-01-08',1,'0000-00-00 00:00:00','Y');

/*!40000 ALTER TABLE `as_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table country_animals
# ------------------------------------------------------------

DROP TABLE IF EXISTS `country_animals`;

CREATE TABLE `country_animals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) NOT NULL,
  `animals` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `country_animals` WRITE;
/*!40000 ALTER TABLE `country_animals` DISABLE KEYS */;

INSERT INTO `country_animals` (`id`, `country`, `animals`)
VALUES
	(1,'Australia','kangaroo'),
	(2,'China','dragon'),
	(3,'England','lion'),
	(4,'India','tiger'),
	(5,'America','eagle'),
	(6,'Cambodia','snake'),
	(7,'Argentinia','bull');

/*!40000 ALTER TABLE `country_animals` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table explorers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `explorers`;

CREATE TABLE `explorers` (
  `explorerId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `userName` varchar(15) NOT NULL,
  `password` varchar(10) NOT NULL,
  `tours` varchar(29) NOT NULL,
  `bio` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`explorerId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `explorers` WRITE;
/*!40000 ALTER TABLE `explorers` DISABLE KEYS */;

INSERT INTO `explorers` (`explorerId`, `firstName`, `lastName`, `dob`, `email`, `address`, `city`, `state`, `zipcode`, `userName`, `password`, `tours`, `bio`)
VALUES
	(1,'Jackie','Smith','1985-07-10','jackiesmith@somewhere.com','123 Main St.','Somewhere','CA','90123','jackies','password','1,3,5','I\'ve lived in CA for over 20 years!'),
	(2,'David','Jones','1965-11-28','davidjones@somewhere.com','456 Jones Ave.','Smallville','CA','90456','davidj','password','3,5,8','I love riding bicycles!'),
	(3,'Jenny','Flores','1950-02-03','jennyf@somewhere.com','987 Topeka Ave.','Bigtown','CA','90543','jennyf','password','2,3,4,','I\'m heading to the beach!');

/*!40000 ALTER TABLE `explorers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shipping` decimal(4,2) DEFAULT NULL,
  `img` varchar(30) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;

INSERT INTO `items` (`id`, `name`, `price`, `category`, `quantity`, `shipping`, `img`, `description`)
VALUES
	(1,'Shimano R064 SPD SL ',41.99,'shoes',5,2.99,'shoes.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(2,'The Cycling Jersey',40.14,'shirts',7,1.99,'shirt.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(3,'Molteni Wool Cycling',52.99,'shirts',12,4.99,'shirt1.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(4,'R1.0 Road Cycling Sh',39.99,'shoes',43,3.99,'shoes1.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(5,'Various Bicycle Labe',2.99,'badges',6,2.99,'badges.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(6,'Set Of Vintage And M',5.99,'badges',7,3.99,'badges1.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels');

/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table Members
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Members`;

CREATE TABLE `Members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `Members` WRITE;
/*!40000 ALTER TABLE `Members` DISABLE KEYS */;

INSERT INTO `Members` (`id`, `email`, `password`)
VALUES
	(1,'tony@leedsmet.ac.uk','secret'),
	(2,'tellisa@hotmail.com','secret'),
	(3,'david@gmail.ac.uk','secret');

/*!40000 ALTER TABLE `Members` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table merchandise
# ------------------------------------------------------------

DROP TABLE IF EXISTS `merchandise`;

CREATE TABLE `merchandise` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `shipping` decimal(4,2) DEFAULT NULL,
  `img` varchar(30) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `merchandise` WRITE;
/*!40000 ALTER TABLE `merchandise` DISABLE KEYS */;

INSERT INTO `merchandise` (`id`, `name`, `price`, `category`, `quantity`, `shipping`, `img`, `description`)
VALUES
	(1,'Shimano R064 SPD SL ',41.99,'shoes',5,2.99,'shoes.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(2,'The Cycling Jersey',40.14,'shirts',7,1.99,'shirt.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(3,'Molteni Wool Cycling',52.99,'shirts',12,4.99,'shirt1.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(4,'R1.0 Road Cycling Sh',39.99,'shoes',43,3.99,'shoes1.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(5,'Various Bicycle Labe',2.99,'badges',6,2.99,'badges.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels'),
	(6,'Set Of Vintage And M',5.99,'badges',7,3.99,'badges1.jpg','Shimano R064 SPD-SL Shoes are entry level shoes that deliver high performance for the enthusiast rider. Glass fibre reinforced nylon outer sole gives an excellent combination of stiffness and compliance for club and sport riders. Synthetic leather upper with highly breathable nylon mesh panels');

/*!40000 ALTER TABLE `merchandise` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table packages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `packages`;

CREATE TABLE `packages` (
  `packageId` int(11) NOT NULL AUTO_INCREMENT,
  `packageTitle` varchar(50) NOT NULL,
  `packageDescription` varchar(4096) NOT NULL,
  `packageGraphic` varchar(20) NOT NULL,
  PRIMARY KEY (`packageId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `packages` WRITE;
/*!40000 ALTER TABLE `packages` DISABLE KEYS */;

INSERT INTO `packages` (`packageId`, `packageTitle`, `packageDescription`, `packageGraphic`)
VALUES
	(1,'Backpack Cal','Explore California our favorite way...by foot! Get outdoors and into the millions of acres of forests, desert, and spectacular scenery that California is famous for. We have a wide range of backpacking tour options, from single day-trips to week long guided excursions. Find a comfortable pair of shoes and come hiking with us! ','back_bug.gif'),
	(2,'California Calm','Looking for a little relaxation? California Calm is our hand-picked collection of incredible California Spas and therapy retreats. Enjoy unbelievable massage treatments, beauty regimens, and active getaways. We\'ve combed the entire state to find the finest spa experiences available...imagine that, we\'ve even made choosing a spa retreat relaxing! ','calm_desc_bug.gif'),
	(3,'California Hotsprings','Let\'s be honest, you have no idea what a hot spring is...do you? Well, we do, and we can\'t wait for you to experience the relaxing warmth of \"nature\'s hot-tubs!\" We offer packages that range from all-inclusive hot spring resorts to camping opportunities next to some of the country\'s last remaining primitive springs.','springs_desc_bug.gif'),
	(4,'Cycle California','Whether you are a hard-core mountain biking enthusiast, or just looking for a cool way to see the many scenic towns and vistas of our great state, Cycle California has a package for you! Explore the thousand of miles of biking trails from Big Sur all the way to the Southern California coast. Packages range from bring-your-own bike to full bike rental and travel days. ','cycle_desc_bug.gif'),
	(5,'From Desert to Sea','Our most wide-ranging tour option! Come explore California from the stunning deserts all the way to our beautiful coast. Along the way you\'ll travel through breathtaking mountain ranges and some of the nation\'s most fertile farmland as you see why California is regarded as the most diverse state in the nation! Come see ALL that California has to offer! ','desert_desc_bug.gif'),
	(6,'Kids California','Over and over again our customer support people would hear, \"but what if we have kids?\" when describing a tour. Then it hit us...why not create tours specifically for kids?! California is an amazing playground for everyone and should be experienced by all. From amazing museums, outstanding parks, Disney, and kid-centered nature experiences, Kids California truly has it all! ','kids_desc_bug.gif'),
	(7,'Nature Watch','If you love the outdoors, nature, and the environment, California is the place for you! Our eco-tours range from watching seals and whales to exploring the desert for rare lizards and fauna. As inspirational as they are educational, our Nature Watch packages bring you the full range of California\'s natural beauty. ','nature_desc_bug.gif'),
	(8,'Snowboard Cali','California has some of the best snowboarding in the US and at Explore California we\'ve combed the runs to offer you the best resorts in the state. We even offer multi-resort packages for those that just can\'t get enough of that pack and grind. See you on the slopes!','snow_desc_bug.gif'),
	(9,'Taste of California','Tour of the wine country? Tour of the olive groves? We couldn\'t decide so we put them together in one of our most amazing tour packages ever. Taste of California immerses you in the serene, romantic lifestyle of the California wine country and olive groves. Along the way you\'ll experience some of the best cuisine in the world, all made from fresh local ingredients by some of the nation\'s most renown chefs. Bon Appetit! ','taste_desc_bug.gif');

/*!40000 ALTER TABLE `packages` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table playlist
# ------------------------------------------------------------

DROP TABLE IF EXISTS `playlist`;

CREATE TABLE `playlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `artist` varchar(30) DEFAULT NULL,
  `album` varchar(30) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `song` varchar(50) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;

INSERT INTO `playlist` (`id`, `name`, `artist`, `album`, `genre`, `rating`, `song`, `image`, `price`, `description`)
VALUES
	(1,'Fast Car','Tracy Chapman','Tracy Chapman ','Folk Rock, Adult Contemporary',5,'fast_car.mp3','tracy.jpg',7.99,'Tracy Chapman is an American singer-songwriter, known for her hits \"Fast Car\" and \"Give Me One Reason\", along with other singles \"Talkin\' \'bout a Revolution\", \"Baby Can I Hold You\", \"Crossroads\", \"New Beginning\" and \"Telling Stories\"'),
	(2,'Dynamite','Taio Cruz','Dynamite','Dance-pop',4,'dynamite.mp3','taio_cruz.jpg',5.99,'Jacob Taio Cruz, known professionally as Taio Cruz, is a British singer-songwriter, record producer, occasional rapper and entrepreneur. In 2008, he released his debut album Departure, which he wrote, arranged and produced himself'),
	(3,'Waves','Mr Probz','The Treatment','R&B',10,'Mr-Probz-Waves.mp3','Mr-probz.jpg',12.99,'Dennis Princewell Stehr, born 15 May 1984, better known by his stage name Mr Probz, is a Dutch singer-songwriter, rapper, producer and actor. He is known for his raps, songs and choruses in both Dutch and English.'),
	(4,'Exodus','Bob Marley','Bob Marley & the Wailers album','Raggae',4,'exodus.mp3','bob_marley.jpg',14.99,'Robert Nesta \"Bob\" Marley OM was a Jamaican reggae singer-songwriter, musician, and guitarist who achieved international fame and acclaim'),
	(5,'Million Pound Girl','Fuse','Off Da Ground','Dance-pop',8,'million_pound_girl.mp3','fuse.jpg',8.99,'Nana Richard Abiona, known by his stage name Fuse ODG, is an Ghanaian British musician. He is best known for his 2013 single \"Antenna\" which peaked to number 7 on the UK Singles Chart'),
	(6,'Give me love','Ed Sheeran','Give Me Peace on Earth','Acoustic, folk, indie pop ',5,'ed_sheeran_give_me_love.mp3','ed-sheeran.jpg',12.99,'Edward Christopher \"Ed\" Sheeran is an English singer-songwriter. Born in Hebden Bridge and raised in Framlingham, Suffolk, he moved to London in 2008 to pursue a musical career'),
	(7,'One more night','Maroon 5','Is Anybody Out There','Pop rock, pop, funk rock, blue-eyed soul, alternative rock, electropop',8,'maroon5-one-more-night.mp3','maroon5.jpg',11.99,'Maroon 5 is an American pop rock band that originated in Los Angeles, California. The group was formed in 1994 as Kara\'s Flowers and originally consisted of: Adam Levine, Jesse Carmichael, Mickey Madden and Ryan Dusick'),
	(8,'These days','Take That','III (Take That album)','Pop',4,'take-that.mp3','take-that.jpg',13.99,'Take That are an English pop group who formed in 1990. The group currently consists of Gary Barlow, Howard Donald, and Mark Owen. The original line-up also featured Jason Orange and Robbie Williams.'),
	(9,'Money on my mind','Sam Smith','In the Lonely Hour','Pop, Breakbeat, Contemporary R&B',6,'Money_On_My_Mind.mp3','sam-smith.jpg',9.99,'Samuel Frederick \"Sam\" Smith is an English singer-songwriter. He rose to fame in October 2012 when he was featured on Disclosure\'s breakthrough single \"Latch\", which peaked at number 11 on the UK Singles Chart');

/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table states
# ------------------------------------------------------------

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `stateId` varchar(2) NOT NULL,
  `stateName` varchar(20) NOT NULL,
  PRIMARY KEY (`stateId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;

INSERT INTO `states` (`stateId`, `stateName`)
VALUES
	('AK','Alaska'),
	('AL','Alabama'),
	('AR','Arkansas'),
	('AZ','Arizona'),
	('CA','California'),
	('CO','Colorado'),
	('CT','Connecticut'),
	('DC','District of Columbia'),
	('DE','Delaware'),
	('FL','Florida'),
	('GA','Georgia'),
	('HI','Hawaii'),
	('IA','Iowa'),
	('ID','Idaho'),
	('IL','Illinois'),
	('IN','Indiana'),
	('KA','Kansas'),
	('KY','Kentucky'),
	('LA','Louisiana'),
	('MA','Massachusetts'),
	('MD','Maryland'),
	('ME','Maine'),
	('MI','Michigan'),
	('MN','Minnesota'),
	('MO','Missouri'),
	('MT','Montana'),
	('NC','North Carolina'),
	('ND','North Dakota'),
	('NE','Nebraska'),
	('NH','New Hampshire'),
	('NJ','New Jersey'),
	('NM','New Mexico'),
	('NV','Nevada'),
	('NY','New York'),
	('OH','Ohio'),
	('OK','Oklahoma'),
	('OR','Oregon'),
	('PA','Pennsylvania'),
	('RI','Rhode Island'),
	('SC','South Carolina'),
	('SD','South Dakota'),
	('TN','Tennessee'),
	('TX','Texas'),
	('UT','Utah'),
	('VA','Virginia'),
	('VT','Vermont'),
	('WA','Washington'),
	('WI','Wisconsin'),
	('WV','West Virginia'),
	('WY','Wyoming');

/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table test-c-sharp
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test-c-sharp`;

CREATE TABLE `test-c-sharp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table tours
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tours`;

CREATE TABLE `tours` (
  `tourId` int(11) NOT NULL AUTO_INCREMENT,
  `packageId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `blurb` varchar(1024) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `price` double NOT NULL,
  `difficulty` varchar(10) NOT NULL,
  `graphic` varchar(20) NOT NULL,
  `length` int(11) NOT NULL,
  `region` varchar(50) NOT NULL,
  `keywords` varchar(200) NOT NULL,
  PRIMARY KEY (`tourId`),
  KEY `packageId` (`packageId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;

INSERT INTO `tours` (`tourId`, `packageId`, `name`, `blurb`, `description`, `price`, `difficulty`, `graphic`, `length`, `region`, `keywords`)
VALUES
	(1,1,'Big Sur Retreat','Big Sur is big country. The Big Sur Retreat takes you to the most majestic part of the Pacific Coast and show you the secret trails.','\"The region know as Big Sur is like Yosemite\'s younger cousin, with all the redwood scaling, rock climbing and, best of all, hiking that the larger park has to offer. Robison Jeffers once said, \"\"Big Sur is the greatest meeting of land and sea in the world,\"\" but the highlights are only accessible on foot. Our 3-day tour allows you to choose from multiple hikes led by experienced guides during the day, while comfortably situated in the evenings at the historic Big Sur River Inn. Take a tranquil walk to the coastal waterfall at Julia Pfeiffer Burns State Par or hike to the Married Redwoods. If you\'re prepared for a more strenuous climb, try Ollason\'s Peak in Toro Park. An optional 4th day includes admission to the Henry Miller Library and the Point Reyes Lighthouse.\"',750,'Medium','map_bigsur.gif',3,'Central Coast','Hiking, National Parks, Big Sur'),
	(2,1,'In the Steps of John Muir','Follow in the steps on John Muir, famous naturalist and founder of the Sierra Club, and walk the same trails he helped blaze in and around Yosemite National Park.','\"John Muir famously walked from San Francisco to Yosemite, an astounding 300 miles, and this tour is designed to trace his steps-- at least part of the way. This tour is not for the faint of heart though. This is a true backpacker\'s adventure, 37 miles in 3 days. Along the way, you\'ll bear witness to the classic monuments of Yosemite, such as Vernal Falls, Nevada Falls, Half Dome, Cathedral Peak, Tuolumne Meadows and Mt. Lyell. At Nevada Falls, the trail becomes narrow and from then on, you\'ll be privy to a \"\"secret\"\" Yosemite, including a rarely seen face of Half Dome. John Muir Trail tickets are required- and hard to come by- but Explore California has you covered. We\'ll also provide a checklist so that you come prepared with the right equipment and a seasoned guide for your tour.\"',600,'Difficult','map_yosemite.gif',3,'Northern California','Hiking, National Parks, Yosemite, John Muir, Camping'),
	(3,1,'The Death Valley Survivor\'s Trek','Hot stuff? Need more of a challenge? Take this tour to the hottest place in North America: Death Valley.','\"This 2 day, 1 night tour takes you deep into the heart of Death Valley National Park. Due to extreme temperatures (120 degrees and higher) in the summer months, this tour is only offered November through April.  This overnighter is no picnic though. Our guide will lead you on a 12 mile, off-trail hike down Death Valley Wash and into the backcountry for an overnight, hard terrain camping. Luckily, 12 miles takes you out of range of almost any city lights, something that draws thousands of star gazers to Death Valley ever year. If you can survive the 12 miles back, take advantage of the location to stop in at Scotty\'s Castle, a genuine castle built by the eccentric and wealthy Walter Scott for his wife. This tour will make you truly appreciate modern luxuries.\"',250,'Difficult','map_valley.gif',2,'Inland Empire','Hiking, Desert, Camping, Mojave, Death Valley'),
	(4,1,'The Mt. Whitney Climbers Tour','Climb to the sky! The Mt. Whitney Climbers Tour takes you to the top of this 14,000 ft. of mountain in 4 days- our longest and most strenuous backpacking tour.','Backpackers and hikers taking the Mt. Whitney Climbers Tour won\'t need hooks and rappelling gear, but they will need to be on the look out for majestic sunrises, giant granite peaks and everything from brown bears to marmots. You\'ll approach the towering peak from the trailhead on the western face, starting 6,000 feet above sea level. The Mt. Whitney Trail extends 11 miles and another 8 feet up to the peak. While no expensive training is required, you\'ll still need planning, permits, and preparation. Explore California will set you up with a trail permit, a two night camping pass, and an expert guide. We\'ll also help outfit you with the correct gear and make sure you are prepared for the length and elevation gain of the climb.',650,'Difficult','map_whitney.gif',4,'Northern California','Hiking, Climbing, Backpacking, Mt. Whitney'),
	(5,1,'Channel Islands Excursion','The chain known as the Channel Islands offer some of the most diverse and unique landscape on the Pacific coast. No motor vehicles are allowed on the islands, which makes this daytrip hiking package the best and most interesting way to visit.','The Channel Islands Excursion starts with a ferry from beautiful Ventura to the nearest island in the strand, Santa Cruz. You\'ll spend the day wandering the rocky coasts, sea anemone and barnacle studded shoreline, and wildflower-strewn meadows of the islands. Visit the herd of wild buffalo housed on Santa Catalina and keep an eye peeled for the endangered island fox. Take a break for lunch on Catalina in the quaint, turn of the century styled Avalon and make sure to visit the Art Deco Catalina Casino. Before ferrying home, visit the botanical gardens or climb to one of the islands\' high points and do some inexpensive whale watching. Blue whale season extends the late spring through summer months. (The Whaling Tour, run by Island Packers, is also available for an additional cost.)',150,'Easy','map_channel.gif',1,'Southern California','Channel Islands, Boating, Whale watching, Hiking'),
	(6,2,'Day Spa Package','Trying to pack some serious relaxation into a short timeframe? Try our Day Spa Package, a full 8 hour immersive experience in seductive the Ojai Valley that will ease away months\' worth of tension.','The Day Spa Package: it\'s all in the name. One day, one spa, but not just any day or any other spa. The Ojai Valley Inn & Spa is recognized by Trip Advisor as the World\' #1 spa and among the top 10 by USA Today. Your day of relaxation starts with a kuyam, a treatment combing cleansing desert clay, dry heat, inhalation and Chumash guided meditation. Choose from among several massage services, from Swedish to deep tissue, and body treatments, including the refreshing Pixie Tangerine & Pomegranate Scrub. Finish with a lavender manicure and pedicure or a \"gentleman\'s facial.\" Couples can enjoy joint massages, and expectant mothers should treat themselves to one of the nurturing prenatal treatments. In total, the package includes 5 straight hours of treatments, reserving time for a delicious spa lunch and time to linger by one of the many pools. This day will be one you think of for weeks.',550,'Easy','map_ojai.gif',1,'Southern California','Spa, Relaxation, Ojai, Art, Yoga'),
	(7,2,'Restoration Package','The Restoration Package is a 2 day balm for the tired soul. Choose from among three destinations that uniquely combine world-class spa services and attention to the spirit, in locations of unparalleled natural beauty.','California is no stranger to luxury (think Rodeo Drive) but we also offer a myriad of ways to not only pamper the body, but the spirit as well. Choose from among 3 options designed to help you relax and restore in the Restoration Package. Reconnect with nature and with yourself at the San Juan Spa, our Orange County Oasis; go backwoods, literally, on our Yosemite Yoga Retreat; or take comfort in our Napa Valley Validation spa sessions. Perfect for couples, the tireless mother or father you want to thank, or just yourself, this tour will immerse you in serenity.',900,'Easy','map_various.gif',2,'Varies','Spa, Relaxation, Art, Yoga'),
	(8,2,'Huntington Library and Pasadena Retreat Tour','This package is perfect for those who want to be pampered, but don\'t just want to rest on their laurels all day. Stimulate your mind visiting the Huntington Library\'s art and gardens and then settle back for some dining and primping at the Beauty Bar.','This package is a rewarding for the mind and the soul. Visit the grounds of the incredible Huntington Library and Gardens, with over 200 acres of roses, waterways, cactus gardens and other exotic species. Have lunch in the famous Tea Room and then go inside the fabulous Art Deco buildings to survey the art collection. Afterwards, visit the Beauty Bar\'s Pasadena location and enjoy a meal and drinks while having your nails buffed and your feet soaked.',225,'Easy','map_pasadena.gif',1,'Southern California','Spa, Relaxation, Art, Yoga'),
	(9,3,'Avila Beach Hot springs','Spend a weekend in a rustic log cabin, within walking distance of the historic Avila Hot Springs and minutes from the beach.','\"Chumash have occupied Avila Beach for centuries, but it wasn\'t until the late 19th century that the rest of California realized its ideal climate, proximity to the ocean and artesian springs made Avila Beach an ideal resort town. The hot springs in Avila are really unique, creating pools that hover at a natural 104 degrees, which draws aficionados from far and wide.  You\'ll stay at the historic Avila Hot Springs Resort, situated between oak-covered foothills that keep the morning fog away and make a natural year round air conditioner, which will enhance a nice morning, afternoon, or evening swim. This package include a two night stay in a private cabin above the springs, and a 3 day pass to the fresh water pool and 400 sq feet hot mineral pool. Optional day trips include two hour kayaking tours (we love the Cave Expedition) from Central Coast Kayaks and docent-led trips from the Point San Luis Lighthouse down the Pechos Trail. \"',1000,'Easy','map_avilabeach.gif',3,'Central Coast','Hot springs, hiking, cabin, beach, kayaking, hiking'),
	(10,3,'Matilija Hot springs','Visit the Matilija Sanctuary, located above the tranquil Ojai Valley, and indulge in the waters that flow from the natural sulfur springs.','Matilija Hot Springs has long been known to locals in this small community as a place to take a hot midnight dip in the middle of winter or a leisurely summer day, leaping between the sulfur pools and the cold creek nearby. Matilija Sanctuary, however, contains private springs that can only be accessed by special guests, including members of Explore California. Choose from a 3 or 4 day stay. Besides the complimentary nightly fireside music and the on-site crafts lodge other activities include day trips to downtown Ojai for shopping in it\'s Spanish revival style arcade and hiking in the East End, an Eden-esque experience if we\'ve ever had one.',1000,'Easy','map_ojai.gif',3,'Central Coast','Hot springs, Ojai, hiking, swimming, rustic, nature'),
	(11,4,'Amgen Tour of California Special','This year only, we?re also offering a special package that allows serious cyclists to follow behind a competitor in the AMGEN bike race, a race that mimics the conditions in the Tour de France. Spots are limited so reserve your seat now!','The AMGEN Tour of California is the largest cycling event in the US, over 750 miles and includes cycling world champions, Tour de France competitors, and Olympic athletes. It\'s an 8-leg tour, designed to mimic the various conditions in the Tour de Trance, and Explore California has the unique pleasure of being able to offer 50 of our members spots behind the peloton, or main group of racers, on two legs of the two. This is a special, one-time only offer. Customers should be in physical and mental shape to complete this two-week ride. Be prepared to complete a detailed questionnaire about skill level and any existing health problems.',6000,'Difficult','map_northerncal.gif',14,'Northern California','Cycling, Sports'),
	(12,4,'Monterey to Santa Barbara Tour','Ditch the four wheel drive and hop on two, for this exploration of the Pacific coast with other bicycling enthusiasts. Overnight stops take you from Carmel to Lompoc, so you can take in everything from rolling vineyards to the Channel Islands.','This tour takes you along the best spots on the California coastline, including overnight stops in Carmel, Big Sur, San Luis Obispo, Lompoc and Santa Barbara. Cyclists of all abilities can join this scenic tour of the Pacific coast. Side trips include the famous 17 Mile Drive in cypress studded Carmel, and visits to wineries around Paso Robles and Solvang, many featured in the movie Sideways. If you tire along the way, take a break in one of our luxury equipped companion cars, which follows riders along every leg of the trip. Dine with the group or request private reservations at any one of the fining dining spots our reservationists recommend. Private accommodations are provided for the overnight stays. Breaks before and after lunch provide plenty of time for sightseeing and shopping.',2500,'Medium','map_various.gif',6,'Varies','Cycling'),
	(13,4,'Cycle California: My Way','Cycle California your way! Choose a route, length and distance that fits your skill level, take advantage of our partnership with the AMGEN tour, and a group of riders with common interests. We tailor this package for you, down to the mile.','Cycling is a fantastic way to see California and Cycle California: My Way is a customizable package that celebrates that fact. Guided and unguided routes are available and, as with all our packages, we tailor the outings to your comfort and skill level. This is a great package for families who want to see California outside of a car (and traffic!). The most popular variety is the 6-day Montery to Santa Barbara tour but this year only, we\'re also offering a special package that allows serious cyclists to follow behind a competitor in the AMGEN bike race, a race that mimics the conditions in the Tour de France. Spots are limited so call now to reserve your seat! Choose your level of experience, desired distance, and location and we\'ll give you a call back to plot your route and confirm your reservation.',1200,'Varies','map_various.gif',0,'Varies','Cycling'),
	(14,5,'2 Days Adrift the Salton Sea','The Salton Sea, 25% saltier than the Pacific, has been a tourist destination since the 1920s. See what attracts people to this desert oasis.','The Salton Sea is saltier than the Pacific, an unusual feat for inland body of water. And even though its salinity has risen over the years, due in part to lack of outflows and pollution from agricultural runoff, it has attracted a small, but dedicated population. The sea itself offers recreational opportunities including boating, camping, off-roading, hiking, use of personal watercraft, photography and bird watching. The sea has been termed a \"crown jewel of avian biodiversity,\" being a major resting stop on the Pacific Flyway, a migratory path for birds. 2 Days Adrift the Salton Sea includes two nights accommodations at the Bombay Beach Inn, boat rental at the Salton City Harbor, and a guided fishing tour.',350,'2','map_saltonsea.gif',2,'Southern California','Boating, Fishing, Bird watching, Desert, Sea, Eco-Tour'),
	(15,5,'Mojave to Malibu','Join us for one of Explore California\'s exclusive \"motorcades,\" Mojave to Malibu - a motorcycle tour from the outskirts of the Mojave desert down to the Malibu coast.','Only experienced road hogs need apply! The tour group will meet at Old Glory Motorcycle Company in Lancaster, CA to retrofit and get ready for the day\'s ride. The pack takes the Angeles Crest Highway, through Angeles National Forest, stopping at biker-friendly Newcomb Ranch for drinks and grub. Winding your way down through L.A., you\'ll take a side trip through Griffith Park, home of the observatory and that classic scene from Rebel without a Cause. After cruising Hollywood Boulevard, the tour makes its way through Santa Monica, through Topanga Canyon and ends in Malibu, where you can grab world-class seafood and burgers from the roadside diner, Paradise Cove Beach Cafe.',200,'Difficult','map_southerncal.gif',1,'Southern California','Motorcycle, Cycling, Mountains, Desert, Sea'),
	(16,5,'Joshua Tree: Best of the West Tour','See Joshua Trees\' backcountry on a guided tour from the safety and security of an open-air, all-terrain vehicle, and see some of the historic spots of California\'s once wild, Wild West frontier.','\"Joshua Tree: Best of the West Tour is a day-long adventure through this grandiose national park and a snippet of wild west history from the back of an open-air all-terrain vehicle. This is a great opportunity for photo hunters to shots of the coyotes, eagles and Big Horn sheep native to the area. Multiple stops includes a visit to the Rock Gardens, a 200 million year old legacy of the San Andreas Fault. The tour stops last at Pioneertown, originally built as a motion picture set in the 1940s, but has since becomes part of California\'s history in its own right, as a living signpost of our fascination with the legends of the Wild West. Enjoy mesquite smoked barbeque and marvel at the \"\"bullet holes\"\" and functional hitching posts. The tour ends with a stop at Sunset Point, where on a clear day, you can see all the way to Mexico.     \"',150,'Easy','map_southerncal.gif',1,'Southern California','Hiking, Desert, Sea, California History, Theme park'),
	(17,6,'Kids L.A. Tour','Los Angeles for the young (and young at heart!) Go beyond the concrete jungle and discover just what a playground L.A. can be. ','The Island of the Blue Dolphins Tour starts with a ferry from beautiful Ventura to the Channel Islands, home of the \"Lone Woman of San Nicolas Island,\" who was the inspiration for the Newbery Medal winning children\'s book. Your Island Packers ferry guide will point out local fish and fauna, and the right time of year, you might even catch a glimpse of a dolphin or a blue whale. Once onshore, hike and look out for the herd of wild buffalo housed on Santa Catalina. Also keep an eye peeled for the endangered island fox. Enjoy a kid-friendly picnic lunch prepared by the Avalon Beach Cafe at the botanical gardens or climb to one of the islands\' high points and survey the California coast from the perspective of the heroine. On the trip back to land, the ferry stops in Santa Barbara, and you\'ll have the chance to visit the famous mission where Karana lived after being rescued. One last stop for salt taffy and knick knacks at the pier and the ferry will deliver you safely back to Ventura, with your own copy of the book to take home and read as a family.',200,'Easy','map_losangeles.gif',1,'Southern California','California History, Kid friendly, Museum, Hiking, Animals '),
	(18,7,'Endangered Species Expedition','California boasts the largest number of unique species in the continental United States, which makes a ?natural? destination for nature lovers. For those who want to get a glimpse of California?s at-risk flora and fauna, and our efforts to preserve it, take the Endangered Species Expedition.','Taking a cue from the Nature Conservancy, we\'ve selected 15 state parks and preserves that are shining examples of conservation in action. Just one example is the Guadalupe-Nipomo Dunes Preserve, 18 miles of Earth\'s most biodiverse coastal dune-lagoon ecosystem. Activities include camping, hiking, horseback riding, boating and bird watching. The tour package includes 2 nights of camping and 3 days admission to the park of your choice. We can also arrange for RV rentals. This is a great package for families who want to pass down a great experience and an education to the next generation, while participating in preserving a part of their future.\n',600,'Medium','map_various.gif',3,'Central Coast','Eco Tour, Camping, Animals, Boating, Hiking'),
	(19,7,'Fossil Tour','The Fossil Tour to the Mojave Desert and La Brea Tar Pits is ideal for budding archeologists.','Hunting for trilobites? Searching for prehistoric shark teeth? We can show you where to find them! The Fossil Tour explores not just the history, but the ancient past of what we know as California. In our own backyard, we have access to a fossil record hundreds of millions of years old. Trilobites are extinct marine arthropods (think  lobster) that lived in the part of the Pacific that is now the Mojave Desert. With an experienced hunter, you\'ll be bussed out to search for these little desert \"crabs\" and visit the Calico City dig, site of a disputed findings of early man living in California to 100,000 years go. Paleontology buffs will be fascinated by the remains of this dig, presided over by none other than Louis Leaky himself. Enjoy an \"on the dig\" meal and then return to Los Angeles for a night at the Cinema Suites bed and breakfast, a short walk from the world famous La Brea Tar Pits. Spend the second day touring the museum\'s fossil collection, watch archeologists at work, an wonder at the still active pits of tar that trapped and preserved hundreds of animals. After this tour, you\'ll start to wonder what you can uncover in your own backyard!',500,'Medium','map_various.gif',2,'Varies','Eco Tour, California History, Animals, Museum'),
	(20,7,'Coastal Experience','Coastal Experience takes you to the famous Monterey Aquarium and to the enchanted Channel Islands, which hosts such unique and endangered species as the Santa Cruz fox. ','For 25 years, the Monterey Bay Aquarium has aspired to protect oceans for future generations by inspiring young and old with the oceans\' beauty and wonder. Explore California\'s Coastal Experience Tour takes you on a behind the scenes tour of this world famous aquarium and then on a jaunt farther south to another aquatic eco-system, the Channel Islands. At the aquarium, take a private tour and learn how the tanks are maintained, watch feedings, view the newest specimens before they are available for public view and interact with the staff. Afterwards, enjoy the rest of the exhibits, like the Secret Lives of Seahorses, and visit the shark tank, the sea otter habitat, and  the kelp forests. Next, hop on a cruise from Monterey to the Channel Islands. The boat docks outside Santa Barbara and you\'ll take a small ferry to the islands. Try snorkeling in the reefs, or take a whale watching side trip and experience the life aquatic a natural. ',1500,'Easy','map_monterey.gif',4,'Central Coast','Eco Tour, California History, Animals, Boating, Hiking'),
	(21,8,'Mammoth Mountain Adventure','With over 400 inches of annual snowfall, Mammoth Mountain turns winter into a 3 season event! Learn to ski, snowboard or even snowshoe across the thousands of acres of this winter wonderland.','The Mammoth Mountain Adventure is 4 days of wild, winter fun. Take a lesson the first day from the Ski & Snowboard School, led by grizzly pro instructors. This tour includes a 4 full day lift pass, so when you\'re ready, you can take on any one of the 150 trails over Mammoth\'s epic terrain. Equipment rentals are included, so you can pack light. Need a break? Take a scenic gondola to the summit of Mammoth Mountain, 11,000 feet in all, or take a Snowcat tour of the backcountry. Enjoy dinners at the Mammoth Mountain Inn, a snowball\'s throw from the main lodge, where you\'ll also be provided 3 night\'s complimentary lodging. This package is available October through early June, but lift tickets are rare, so book now.',800,'Difficult','map_mammoth.gif',4,'Southern California','Skiing, Snowboarding, Cabin, Hiking, Mountains'),
	(22,8,'Mountain High Lift-off','Mountain High was established in 1929, but continues to be among the top five mountain resorts in the state. Experience what draws hundreds of thousands of visitors to this snow destination each season. The Mountain High Lift-off is the weekender\'s ski spectacular, perfect for couples who need a retreat.','Mountain High is only an hour from Los Angeles, but once you arrive, you\'ll feel like you\'re in another world. The Mountain High Lift-off is the weekender\'s ski spectacular, perfect for couples who need a retreat, featuring two days of premium runs with an all access Express Lift ticket, available exclusively through Explore California. No more waiting in line and guaranteed admittance even when the resort sells out. Accommodations are provided at the Larks Nest Cabin, a vintage charmer featuring a stone fireplace, clawfoot tub, and full kitchen. Dine at the Wrightwood Inn\'s cozy mountain pub, or grab a sandwich from the Evergreen Cafe and Raccoon Saloon. Equipment rental and transportation from Los Angeles International Airport is included.',800,'Difficult','map_southerncal.gif',3,'Southern California','Skiing, Snowboarding, Cabin, Hiking, Mountains'),
	(23,9,'Olive Garden Tour','Take a quiet day to explore the lush hills and countryside around beautiful Ojai, California. You\'ll visit Ojai Olive and tour the grounds, walk through the olive groves, and enjoy a once-in-a-lifetime lunch amongst the Ojai hills, featuring homemade tapas made from the olives on-site!','Ojai Olive is a small, family-run olive orchard, which has been pressing their own special, fragrant olive oil for over 10 years. Immerse yourself in this ancient practice, which is both an art and an edible. The Ojai Olive tour offers begins outside with the history of the grove, an explanation of the olive varieties, their maturing process, the harvesting, a visit to the tree nursery, and more. They then take you inside the barn and explain the process of making the olive oil. Lastly, stop in the tasting room and find out how different curing and separation processes can result in such unique flavors: citrus, hints of pepper, grass. Take a break with a picnic lunch provided by Azu restaurant, makers of authentic Spanish style tapas with a California flair. Included are brioche with olive tapenade, featuring black and green olives from Ojai Olive and prepared by the chef especially for this tour.',75,'Easy','map_ojai.gif',1,'Southern California','Tasting, Olive Oil, California History, Picnic, Nature, Farming'),
	(24,9,'Oranges & Apples Tour','This three day tour is a taste of some of California\'s finest fruits. The first day features apple picking, a smoking barbeque and a hayride at a small farm in the historic Oak Glen, and the second take you\'ll drive to sample the only growing place in the world for pixie tangerines, Ojai, California.','Oak Glen is a tiny hamlet located in the foothill of the San Bernadino Mountain, only 90 minutes from LA, but the climate makes it perfect for stone fruits, such as pears, peaches, and nectarines. However, the jewel of this town is the apple. You\'ll start the day at Riley\'s Apple Farm, where you can pick and press as many apples as you can carry. Take a hayride around the farm property and, a fun treat for kids, visit the barn animals. Feast on apple-wood smoked BBQ featuring tri-tip, ribs and chicken apple sausage. Lodging is provided at the quaint Craftin Hills Inn. The next day, it\'s a short backwoods drive to Ojai, CA, where you\'ll receive a private tour and picnic lunch at the Churchill Brenneis Orchard. Owners Jim Churchill and Lisa Brenneis are knowledgeable and warm, and you\'ll leave with a glow and the most delicious tiny tangerines you\'ve ever tasted. Spend a restful night at the Lavender Inn in beautiful downtown Ojai before returning to the regular pace.',350,'Easy','map_southerncal.gif',3,'Southern California','Tasting, Olive Oil, California History, Picnic, Nature, Farming'),
	(25,9,'Hot Salsa Tour','Spice addict? Southern California is know for its heat! Try this three day tour of some of the hottest chilies, salsas, and picantes north of the Mexican border.','The Hot Salsa Tour is scheduled around the preeminent salsa event in the country, the annual Oxnard Salsa Festival. Enjoy spicy food, hot music and Oxnard\'s cool ocean breezes in this two-day celebration of everything salsa - the food, the music and the dance. Enjoy salsa tasting from dozens of competitors- or enter your own concoction in the amateur competition. Flavors range from fresh & fruity, hot & smoky, sweet & spicy. Shop from dozens of boutique vendors. Take a seat, or shake a leg, in front of three stages, featuring everything from jazz bands to rockabilly. The second day you\'ll really be prepared to tango, after taking an evening salsa lesson from the Arthur Murray Dance Studio. If things get too hot, you can cool your heels at the luxurious Mandalay Beach Hotel and Resort and refresh yourself by the pool or take advantage of the private beach access. This yearly special is something no hot tamale wants to miss!',400,'Easy','map_southerncal.gif',3,'Southern California','Tasting, Oranges, Apples, California History, Picnic, Nature, Farming'),
	(26,9,'A Week of Wine','Spend a week in wine country. Watch the evolution of a wine from harvesting to corking, in the heart of Sonoma Valley, considered the birthplace of wine-making in California. ','Immerse yourself in the culture and lifestyle of a California winery. Spend 5 days in your private guest villa at the Stockbridge Winery, located in scenic Sonoma. You\'ll spend your days wandering the vineyards, touring the presses and cellars, and assisting staff in making America\'s favorite wine. Enjoy Tuscan-style meals served al fresco, overlooking the gorgeous countryside. Day trips include dinner in Sausalito, hiking in the redwood forests, and lunch in downtown San Francisco.',850,'Easy','map_winecountry.gif',5,'Napa/Sonoma Counties','Winery, hiking, relaxing, cooking, Napa Valley');

/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(50) NOT NULL,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(1024) NOT NULL,
  `email_code` varchar(32) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0',
  `password_recover` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  `allow_email` int(11) NOT NULL DEFAULT '1',
  `profile` varchar(55) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`, `email_code`, `active`, `password_recover`, `type`, `allow_email`, `profile`)
VALUES
	(1,'itechytony','5f4dcc3b5aa765d61d8327deb882cf99','Tony','Ampomah','itechytony@gmail.com','e217f6613fe2f7f8cc504be8444dc2f4',1,0,0,1,'assets/img/profile/93f74783a7.jpg'),
	(2,'cuth','5f4dcc3b5aa765d61d8327deb882cf99','Cuth','Gaidzanwa','ctendai6@hotmail.com','5b5e0321c77455501fd016d5edf45b1d',0,0,0,1,''),
	(3,'dd','980ac217c6b51e7dc41040bec1edfec8','dd','dd','s.sharpe@leedsbeckett.ac.uk','73eab87f8a95cc4c0d7d1dfdd49bfb80',0,0,0,1,'');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
