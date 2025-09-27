/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - expediabookingflight
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`expediabookingflight` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `expediabookingflight`;

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `airline_name` varchar(100) DEFAULT NULL,
  `logo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flight supply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` char(4) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

/*Table structure for table `booking` */

DROP TABLE IF EXISTS `booking`;

CREATE TABLE `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_type_id` int(11) DEFAULT NULL,
  `flight_id` int(11) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight supply` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`id`) REFERENCES `booking_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking` */

/*Table structure for table `booking supply` */

DROP TABLE IF EXISTS `booking supply`;

CREATE TABLE `booking supply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_id` int(11) DEFAULT NULL,
  `booking_class_id` int(11) DEFAULT NULL,
  `number_of_seats` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `booking supply_ibfk_1` FOREIGN KEY (`id`) REFERENCES `flight supply` (`id`),
  CONSTRAINT `booking supply_ibfk_2` FOREIGN KEY (`id`) REFERENCES `booking` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking supply` */

/*Table structure for table `booking_class` */

DROP TABLE IF EXISTS `booking_class`;

CREATE TABLE `booking_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `booking_class_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger _manifest` (`id`),
  CONSTRAINT `booking_class_ibfk_2` FOREIGN KEY (`id`) REFERENCES `payment method` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `booking_class` */

/*Table structure for table `bookingtype` */

DROP TABLE IF EXISTS `bookingtype`;

CREATE TABLE `bookingtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingtype` */

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `country_ibfk_1` FOREIGN KEY (`id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

/*Table structure for table `currencies` */

DROP TABLE IF EXISTS `currencies`;

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(100) DEFAULT NULL,
  `default` decimal(10,2) DEFAULT NULL,
  `exchange_rate` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `currencies_ibfk_1` FOREIGN KEY (`id`) REFERENCES `booking supply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `currencies` */

/*Table structure for table `flight supply` */

DROP TABLE IF EXISTS `flight supply`;

CREATE TABLE `flight supply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(6) DEFAULT NULL,
  `airline_id` int(11) DEFAULT NULL,
  `depature_time` datetime DEFAULT NULL,
  `depature_city` varchar(50) DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `destination_city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `flight supply_ibfk_1` FOREIGN KEY (`id`) REFERENCES `booking` (`id`),
  CONSTRAINT `flight supply_ibfk_2` FOREIGN KEY (`id`) REFERENCES `booking supply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flight supply` */

/*Table structure for table `gender` */

DROP TABLE IF EXISTS `gender`;

CREATE TABLE `gender` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_name` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `gender_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger _manifest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `gender` */

/*Table structure for table `identification document` */

DROP TABLE IF EXISTS `identification document`;

CREATE TABLE `identification document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `identification document_ibfk_1` FOREIGN KEY (`id`) REFERENCES `passenger _manifest` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `identification document` */

/*Table structure for table `passenger _manifest` */

DROP TABLE IF EXISTS `passenger _manifest`;

CREATE TABLE `passenger _manifest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `booking_id` int(11) DEFAULT NULL,
  `booking_class_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_class_id` (`booking_class_id`),
  CONSTRAINT `passenger _manifest_ibfk_1` FOREIGN KEY (`booking_class_id`) REFERENCES `booking_class` (`id`),
  CONSTRAINT `passenger _manifest_ibfk_2` FOREIGN KEY (`id`) REFERENCES `identification document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `passenger _manifest` */

/*Table structure for table `payment method` */

DROP TABLE IF EXISTS `payment method`;

CREATE TABLE `payment method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payment method_ibfk_1` FOREIGN KEY (`id`) REFERENCES `booking_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `payment method` */

/* Procedure structure for procedure `sp_check_airlinedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_airlinedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_airlinedetails`(in P_airlineid int)
BEGIN
		SELECT a.*, 
           n.country_name
    FROM airline a
    JOIN country n ON a.country_id = n.id
    WHERE a.id = P_airlineid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_airportdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_airportdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_airportdetails`(In P_airportid int)
BEGIN
		select a.* ,c.city_name,n.country_name
		from `airport` a
		join `city` c on c.id=a.id
		join`country` n on n.id=c.id
		where a.id=P_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_bookingclassdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_bookingclassdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_bookingclassdetails`(in P_booking_classid int)
BEGIN
	 SELECT 
        bc.id AS booking_class_id,
        bc.type_name
       
    FROM booking_class bc
    LEFT JOIN booking b ON b.booking_class_id = bc.id
    WHERE bc.id = P_booking_classid
    GROUP BY bc.id, bc.class_name;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_bookingdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_bookingdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_bookingdetails`(in P_bookingid int)
BEGIN
		 SELECT 
        b.id AS booking_id,
        b.booking_date,
	c.flight_id,
	d.booking_date,
	e.payment_method
    FROM booking b
    JOIN user u ON b.user_id = u.id
    JOIN payment_method pm ON b.payment_method_id = pm.id
    JOIN flight f ON b.flight_id = f.id
    
    WHERE b.id = P_bookingid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_bookingsupply details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_bookingsupply details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_bookingsupply details`(in P_bookingsupplyid int)
BEGIN
	 SELECT 
        bs.id AS booking_supply_id,
        b.id AS booking_id,
        b.flight_id,
        u.booking_class_id,
        u.number_of_seats,
        s.price,
        bs.currency
        (s.price * bs.currency) AS total_cost
    FROM booking_supply bs
    JOIN booking b ON bs.booking_id = b.id
    JOIN user u ON b.user_id = u.id
    JOIN supply s ON bs.supply_id = s.id
    WHERE b.id = P_bookingid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_bookingtypedetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_bookingtypedetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_bookingtypedetails`(in bookingtype int)
BEGIN
	select bt.id AS booking_type_id,
        bt.bookname,
        COUNT(b.id) AS total_bookings
    FROM booking_type bt
    LEFT JOIN booking b ON b.booking_type_id = bt.id
    WHERE bt.id = P_bookingtypeid
    GROUP BY bt.id, bt.type_name;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_city` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_city` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_city`(in P_cityid int)
BEGIN
		 SELECT 
        c.id AS city_id,
        c.city_name,
        n.country_id
    FROM city c
    JOIN country n ON c.country_id = n.id
    LEFT JOIN airport a ON a.city_id = c.id
    WHERE c.id = P_cityid
    GROUP BY c.id, c.city_name, n.country_id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_countrydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_countrydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_countrydetails`(IN P_countryid int)
BEGIN
		select n.* ,`city_name`
		from `country` n
		join `city` c on c.countryid=n.countryid
		where n.countryid=P_countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_currencydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_currencydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_currencydetails`(in P_currencyid int)
BEGIN
	 SELECT 
        c.id AS currency_id,
        c.currency_name,
        c.default,
        n.exchange_rate
    FROM currency c
    JOIN country n ON c.country_id = n.id
    WHERE c.id = P_currencyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_flightsupplydetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_flightsupplydetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_flightsupplydetails`(in P_flightsupply_id int)
BEGIN
	 SELECT 
        fs.id AS flight_supply_id,
       
        al.flight_number,
        s.airline_id,
        s.depature_time,
        fs.depature_city,
        d.arrival_time,
        df.destination_city

    FROM flight_supply fs
    JOIN flight f ON fs.flight_id = f.id
    JOIN airline al ON f.airline_id = al.id
    JOIN supply s ON fs.supply_id = s.id
    WHERE f.id = P_flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_genderdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_genderdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_genderdetails`(in P_genderid int)
BEGIN
	 SELECT 
        g.id AS gender_id,
        g.gender_name
    FROM gender g
    LEFT JOIN user u ON u.gender_id = g.id
    WHERE g.id = P_genderid
    GROUP BY g.id, g.gender_name;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_identificationdoc details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_identificationdoc details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_identificationdoc details`(in P_identificationdocumentid int)
BEGIN
	SELECT 
        d.id AS document_id,
        d.document_name
       
    FROM identification_document d
    LEFT JOIN user u ON u.identification_document_id = d.id
    WHERE d.id = P_documentid
    GROUP BY d.id, d.document_name;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_passangermanifestdetails` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_passangermanifestdetails` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_passangermanifestdetails`(in P_passengermanifest int)
BEGIN
	 SELECT 
        b.id AS booking_id,
        u.booking_id as booking_id,
        s.booking_class_id,
        d.name,
        f.DOB,
        a.gender_id
    FROM booking b
     LEFT JOIN gender g ON u.gender_id = g.id
    LEFT JOIN booking_class bc ON b.booking_class_id = bc.id
    WHERE f.id = P_flightid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_check_paymentmethod details` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_check_paymentmethod details` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_paymentmethod details`(in P_paymentmethodid int)
BEGIN
		SELECT 
        pm.id AS payment_method_id,
        pm.payment_name
    FROM payment_method pm
    LEFT JOIN booking b ON b.payment_method_id = pm.id
    WHERE pm.id = P_paymentmethodid
    GROUP BY pm.id, pm.payment_name;
	
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_airline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_airline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_airline`(in P_airlineid int)
BEGIN
	delete from `airline`
	where `airlineid`=P_airlineid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_airport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_airport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_airport`(in P_airportid int)
BEGIN
	delete from`airport`
	where `airportid`=P_airportid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_booking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_booking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_booking`(IN P_bookingid int)
BEGIN
	delete from `booking`
	where `bookingid`= P_bookingid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_bookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_bookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_bookingclass`(IN P_booking_classid  int)
BEGIN
	delete from `booking_class`
	where `booking_classid`=P_booking_classid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_bookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_bookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_bookingsupply`(in P_booking_supplyid int)
BEGIN
	delete from `bookingsupply`
	where `bookingsupplyid` =P_booking_supplyid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_bookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_bookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_bookingtype`(in P_booking_typeid int)
BEGIN
		delete from `booking type`
		where `booking_typeid` = P_booking_typeid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_city` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_city` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_city`(in P_cityid int)
BEGIN
	delete from`city`
	where `cityid` =P_cityid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_country` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_country` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_country`(in P_countryid int)
BEGIN
	delete from `country`
	where`countryid` =P_countryid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_currencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_currencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_currencies`(in P_currenciesid  int)
BEGIN
		delete from`currencies`
		where `currenciesid` =P_currenciesid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_flightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_flightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_flightsupply`(in P_flight_supplyid int)
BEGIN
	delete from`flight supply`
	where `flight_supplyid` =P_flight_supplyid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_gender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_gender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_gender`(in P_genderid int)
BEGIN
	delete from `gender`
	where `genderid` =P_genderid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_identification doc` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_identification doc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_identification doc`( in P_identification_documentid int)
BEGIN
	delete from`identification_document`
	where `identification_documentid` =P_identification_documentid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_passingermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_passingermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_passingermanifest`(in P_passenger_manifestid int)
BEGIN
	delete from`passenger_manifest`
	where `passenger_manifestid` =P_passenger_manifestid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_delete_paymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_delete_paymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_paymentmethod`(in P_payment_methodid int)
BEGIN
	delete from`payment_method`
	where `payment_methodid` =P_payment_methodid;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairline`(in P_airline_name varchar (100))
BEGIN
	if P_airline_name ='' then
	
	set P_airline_name='@@@';
	 end if;
	 
	 select n. *, c.`airline_name`
	 from `airline` n
	 join`airline` c on c.airlineid=n.airlineid
	 where gc.airline_name like concat("%", P_airline_name,"%")
	 order by 'airline_name';

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairport`(in P_airportcode char(4))
BEGIN
	IF P_airportcode ='' THEN
	
	SET P_airportcode='@@@';
	 END IF;
	 
	 SELECT n. *, c.`airportcode`
	 FROM `airport` n
	 JOIN`airport` c ON c.`airportcode`=n.airportcode
	 WHERE gc.airportcode LIKE CONCAT("%", P_airportcode,"%")
	 ORDER BY '`airportcode';

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterbooking`(in P_bookname varchar(200), IN P_booking_type_id int)
BEGIN
	IF P_bookname ='' THEN
	
	SET P_bookname='@@@';
	 END IF;
	 
	 SELECT b.*, c.bookname
	 FROM `booking` b
	 JOIN `bookingtype` c ON b.booking_type_id=c.id
	 WHERE b.bookname LIKE CONCAT("%",P_bookname,"%")
	 ORDER BY `bookname`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterbookingsupply`(in P_flight_id int ,in P_flight_number varchar(6))
BEGIN
		IF P_flight_id ='' THEN
	
	SET P_flight_number='@@@';
	 END IF;
	 
	 SELECT n. *, c.flight_number
	 FROM `booking supply` n
	 JOIN`flight supply` c ON c.id=n.flight_id
	 WHERE c.flight_number LIKE CONCAT("%", P_flight_number,"%")
	 ORDER BY id;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercity`( in P_cityid int, IN P_country_name int)
BEGIN
	
	IF P_country_name ='' THEN
	
	SET P_country_name='@@@';
	 END IF;
	 
	 SELECT n. *, c.country_name
	 FROM `city` n
	 JOIN`country` c ON c.`countryid`=n.countryid
	 WHERE c.country_name LIKE CONCAT("%", P_country_name,"%")
	 ORDER BY 'country_name';

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterpassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterpassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterpassengermanifest`(in P_gender_id int ,in P_gender_name char(1))
BEGIN
		IF P_gender_name ='' THEN
	
	SET P_gender_name='@@@';
	 END IF;
	 
	 SELECT n. *, c.gender_name
	 FROM `passenger _manifest` n
	 JOIN `gender_name` c ON c.id=n.gender_id
	 WHERE c.gender_name LIKE CONCAT("%", P_gender_name,"%")
	 ORDER BY `gender_id`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairline`()
BEGIN
	select * from `airline`
	order BY`id`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairport`()
BEGIN
	select * from `airport`
	order by `airportid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbooking`()
BEGIN
	select * from `booking`
	order by `bookingid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingsupply`()
BEGIN
		select * from `booking supply`
		order by `booking supplyid`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtype`()
BEGIN
	select * from `booking type`
	order by `booking typeid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbooking_class` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbooking_class` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbooking_class`()
BEGIN
	select * from `booking_class`
	order by `booking_classid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcity`()
BEGIN
 select *from `city`
 order by `cityid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountry`()
BEGIN
	select * from `country`
	order by `countryid`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrencies`()
BEGIN
	select * from `currencies`
	order by `currenciesid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightsupply`()
BEGIN
	select * from`flight supply`
	order by `flight supplyid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getgender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getgender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getgender`()
BEGIN
	select * from `gender`
	order by `genderid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getidentification doc` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getidentification doc` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getidentification doc`()
BEGIN
	select * from`identification document`
	order by `identification documentid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpassengermanifest`()
BEGIN
		select * from `passenger _manifest`
		order by `passenger _manifestid`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethod`()
BEGIN
	select * from`payment method`
	order by `payment methodid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairline`(in P_id INT(11), IN p_airline_name varchar(100),in P_logo varchar(200))
BEGIN
	-- Check if we are updating an existing city (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the airline exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`airline`
        SET
		`id` = P_id,
		`airline_name` = P_airline_name,
		`logo`= P_logo
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new airline.
        -- We will check if a airline with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`airline` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new airline record.
            INSERT INTO `expediaflightbooking`.`airline`
            (
		`id`,
                `airline_name`,
                `logo`
            )
            VALUES
            (
		P_id,
                P_airline_name,
                P_logo
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`(in P_id int(11), in P_code char(4),In P_city_id int(11) )
BEGIN
	-- Check if we are updating an existing airport (P_Id is greater than 0)
    IF P_id= 0 THEN
        -- If the airport  exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`airport`
        SET
		`id` = P_id,
		`code` = P_code,
		`city_id`= P_city_id
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new airport.
        -- We will check if a airport with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`airport` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new airport record.
            INSERT INTO `expediaflightbooking`.`airport`
            (
		`id`,
                `code`,
                `city_id`
            )
            VALUES
            (
		P_id,
                P_code,
                P_city_id
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebooking`(in P_id int(11),in P_booking_type_id int(11),in P_flight_id int(11),In P_booking_date datetime,In P_payment_method varchar(100))
BEGIN
	-- Check if we are updating an existing booking (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the booking exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`booking`
        SET
		`id` = P_id,
		`booking_type_id` = P_booking_type_id,
		`flight_id`= P_flight_id,
		`booking_date` =P_booking_date,
		`payment_method` =P_payment_method
        WHERE
		`id` = P_id;
		
    ELSE
        -- If P_id is 0, we're adding a new booking.
        -- We will check if a airline with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`booking` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new booking record.
            INSERT INTO `expediaflightbooking`.`booking`
            (
		`id`,
                `booking_type_id`,
                `flight_id`,
                `booking_date`,
                `payment_method`
            )
            VALUES
            (
		P_id,
                P_booking_type_id,
                P_flight_id,
                P_booking_date,
                P_payment_method
            );
        END IF;
    END IF;


	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingclass`(in P_id int(11), in P_type_name varchar(200))
BEGIN
 -- Check if we are updating an existing booking_class (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the booking_class exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`booking_class`
        SET
		`id` = P_id,
		`type_name` = P_type_name
	
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new booking_class.
        -- We will check if a booking_class with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`booking_class` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new booking_class record.
            INSERT INTO `expediaflightbooking`.`booking_class`
            (
		`id`,
                `type_name`
                
            )
            VALUES
            (
		P_id,
                P_type_name
                
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingsupply`(in P_id int(11), In P_flight_id INT(11),IN P_booking_class_id INT(11),IN P_number_of_seats INt(11), In P_price decimal(10,2),IN P_currency decimal(10,2))
BEGIN
	-- Check if we are updating an existing bookingsupply (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the airline exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`booking supply`
        SET
		`id` = P_id,
		`flight_id` = P_flight_id,
		`booking_class_id`  = P_booking_class_id,
		`number_of_seats` =P_number_of_seats,
		`price` =P_price,
		`currency` =P_currency
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new booking supply.
        -- We will check if a booking supply with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`booking supply` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new` booking supply record.
            INSERT INTO `expediaflightbooking`.`booking supply`
            (
		`id`,
                `flight_id`,
                `booking_class_id`,
                `number_of_seats`,
                `price`,
                `currency`
                
            )
            VALUES
            (
		P_id,
                P_flight_id,
                P_booking_class_id,
                P_number_of_seats,
                P_price,
                P_currency
            );
        END IF;
    END IF;


	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingtype`(IN P_id INT(11),IN P_bookname varchar(200))
BEGIN
	-- Check if we are updating an existing booking type (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If thebooking type exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`booking type`
        SET
		`id` = P_id,
		`bookname` = P_bookname
		
        WHERE
		`id` =P_id;
    ELSE
        -- If P_id is 0, we're adding a new booking type
        -- We will check if a booking type with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`booking type` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new booking type record.
            INSERT INTO `expediaflightbooking`.`booking type`
            (
		`id`,
                `bookname`
                
            )
            VALUES
            (
		P_id,
                P_bookname
               
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecity`(
    IN P_id INT,
    IN P_cityName VARCHAR(100),
    IN P_countryId INT
)
BEGIN
    -- Check if we are updating an existing city (P_cityId is greater than 0)
    IF P_Id = 0 THEN
        -- If the city exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`city`
        SET
            `city_name` = P_city_name,
            `country_id` = P_country_id
        WHERE
            `id` = P_id;
    ELSE
        -- If P_cityId is 0, we're adding a new city.
        -- We will check if a city with the same name and country ID already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`city` 
            WHERE `city_name` = P_city_name AND `country_id` = P_country_id
        ) THEN
            -- If no duplicate is found, insert the new city record.
            INSERT INTO `expediaflightbooking`.`city`
            (
                `city_name`,
                `country_id`
            )
            VALUES
            (
                P_city_name,
                P_country_id
            );
        END IF;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`(IN P_id INT, IN P_country_name varchar(100) )
BEGIN
		-- check if we are adding a new country
		IF P_id= 0 THEN
		-- create a new country 
			IF NOT EXISTS(SELECT 1 FROM `country` WHERE `country_name` =P_country_name) THEN
			INSERT INTO `country`(country_name)
			VALUES (P_country_name);
		END IF;
	else
		-- if the passed id is not zero update the existing country details
		update `country`
		set `country_name` =P_country_name
		where `id` =P_id;
		
		

	end if;
	
	
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecurrencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecurrencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecurrencies`(In P_id int(11),in P_currency_name varchar(100),in P_default decimal(10,2),in P_exchange_rate decimal(10,6))
BEGIN
-- Check if we are updating an existing city (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the currencies exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`currencies`
        SET
		`id` = P_id,
		`currency_name` = P_currency_name,
		`default`= P_default,
		`exchange_rate`=P_exchange_rate
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new currencies.
        -- We will check if a currencies with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`currencies` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new currencies record.
            INSERT INTO `expediaflightbooking`.`currencies`
            (
		`id`,
                `currency_name`,
                `default`,
                `exchange_rate`
                
            )
            VALUES
            (
		P_id,
                P_currency_name,
                P_default,
                P_exchange_rate
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightsupply` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightsupply` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightsupply`(IN P_id INt(11),IN P_flight_number varchar(6),IN P_airline_id INt(11),in P_depature_time datetime,IN P_depature_city varchar(50),IN P_arrival_time datetime,IN P_destination_city varchar(50))
BEGIN
-- Check if we are updating an existing flight supply (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the flight supply exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`flight supply`
        SET
		`id` = P_id,
		`flight_number` = P_flight_number,
		`airline_id`= P_airline_id,
		`depature_time` =P_depature_time,
		`depature_city` =P_depature_city,
		`arrival_time` =P_arrival_time,
		`destination_city` =P_destination_city
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new` flight supply.
        -- We will check if a flight supply with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`flight supply` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new flight supply record.
            INSERT INTO `expediaflightbooking`.`flight supply`
            (
		`id`,
                `flight_number`,
                `airline_id`,
                `depature_time`,
                `depature_city`,
                `arrival_time`,
                `destination_city`
            )
            VALUES
            (
		P_id,
                P_flight_number,
                P_airline_id,
                P_depature_time,
                P_depature_city,
                P_arrival_time,
                P_destination_city
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savegender` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savegender` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savegender`(in P_id int(11),in P_gender_name char(1))
BEGIN
-- Check if we are updating an existing gender(P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the gender exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`gender`
        SET
		`id` = P_id,
		`gender_name` = P_gender_name
		
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new gender.
        -- We will check if a gender with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`gender` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new gender record.
            INSERT INTO `expediaflightbooking`.`gender`
            (
		`id`,
                `gender_name`
                
            )
            VALUES
            (
		P_id,
                P_gender_name
                
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveidentification document` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveidentification document` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveidentification document`(in P_id int(11),in P_document_name varchar(200))
BEGIN
-- Check if we are updating an existing identification document (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the identification document exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`identification document`
        SET
		`id` = P_id,
		`document_name` = P_document_name
		
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new identification document.
        -- We will check if a identification document with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`identification document` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new identification document record.
            INSERT INTO `expediaflightbooking`.`identification document`
            (
		`id`,
                `document_name`
                
            )
            VALUES
            (
		P_id,
                P_document_name
                
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepassengermanifest` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepassengermanifest` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepassengermanifest`(IN P_id int(11),in P_booking_id int(11),in P_booking_class_id int(11),IN P_name varchar(100),in P_DOB date,IN P_gender_id int(11))
BEGIN
-- Check if we are updating an existing passenger _manifest (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the passenger _manifest exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`passenger _manifest`
        SET
		`id` = P_id,
		`booking_id` = P_booking_id,
		`booking_class_id`= P_booking_class_id,
		`name` =P_name,
		`DOB` =P_DOB,
		`gender_id` =P_gender_id
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new passenger _manifest.
        -- We will check if a passenger _manifest with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`passenger _manifest` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new passenger _manifest record.
            INSERT INTO `expediaflightbooking`.`passenger _manifest`
            (
		`id`,
                `booking_id`,
                `booking_class_id`,
                `name`,
                `DOB`,
                `gender_id`
            )
            VALUES
            (
		P_id,
                P_booking_id,
                P_booking_class_id,
                P_name,
                P_DOB,
                P_gender_id
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepayment method` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepayment method` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepayment method`(in P_id Int(11),in P_payment_name varchar(100))
BEGIN
-- Check if we are updating an existing payment method (P_Id is greater than 0)
    IF P_id = 0 THEN
        -- If the payment method exists, update its name and country ID.
        UPDATE `expediaflightbooking`.`payment method`
        SET
		`id` = P_id,
		`payment_name` = P_payment_name
		
        WHERE
		`id` = P_id;
    ELSE
        -- If P_id is 0, we're adding a new payment method.
        -- We will check if a payment method with the same name already exists to prevent duplicates.
        IF NOT EXISTS (
            SELECT 1 
            FROM `expediaflightbooking`.`payment method` 
            WHERE `id` = P_id
        ) THEN
            -- If no duplicate is found, insert the new payment method record.
            INSERT INTO `expediaflightbooking`.`payment method`
            (
		`id`,
                `payment_name`
                
            )
            VALUES
            (
		P_id,
                P_payment_name
               
            );
        END IF;
    END IF;

	END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
