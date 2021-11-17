/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.11-MariaDB : Database - banka_iteh
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`banka_iteh` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `banka_iteh`;

/*Table structure for table `korisnik` */

DROP TABLE IF EXISTS `korisnik`;

CREATE TABLE `korisnik` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `prosek_primanja` decimal(11,2) DEFAULT NULL,
  `period_zaposlenja` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `korisnik` */

insert  into `korisnik`(`id`,`ime`,`prezime`,`prosek_primanja`,`period_zaposlenja`) values 
(1,'afsd','asfgdh',24354.00,234),
(2,'Lena','Marjanovic',34.00,4),
(5,'Mina','Kusic',40000.00,12);

/*Table structure for table `kredit` */

DROP TABLE IF EXISTS `kredit`;

CREATE TABLE `kredit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(40) NOT NULL,
  `minimun_primanja` decimal(11,2) NOT NULL,
  `minimum_zaposlen` int(11) NOT NULL,
  `minimalni_iznos` int(11) NOT NULL,
  `maksimalni_iznos` int(11) NOT NULL,
  `minimalni_period` int(11) NOT NULL,
  `maksimalni_period` int(11) NOT NULL,
  `kamatna_stopa` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

/*Data for the table `kredit` */

insert  into `kredit`(`id`,`naziv`,`minimun_primanja`,`minimum_zaposlen`,`minimalni_iznos`,`maksimalni_iznos`,`minimalni_period`,`maksimalni_period`,`kamatna_stopa`) values 
(1,'kes kredit',20000.00,8,1000,30000,3,71,8.45),
(2,'auto kredit',60000.00,12,4000,80000,6,60,4.50),
(3,'stambeni kredit',40000.00,24,20000,600000,24,360,3.10);

/*Table structure for table `zahtev` */

DROP TABLE IF EXISTS `zahtev`;

CREATE TABLE `zahtev` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `kredit` bigint(20) NOT NULL,
  `korisnik` bigint(20) NOT NULL,
  `iznos` decimal(10,0) NOT NULL,
  `period_otplate` decimal(10,0) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kredit` (`kredit`),
  KEY `korisnik` (`korisnik`),
  CONSTRAINT `zahtev_ibfk_1` FOREIGN KEY (`kredit`) REFERENCES `kredit` (`id`),
  CONSTRAINT `zahtev_ibfk_2` FOREIGN KEY (`korisnik`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `zahtev` */

insert  into `zahtev`(`id`,`kredit`,`korisnik`,`iznos`,`period_otplate`,`status`) values 
(1,1,1,1500,12,'NEPRIHVATLJIV'),
(2,1,1,2222,23,''),
(3,1,1,2222,23,'PRIHVATLJIV'),
(4,1,1,2333,12,'PRIHVATLJIV'),
(5,1,1,3421,23,'PRIHVATLJIV'),
(6,1,1,2341,12,'PRIHVATLJIV'),
(7,1,1,3333,13,'PRIHVATLJIV'),
(8,1,2,1200,40,'NEPRIHVATLJIV'),
(9,1,5,5000,30,'PRIHVATLJIV');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
