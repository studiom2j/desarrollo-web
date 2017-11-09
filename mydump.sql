/*
SQLyog Community v12.4.3 (32 bit)
MySQL - 10.1.25-MariaDB : Database - ecommerce
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ecommerce`;

/*Table structure for table `carttemp` */

DROP TABLE IF EXISTS `carttemp`;

CREATE TABLE `carttemp` (
  `carttemp_hidden` int(10) NOT NULL AUTO_INCREMENT,
  `carttemp_sess` char(50) NOT NULL,
  `carttemp_prodnum` char(5) NOT NULL,
  `carttemp_quan` int(3) NOT NULL,
  PRIMARY KEY (`carttemp_hidden`),
  KEY `carttemp_sess` (`carttemp_sess`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `carttemp` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `c_custnum` int(6) NOT NULL AUTO_INCREMENT,
  `c_firstname` varchar(15) NOT NULL,
  `c_lastname` varchar(50) NOT NULL,
  `c_city` varchar(50) NOT NULL,
  `c_state` char(2) NOT NULL,
  `c_zip` char(5) NOT NULL,
  `c_phone` char(12) NOT NULL,
  `c_email` varchar(50) NOT NULL,
  PRIMARY KEY (`c_custnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customers` */

/*Table structure for table `lc_addresses` */

DROP TABLE IF EXISTS `lc_addresses`;

CREATE TABLE `lc_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `company` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `address1` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `address2` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `city` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `postcode` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_addresses` */

/*Table structure for table `lc_cart_items` */

DROP TABLE IF EXISTS `lc_cart_items`;

CREATE TABLE `lc_cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `cart_uid` varchar(13) COLLATE utf8_swedish_ci NOT NULL,
  `key` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `options` varchar(2048) COLLATE utf8_swedish_ci NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `cart_uid` (`cart_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_cart_items` */

/*Table structure for table `lc_categories` */

DROP TABLE IF EXISTS `lc_categories`;

CREATE TABLE `lc_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `google_taxonomy_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `code` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `list_style` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `dock` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `keywords` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `image` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`),
  KEY `dock` (`dock`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_categories` */

insert  into `lc_categories`(`id`,`parent_id`,`google_taxonomy_id`,`status`,`code`,`list_style`,`dock`,`keywords`,`image`,`priority`,`date_updated`,`date_created`) values 
(1,0,0,1,'','columns','menu,tree','','',0,'2017-10-28 22:47:53','2017-10-28 22:47:53'),
(2,1,0,1,'','rows','','','',0,'2017-10-28 22:47:53','2017-10-28 22:47:53');

/*Table structure for table `lc_categories_info` */

DROP TABLE IF EXISTS `lc_categories_info`;

CREATE TABLE `lc_categories_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `short_description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `description` text COLLATE utf8_swedish_ci NOT NULL,
  `head_title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `h1_title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `meta_description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category_id`,`language_code`),
  KEY `category_id` (`category_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_categories_info` */

insert  into `lc_categories_info`(`id`,`category_id`,`language_code`,`name`,`short_description`,`description`,`head_title`,`h1_title`,`meta_description`) values 
(1,1,'en','Rubber Ducks','','','','',''),
(2,2,'en','Subcategory','','','','','');

/*Table structure for table `lc_countries` */

DROP TABLE IF EXISTS `lc_countries`;

CREATE TABLE `lc_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `domestic_name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `iso_code_1` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `iso_code_3` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `tax_id_format` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `address_format` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `postcode_format` varchar(512) COLLATE utf8_swedish_ci NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `language_code` varchar(2) CHARACTER SET utf8 NOT NULL,
  `currency_code` varchar(3) CHARACTER SET utf8 NOT NULL,
  `phone_code` varchar(3) CHARACTER SET utf8 NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iso_code_2` (`iso_code_2`),
  UNIQUE KEY `iso_code_3` (`iso_code_3`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_countries` */

insert  into `lc_countries`(`id`,`status`,`name`,`domestic_name`,`iso_code_1`,`iso_code_2`,`iso_code_3`,`tax_id_format`,`address_format`,`postcode_format`,`postcode_required`,`language_code`,`currency_code`,`phone_code`,`date_updated`,`date_created`) values 
(1,1,'Afghanistan','','004','AF','AFG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fa','AFN','93','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(2,1,'Albania','','008','AL','ALB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sq','ALL','355','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(3,1,'Algeria','','012','DZ','DZA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','DZD','213','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(4,1,'American Samoa','','016','AS','ASM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','96799',0,'en','USD','168','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(5,1,'Andorra','','020','AD','AND','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','AD[0-9]{3}',0,'ca','EUR','376','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(6,1,'Angola','','024','AO','AGO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'pt','AOA','244','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(7,1,'Anguilla','','660','AI','AIA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','126','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(8,1,'Antarctica','','010','AQ','ATA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'','XCD','672','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(9,1,'Antigua and Barbuda','','028','AG','ATG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','126','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(10,1,'Argentina','','032','AR','ARG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([A-HJ-NP-Z])?[0-9]{4}([A-Z]{3})?',0,'es','ARS','54','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(11,1,'Armenia','','051','AM','ARM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(37)?[0-9]{4}',0,'hy','AMD','374','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(12,1,'Aruba','','533','AW','ABW','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'nl','AWG','297','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(13,1,'Australia','','036','AU','AUS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','AUD','61','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(14,1,'Austria','','040','AT','AUT','^(AT)?U[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'de','EUR','43','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(15,1,'Azerbaijan','','031','AZ','AZE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'az','AZN','994','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(16,1,'Bahamas','','044','BS','BHS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','BSD','124','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(17,1,'Bahrain','','048','BH','BHR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','((1[0-2]|[2-9])[0-9]{2})?',0,'ar','BHD','973','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(18,1,'Bangladesh','','050','BD','BGD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'bn','BDT','880','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(19,1,'Barbados','','052','BB','BRB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(BB[0-9]{5})?',0,'en','BBD','124','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(20,1,'Belarus','','112','BY','BLR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'be','BYR','375','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(21,1,'Belgium','','056','BE','BEL','^(BE)?0[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'nl','EUR','32','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(22,1,'Belize','','084','BZ','BLZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','BZD','501','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(23,1,'Benin','','204','BJ','BEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','229','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(24,1,'Bermuda','','060','BM','BMU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[A-Z]{2}[ ]?[A-Z0-9]{2}',0,'en','BMD','144','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(25,1,'Bhutan','','064','BT','BTN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'dz','BTN','975','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(26,1,'Bolivia','','068','BO','BOL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','BOB','591','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(27,1,'Bosnia and Herzegowina','','070','BA','BIH','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'bs','BAM','387','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(28,1,'Botswana','','072','BW','BWA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','BWP','267','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(29,1,'Bouvet Island','','074','BV','BVT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'','NOK','47','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(30,1,'Brazil','','076','BR','BRA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}[\\-]?[0-9]{3}',0,'pt','BRL','55','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(31,1,'British Indian Ocean Territory','','086','IO','IOT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','BBND 1ZZ',0,'en','USD','246','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(32,1,'Brunei Darussalam','','096','BN','BRN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[A-Z]{2}[ ]?[0-9]{4}',0,'ms','BND','673','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(33,1,'Bulgaria','','100','BG','BGR','^(BG)?[0-9]{9,10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'bg','BGN','359','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(34,1,'Burkina Faso','','854','BF','BFA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','226','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(35,1,'Burundi','','108','BI','BDI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','BIF','257','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(36,1,'Cambodia','','116','KH','KHM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'km','KHR','855','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(37,1,'Cameroon','','120','CM','CMR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XAF','237','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(38,1,'Canada','','124','CA','CAN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[ABCEGHJKLMNPRSTVXY][0-9][ABCEGHJ-NPRSTV-Z][ ]?[0-9][ABCEGHJ-NPRSTV-Z][0-9]',0,'en','CAD','1','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(39,1,'Cape Verde','','132','CV','CPV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'pt','CVE','238','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(40,1,'Cayman Islands','','136','KY','CYM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','KYD','134','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(41,1,'Central African Republic','','140','CF','CAF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','236','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(42,1,'Chad','','148','TD','TCD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','235','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(43,1,'Chile','','152','CL','CHL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','CLP','56','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(44,1,'China','','156','CN','CHN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'zh','CNY','86','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(45,1,'Christmas Island','','162','CX','CXR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','6798',0,'en','AUD','61','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(46,1,'Cocos (Keeling) Islands','','166','CC','CCK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','6799',0,'ms','AUD','61','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(47,1,'Colombia','','170','CO','COL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','COP','57','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(48,1,'Comoros','','174','KM','COM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','KMF','269','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(49,1,'Congo','','178','CG','COG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','242','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(50,1,'Cook Islands','','184','CK','COK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','NZD','682','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(51,1,'Costa Rica','','188','CR','CRI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4,5}|[0-9]{3}-[0-9]{4}',0,'es','CRC','506','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(52,1,'Cote D\'Ivoire','','384','CI','CIV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','225','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(53,1,'Croatia','','191','HR','HRV','^(HR)?[0-9]{11}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'hr','HRK','385','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(54,1,'Cuba','','192','CU','CUB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','CUP','53','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(55,1,'Cyprus','','196','CY','CYP','^(CY)?[0-9]{8}L$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'el','EUR','357','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(56,1,'Czech Republic','','203','CZ','CZE','^(CZ)?[0-9]{8,10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'cs','CZK','420','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(57,1,'Denmark','','208','DK','DNK','^(DK)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'da','DKK','45','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(58,1,'Djibouti','','262','DJ','DJI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','DJF','253','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(59,1,'Dominica','','212','DM','DMA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','176','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(60,1,'Dominican Republic','','214','DO','DOM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','DOP','180','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(61,1,'East Timor','','626','TP','TMP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'','USD','670','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(62,1,'Ecuador','','218','EC','ECU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([A-Z][0-9]{4}[A-Z]|(?:[A-Z]{2})?[0-9]{6})?',0,'es','ECS','593','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(63,1,'Egypt','','818','EG','EGY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','EGP','20','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(64,1,'El Salvador','','222','SV','SLV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','SVC','503','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(65,1,'Equatorial Guinea','','226','GQ','GNQ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','XAF','240','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(66,1,'Eritrea','','232','ER','ERI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'aa','ERN','291','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(67,1,'Estonia','','233','EE','EST','^(EE)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'et','EUR','372','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(68,1,'Ethiopia','','231','ET','ETH','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'am','ETB','251','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(69,1,'Falkland Islands (Malvinas)','','238','FK','FLK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','FIQQ 1ZZ',0,'en','FKP','500','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(70,1,'Faroe Islands','','234','FO','FRO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'fo','DKK','298','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(71,1,'Fiji','','242','FJ','FJI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','FJD','679','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(72,1,'Finland','','246','FI','FIN','^(FI)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'fi','EUR','358','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(73,1,'France','','250','FR','FRA','^(FR)?[0-9A-Z]{2}[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{2}[ ]?[0-9]{3}',0,'fr','EUR','33','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(75,1,'French Guiana','','254','GF','GUF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]3[0-9]{2}',0,'fr','EUR','594','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(76,1,'French Polynesia','','258','PF','PYF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','987[0-9]{2}',0,'fr','XPF','689','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(77,1,'French Southern Territories','','260','TF','ATF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','EUR','262','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(78,1,'Gabon','','266','GA','GAB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','241','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(79,1,'Gambia','','270','GM','GMB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GMD','220','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(80,1,'Georgia','','268','GE','GEO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ka','GEL','995','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(81,1,'Germany','','276','DE','DEU','^(DE)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'de','EUR','49','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(82,1,'Ghana','','288','GH','GHA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GHS','233','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(83,1,'Gibraltar','','292','GI','GIB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GIP','350','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(84,1,'Greece','','300','GR','GRC','^(EL|GR)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'el','EUR','30','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(85,1,'Greenland','','304','GL','GRL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','39[0-9]{2}',0,'kl','DKK','299','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(86,1,'Grenada','','308','GD','GRD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','147','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(87,1,'Guadeloupe','','312','GP','GLP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78][01][0-9]{2}',0,'fr','EUR','590','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(88,1,'Guam','','316','GU','GUM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','969[123][0-9]([ \\-][0-9]{4})?',0,'en','USD','167','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(89,1,'Guatemala','','320','GT','GTM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','QTQ','502','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(90,1,'Guinea','','324','GN','GIN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'fr','GNF','224','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(91,1,'Guinea-bissau','','624','GW','GNB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'pt','GWP','245','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(92,1,'Guyana','','328','GY','GUY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','GYD','592','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(93,1,'Haiti','','332','HT','HTI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ht','HTG','509','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(94,1,'Heard and McDonald Islands','','334','HM','HMD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'','AUD','0','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(95,1,'Honduras','','340','HN','HND','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(?:[0-9]{5})?',0,'es','HNL','504','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(96,1,'Hong Kong','','344','HK','HKG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'zh','HKD','852','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(97,1,'Hungary','','348','HU','HUN','^(HU)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'hu','HUF','36','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(98,1,'Iceland','','352','IS','ISL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'is','ISK','354','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(99,1,'India','','356','IN','IND','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'en','INR','91','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(100,1,'Indonesia','','360','ID','IDN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'id','IDR','62','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(101,1,'Iran, Islamic Republic of','','364','IR','IRN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fa','IRR','98','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(102,1,'Iraq','','368','IQ','IRQ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','IQD','964','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(103,1,'Ireland','','372','IE','IRL','^(IE)?[0-9]S[0-9]{5}L$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','EUR','353','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(104,1,'Israel','','376','IL','ISR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'he','ILS','972','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(105,1,'Italy','','380','IT','ITA','^(IT)?[0-9]{11}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'it','EUR','39','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(106,1,'Jamaica','','388','JM','JAM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','JMD','187','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(107,1,'Japan','','392','JP','JPN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}-[0-9]{4}',0,'ja','JPY','81','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(108,1,'Jordan','','400','JO','JOR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','JOD','962','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(109,1,'Kazakhstan','','398','KZ','KAZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'kk','KZT','7','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(110,1,'Kenya','','404','KE','KEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'en','KES','254','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(111,1,'Kiribati','','296','KI','KIR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','AUD','686','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(112,1,'North Korea','','408','KP','PRK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ko','KPW','850','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(113,1,'Korea, Republic of','','410','KR','KOR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[\\-][0-9]{3}',0,'ko','KRW','82','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(114,1,'Kuwait','','414','KW','KWT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','KWD','965','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(115,1,'Kyrgyzstan','','417','KG','KGZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'ky','KGS','996','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(116,1,'Lao People\'s Democratic Republic','','418','LA','LAO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'lo','LAK','856','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(117,1,'Latvia','','428','LV','LVA','^(LV)?[0-9]{11}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'lv','LVL','371','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(118,1,'Lebanon','','422','LB','LBN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([0-9]{4}([ ]?[0-9]{4})?)?',0,'ar','LBP','961','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(119,1,'Lesotho','','426','LS','LSO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'en','LSL','266','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(120,1,'Liberia','','430','LR','LBR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','LRD','231','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(121,1,'Libyan Arab Jamahiriya','','434','LY','LBY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','LYD','218','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(122,1,'Liechtenstein','','438','LI','LIE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(948[5-9])|(949[0-7])',0,'de','CHF','423','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(123,1,'Lithuania','','440','LT','LTU','^(LT)?([0-9]{9}|[0-9]{12})$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'lt','LTL','370','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(124,1,'Luxembourg','','442','LU','LUX','^(LU)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'lb','EUR','352','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(125,1,'Macau','','446','MO','MAC','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'zh','MOP','853','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(126,1,'Macedonia','','807','MK','MKD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'mk','MKD','389','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(127,1,'Madagascar','','450','MG','MDG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'fr','MGF','261','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(128,1,'Malawi','','454','MW','MWI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ny','MWK','265','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(129,1,'Malaysia','','458','MY','MYS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ms','MYR','60','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(130,1,'Maldives','','462','MV','MDV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'dv','MVR','960','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(131,1,'Mali','','466','ML','MLI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','223','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(132,1,'Malta','','470','MT','MLT','^(MT)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'mt','EUR','356','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(133,1,'Marshall Islands','','584','MH','MHL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','969[67][0-9]([ \\-][0-9]{4})?',0,'mh','USD','692','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(134,1,'Martinique','','474','MQ','MTQ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]2[0-9]{2}',0,'fr','EUR','596','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(135,1,'Mauritania','','478','MR','MRT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','MRO','222','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(136,1,'Mauritius','','480','MU','MUS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([0-9]{3}[A-Z]{2}[0-9]{3})?',0,'en','MUR','230','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(137,1,'Mayotte','','175','YT','MYT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','976[0-9]{2}',0,'fr','EUR','262','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(138,1,'Mexico','','484','MX','MEX','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','MXN','52','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(139,1,'Micronesia, Federated States of','','583','FM','FSM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(9694[1-4])([ \\-][0-9]{4})?',0,'en','USD','691','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(140,1,'Moldova, Republic of','','498','MD','MDA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ro','MDL','373','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(141,1,'Monaco','','492','MC','MCO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','980[0-9]{2}',0,'fr','EUR','377','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(142,1,'Mongolia','','496','MN','MNG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'mn','MNT','976','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(143,1,'Montserrat','','500','MS','MSR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','166','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(144,1,'Morocco','','504','MA','MAR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','MAD','212','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(145,1,'Mozambique','','508','MZ','MOZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'pt','MZN','258','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(146,1,'Myanmar','','104','MM','MMR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'my','MMK','95','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(147,1,'Namibia','','516','NA','NAM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','NAD','264','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(148,1,'Nauru','','520','NR','NRU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'na','AUD','674','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(149,1,'Nepal','','524','NP','NPL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ne','NPR','977','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(150,1,'Netherlands','','528','NL','NLD','^(NL)?[0-9]{9}B[0-9]{2}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4} ?[a-zA-Z]{2}',0,'nl','EUR','31','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(151,1,'Netherlands Antilles','','530','AN','ANT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'nl','ANG','599','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(152,1,'New Caledonia','','540','NC','NCL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','988[0-9]{2}',0,'fr','XPF','687','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(153,1,'New Zealand','','554','NZ','NZL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'en','NZD','64','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(154,1,'Nicaragua','','558','NI','NIC','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(([0-9]{4}-)?[0-9]{3}-[0-9]{3}(-[0-9]{1})?)?',0,'es','NIO','505','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(155,1,'Niger','','562','NE','NER','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'fr','XOF','227','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(156,1,'Nigeria','','566','NG','NGA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','([0-9]{6})?',0,'en','NGN','234','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(157,1,'Niue','','570','NU','NIU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','NZD','683','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(158,1,'Norfolk Island','','574','NF','NFK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','2899',0,'en','AUD','672','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(159,1,'Northern Mariana Islands','','580','MP','MNP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9695[012]([ \\-][0-9]{4})?',0,'tl','USD','167','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(160,1,'Norway','','578','NO','NOR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'no','NOK','47','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(161,1,'Oman','','512','OM','OMN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(PC )?[0-9]{3}',0,'ar','OMR','968','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(162,1,'Pakistan','','586','PK','PAK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ur','PKR','92','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(163,1,'Palau','','585','PW','PLW','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','96940',0,'en','USD','680','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(164,1,'Panama','','591','PA','PAN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','PAB','507','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(165,1,'Papua New Guinea','','598','PG','PNG','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}',0,'en','PGK','675','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(166,1,'Paraguay','','600','PY','PRY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'es','PYG','595','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(167,1,'Peru','','604','PE','PER','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'es','PEN','51','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(168,1,'Philippines','','608','PH','PHL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'tl','PHP','63','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(169,1,'Pitcairn','','612','PN','PCN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','PCRN 1ZZ',0,'en','NZD','870','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(170,1,'Poland','','616','PL','POL','^(PL)?[0-9]{10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{2}-[0-9]{3}',0,'pl','PLN','48','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(171,1,'Portugal','','620','PT','PRT','^(PT)?[0-9]{9}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}([\\-][0-9]{3})?',0,'pt','EUR','351','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(172,1,'Puerto Rico','','630','PR','PRI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','00[679][0-9]{2}([ \\-][0-9]{4})?',0,'en','USD','1','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(173,1,'Qatar','','634','QA','QAT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','QAR','974','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(174,1,'Reunion','','638','RE','REU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]4[0-9]{2}',0,'fr','EUR','262','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(175,1,'Romania','','642','RO','ROM','^(RO)?[0-9]{2,10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'ro','RON','40','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(176,1,'Russian Federation','','643','RU','RUS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'ru','RUB','7','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(177,1,'Rwanda','','646','RW','RWA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'rw','RWF','250','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(178,1,'Saint Kitts and Nevis','','659','KN','KNA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','186','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(179,1,'Saint Lucia','','662','LC','LCA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','175','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(180,1,'Saint Vincent and the Grenadines','','670','VC','VCT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','XCD','178','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(181,1,'Samoa','','882','WS','WSM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sm','WST','685','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(182,1,'San Marino','','674','SM','SMR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','4789[0-9]',0,'it','EUR','378','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(183,1,'Sao Tome and Principe','','678','ST','STP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'pt','STD','239','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(184,1,'Saudi Arabia','','682','SA','SAU','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'ar','SAR','966','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(185,1,'Senegal','','686','SN','SEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'fr','XOF','221','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(186,1,'Seychelles','','690','SC','SYC','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','SCR','248','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(187,1,'Sierra Leone','','694','SL','SLE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','SLL','232','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(188,1,'Singapore','','702','SG','SGP','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'en','SGD','65','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(189,1,'Slovak Republic','','703','SK','SVK','^(SK)?[0-9]{10}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'sk','EUR','421','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(190,1,'Slovenia','','705','SI','SVN','^(SI)?[0-9]{8}$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'sl','EUR','386','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(191,1,'Solomon Islands','','090','SB','SLB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','SBD','677','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(192,1,'Somalia','','706','SO','SOM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'so','SOS','252','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(193,1,'South Africa','','710','ZA','ZAF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'zu','ZAR','27','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(194,1,'South Georgia and South Sandwich Islands','','239','GS','SGS','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','SIQQ 1ZZ',0,'en','GBP','500','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(195,1,'Spain','','724','ES','ESP','^(ES)?[0-9A-Z][0-9]{7}[0-9A-Z]$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','EUR','34','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(196,1,'Sri Lanka','','144','LK','LKA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'si','LKR','94','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(197,1,'St. Helena','','654','SH','SHN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','(ASCN|STHL) 1ZZ',0,'en','SHP','290','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(198,1,'St. Pierre and Miquelon','','666','PM','SPM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','9[78]5[0-9]{2}',0,'fr','EUR','508','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(199,1,'Sudan','','729','SD','SDN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','SDG','249','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(200,1,'Suriname','','740','SR','SUR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'nl','SRD','597','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(201,1,'Svalbard and Jan Mayen Islands','','744','SJ','SJM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'no','NOK','47','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(202,1,'Swaziland','','748','SZ','SWZ','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[HLMS][0-9]{3}',0,'en','SZL','268','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(203,1,'Sweden','','752','SE','SWE','^(SE)?(16|19|20)?[0-9]{6}-?[0-9]{4}?(01)?$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}[ ]?[0-9]{2}',0,'sv','SEK','46','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(204,1,'Switzerland','','756','CH','CHE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'de','CHF','41','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(205,1,'Syrian Arab Republic','','760','SY','SYR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','SYP','963','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(206,1,'Taiwan','','158','TW','TWN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{3}([0-9]{2})?',0,'zh','TWD','886','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(207,1,'Tajikistan','','762','TJ','TJK','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'tg','TJS','992','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(208,1,'Tanzania, United Republic of','','834','TZ','TZA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sw','TZS','255','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(209,1,'Thailand','','764','TH','THA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'th','THB','66','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(210,1,'Togo','','768','TG','TGO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XOF','228','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(211,1,'Tokelau','','772','TK','TKL','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','NZD','690','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(212,1,'Tonga','','776','TO','TON','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'to','TOP','676','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(213,1,'Trinidad and Tobago','','780','TT','TTO','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','TTD','186','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(214,1,'Tunisia','','788','TN','TUN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'ar','TND','216','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(215,1,'Turkey','','792','TR','TUR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'tr','TRY','90','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(216,1,'Turkmenistan','','795','TM','TKM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'tk','TMT','993','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(217,1,'Turks and Caicos Islands','','796','TC','TCA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','TKCA 1ZZ',0,'en','USD','164','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(218,1,'Tuvalu','','798','TV','TUV','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','AUD','688','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(219,1,'Uganda','','800','UG','UGA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','UGX','256','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(220,1,'Ukraine','','804','UA','UKR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'uk','UAH','380','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(221,1,'United Arab Emirates','','784','AE','ARE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','AED','971','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(222,1,'United Kingdom','','826','GB','GBR','^(GB)?([0-9]{9}([0-9]{3})?|[A-Z]{2}[0-9]{3})$','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',1,'en','GBP','44','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(223,1,'United States','','840','US','USA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}([ \\-][0-9]{4})?',0,'en','USD','1','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(224,1,'United States Minor Outlying Islands','','581','UM','UMI','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','USD','1','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(225,1,'Uruguay','','858','UY','URY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'es','UYU','598','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(226,1,'Uzbekistan','','860','UZ','UZB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{6}',0,'uz','UZS','998','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(227,1,'Vanuatu','','548','VU','VUT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'bi','VUV','678','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(228,1,'Vatican City State (Holy See)','','336','VA','VAT','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','00120',0,'la','EUR','39','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(229,1,'Venezuela','','862','VE','VEN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{4}',0,'es','VEF','58','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(230,1,'Viet Nam','','704','VN','VNM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'vi','VND','84','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(231,1,'Virgin Islands (British)','','092','VG','VGB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','USD','128','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(232,1,'Virgin Islands (U.S.)','','850','VI','VIR','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','008(([0-4][0-9])|(5[01]))([ \\-][0-9]{4})?',0,'en','USD','134','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(233,1,'Wallis and Futuna Islands','','876','WF','WLF','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','986[0-9]{2}',0,'fr','XPF','681','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(234,1,'Western Sahara','','732','EH','ESH','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','MAD','212','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(235,1,'Yemen','','887','YE','YEM','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'ar','YER','967','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(236,1,'Serbia','','381','RS','SRB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'sr','RSD','381','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(237,1,'Democratic Republic of Congo','','180','CD','COD','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'fr','XAF','243','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(238,1,'Zambia','','894','ZM','ZMB','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','[0-9]{5}',0,'en','ZMW','260','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(239,1,'Zimbabwe','','716','ZW','ZWE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','ZWD','263','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(240,1,'Guernsey','','831','GG','GGY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','44','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(241,1,'Montenegro','','499','ME','MNE','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','382','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(242,1,'Jersey','','832','JE','JEY','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','44','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(243,1,'Isle of Man','','833','IM','IMN','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','','44','2017-10-28 22:47:45','2017-10-28 22:47:45'),
(244,1,'Åland Islands','','248','AX','ALA','','%company\r\n%firstname %lastname\r\n%address1\r\n%address2\r\n%postcode %city\r\n%zone_name\r\n%country_name','',0,'en','EUR','358','2017-10-28 22:47:45','2017-10-28 22:47:45');

/*Table structure for table `lc_currencies` */

DROP TABLE IF EXISTS `lc_currencies`;

CREATE TABLE `lc_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `code` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `number` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `value` decimal(10,4) NOT NULL,
  `decimals` tinyint(1) NOT NULL,
  `prefix` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `suffix` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_currencies` */

insert  into `lc_currencies`(`id`,`status`,`code`,`number`,`name`,`value`,`decimals`,`prefix`,`suffix`,`priority`,`date_updated`,`date_created`) values 
(1,1,'USD','840','US Dollars',1.0000,2,'$','',0,'2017-10-28 22:47:45','2017-10-28 22:47:45'),
(2,1,'EUR','978','Euros',0.7260,2,'',' €',0,'2017-10-28 22:47:45','2017-10-28 22:47:45');

/*Table structure for table `lc_customers` */

DROP TABLE IF EXISTS `lc_customers`;

CREATE TABLE `lc_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `tax_id` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `company` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `firstname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `lastname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `address1` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `address2` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `postcode` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `city` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `country_code` varchar(4) COLLATE utf8_swedish_ci NOT NULL,
  `zone_code` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `phone` varchar(24) COLLATE utf8_swedish_ci NOT NULL,
  `different_shipping_address` tinyint(1) NOT NULL,
  `shipping_company` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_firstname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_lastname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_address1` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_address2` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_city` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_postcode` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_country_code` varchar(4) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_zone_code` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_phone` varchar(24) COLLATE utf8_swedish_ci NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT '1',
  `notes` text COLLATE utf8_swedish_ci NOT NULL,
  `password_reset_token` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_customers` */

insert  into `lc_customers`(`id`,`code`,`status`,`email`,`password`,`tax_id`,`company`,`firstname`,`lastname`,`address1`,`address2`,`postcode`,`city`,`country_code`,`zone_code`,`phone`,`different_shipping_address`,`shipping_company`,`shipping_firstname`,`shipping_lastname`,`shipping_address1`,`shipping_address2`,`shipping_city`,`shipping_postcode`,`shipping_country_code`,`shipping_zone_code`,`shipping_phone`,`newsletter`,`notes`,`password_reset_token`,`date_updated`,`date_created`) values 
(1,'',1,'user@email.com','000000000000000000000000000000000000000000000000','0000000000','ACME Corp.','John','Doe','Longway Street 1','','12345','Newtown','US','CA','1-555-123-4567',0,'','','','','','','','','','',0,'','','2017-10-28 22:47:53','2017-10-28 22:47:53');

/*Table structure for table `lc_delivery_statuses` */

DROP TABLE IF EXISTS `lc_delivery_statuses`;

CREATE TABLE `lc_delivery_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_delivery_statuses` */

insert  into `lc_delivery_statuses`(`id`,`date_updated`,`date_created`) values 
(1,'2017-10-28 22:47:54','2017-10-28 22:47:54');

/*Table structure for table `lc_delivery_statuses_info` */

DROP TABLE IF EXISTS `lc_delivery_statuses_info`;

CREATE TABLE `lc_delivery_statuses_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_status_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `delivery_status` (`delivery_status_id`,`language_code`),
  KEY `delivery_status_id` (`delivery_status_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_delivery_statuses_info` */

insert  into `lc_delivery_statuses_info`(`id`,`delivery_status_id`,`language_code`,`name`,`description`) values 
(1,1,'en','3-5 days','');

/*Table structure for table `lc_geo_zones` */

DROP TABLE IF EXISTS `lc_geo_zones`;

CREATE TABLE `lc_geo_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_geo_zones` */

insert  into `lc_geo_zones`(`id`,`code`,`name`,`description`,`date_updated`,`date_created`) values 
(1,'','Canada','All states in Canada','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(2,'','United States of America','All states in USA','2017-10-28 22:47:53','2017-10-28 22:47:53');

/*Table structure for table `lc_languages` */

DROP TABLE IF EXISTS `lc_languages`;

CREATE TABLE `lc_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `code2` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `locale` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `charset` varchar(16) COLLATE utf8_swedish_ci NOT NULL,
  `raw_date` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `raw_time` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `raw_datetime` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `format_date` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `format_time` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `format_datetime` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `decimal_point` varchar(1) COLLATE utf8_swedish_ci NOT NULL,
  `thousands_sep` varchar(1) COLLATE utf8_swedish_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_languages` */

insert  into `lc_languages`(`id`,`status`,`code`,`code2`,`name`,`locale`,`charset`,`raw_date`,`raw_time`,`raw_datetime`,`format_date`,`format_time`,`format_datetime`,`decimal_point`,`thousands_sep`,`currency_code`,`priority`,`date_updated`,`date_created`) values 
(1,1,'en','eng','English','en_US.utf8,en_US.UTF-8,english','UTF-8','m/d/y','h:i:s A','m/d/y h:i:s A','%b %e %Y','%I:%M %p','%b %e %Y %I:%M %p','.',',','',0,'2017-10-28 22:47:45','2017-10-28 22:47:45');

/*Table structure for table `lc_manufacturers` */

DROP TABLE IF EXISTS `lc_manufacturers`;

CREATE TABLE `lc_manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `code` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `keywords` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `image` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_manufacturers` */

insert  into `lc_manufacturers`(`id`,`status`,`code`,`name`,`keywords`,`image`,`date_updated`,`date_created`) values 
(1,1,'acme','ACME Corp.','','manufacturers/1-acme-corp.png','2017-10-28 22:47:54','2017-10-28 22:47:54');

/*Table structure for table `lc_manufacturers_info` */

DROP TABLE IF EXISTS `lc_manufacturers_info`;

CREATE TABLE `lc_manufacturers_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `short_description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `description` text COLLATE utf8_swedish_ci NOT NULL,
  `h1_title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `head_title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `meta_description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manufacturer` (`manufacturer_id`,`language_code`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_manufacturers_info` */

insert  into `lc_manufacturers_info`(`id`,`manufacturer_id`,`language_code`,`short_description`,`description`,`h1_title`,`head_title`,`meta_description`,`link`) values 
(1,1,'en','','','','','','');

/*Table structure for table `lc_modules` */

DROP TABLE IF EXISTS `lc_modules`;

CREATE TABLE `lc_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `type` varchar(16) COLLATE utf8_swedish_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  `settings` text COLLATE utf8_swedish_ci NOT NULL,
  `last_log` text COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `module_id` (`module_id`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_modules` */

insert  into `lc_modules`(`id`,`module_id`,`type`,`status`,`priority`,`settings`,`last_log`,`date_updated`,`date_created`) values 
(1,'ot_subtotal','order_total',1,1,'{\"status\":\"1\",\"priority\":\"1\"}','','2017-10-28 22:47:46','2017-10-28 22:47:46'),
(2,'ot_shipping_fee','order_total',1,20,'{\"status\":\"1\",\"free_shipping_amount\":\"0\",\"priority\":\"20\"}','','2017-10-28 22:47:46','2017-10-28 22:47:46'),
(3,'ot_payment_fee','order_total',1,30,'{\"status\":\"1\",\"priority\":\"30\"}','','2017-10-28 22:47:46','2017-10-28 22:47:46');

/*Table structure for table `lc_option_groups` */

DROP TABLE IF EXISTS `lc_option_groups`;

CREATE TABLE `lc_option_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `function` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `required` tinyint(1) NOT NULL,
  `sort` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_option_groups` */

/*Table structure for table `lc_option_groups_info` */

DROP TABLE IF EXISTS `lc_option_groups_info`;

CREATE TABLE `lc_option_groups_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(512) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_option_groups_info` */

/*Table structure for table `lc_option_values` */

DROP TABLE IF EXISTS `lc_option_values`;

CREATE TABLE `lc_option_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `value` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_option_values` */

/*Table structure for table `lc_option_values_info` */

DROP TABLE IF EXISTS `lc_option_values_info`;

CREATE TABLE `lc_option_values_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `value_id` (`value_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_option_values_info` */

/*Table structure for table `lc_order_statuses` */

DROP TABLE IF EXISTS `lc_order_statuses`;

CREATE TABLE `lc_order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `icon` varchar(24) COLLATE utf8_swedish_ci NOT NULL,
  `color` varchar(7) COLLATE utf8_swedish_ci NOT NULL,
  `is_sale` tinyint(1) NOT NULL,
  `is_archived` tinyint(1) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_order_statuses` */

insert  into `lc_order_statuses`(`id`,`icon`,`color`,`is_sale`,`is_archived`,`notify`,`priority`,`date_updated`,`date_created`) values 
(1,'fa-money','#c0c0c0',0,0,0,1,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(2,'fa-clock-o','#d7d96f',1,0,0,2,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(3,'fa-cog','#ffa851',1,0,0,3,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(4,'fa-truck','#99cc66',1,1,0,4,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(5,'fa-times','#ff6666',0,1,0,5,'2017-10-28 22:47:46','2017-10-28 22:47:46');

/*Table structure for table `lc_order_statuses_info` */

DROP TABLE IF EXISTS `lc_order_statuses_info`;

CREATE TABLE `lc_order_statuses_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `email_subject` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `email_message` varchar(2048) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_id` (`order_status_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_order_statuses_info` */

insert  into `lc_order_statuses_info`(`id`,`order_status_id`,`language_code`,`name`,`description`,`email_subject`,`email_message`) values 
(1,1,'en','Awaiting payment','','',''),
(2,2,'en','Pending','','',''),
(3,3,'en','Processing','','',''),
(4,4,'en','Dispatched','','',''),
(5,5,'en','Cancelled','','','');

/*Table structure for table `lc_orders` */

DROP TABLE IF EXISTS `lc_orders`;

CREATE TABLE `lc_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(13) COLLATE utf8_swedish_ci NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_company` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `customer_firstname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `customer_lastname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `customer_email` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `customer_phone` varchar(24) COLLATE utf8_swedish_ci NOT NULL,
  `customer_tax_id` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `customer_address1` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `customer_address2` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `customer_city` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `customer_postcode` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `customer_country_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `customer_zone_code` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_company` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_firstname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_lastname` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_address1` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_address2` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_city` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_postcode` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_country_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_zone_code` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_phone` varchar(24) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_option_id` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_option_name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `shipping_tracking_id` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `payment_option_id` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `payment_option_name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `payment_transaction_id` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `weight_total` decimal(11,4) NOT NULL,
  `weight_class` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `currency_value` decimal(11,4) NOT NULL,
  `payment_due` decimal(11,4) NOT NULL,
  `tax_total` decimal(11,4) NOT NULL,
  `client_ip` varchar(39) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_status_id` (`order_status_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_orders` */

/*Table structure for table `lc_orders_comments` */

DROP TABLE IF EXISTS `lc_orders_comments`;

CREATE TABLE `lc_orders_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `author` enum('system','staff','customer') COLLATE utf8_swedish_ci NOT NULL,
  `text` varchar(512) COLLATE utf8_swedish_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_orders_comments` */

/*Table structure for table `lc_orders_items` */

DROP TABLE IF EXISTS `lc_orders_items`;

CREATE TABLE `lc_orders_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_stock_combination` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `options` varchar(4096) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `sku` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `price` decimal(11,4) NOT NULL,
  `tax` decimal(11,4) NOT NULL,
  `weight` decimal(11,4) NOT NULL,
  `weight_class` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_orders_items` */

/*Table structure for table `lc_orders_totals` */

DROP TABLE IF EXISTS `lc_orders_totals`;

CREATE TABLE `lc_orders_totals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `module_id` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `value` float NOT NULL,
  `tax` float NOT NULL,
  `calculate` tinyint(1) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_orders_totals` */

/*Table structure for table `lc_pages` */

DROP TABLE IF EXISTS `lc_pages`;

CREATE TABLE `lc_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `dock` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `dock` (`dock`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_pages` */

/*Table structure for table `lc_pages_info` */

DROP TABLE IF EXISTS `lc_pages_info`;

CREATE TABLE `lc_pages_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `title` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `content` mediumtext COLLATE utf8_swedish_ci NOT NULL,
  `head_title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `meta_description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_pages_info` */

/*Table structure for table `lc_product_groups` */

DROP TABLE IF EXISTS `lc_product_groups`;

CREATE TABLE `lc_product_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_product_groups` */

/*Table structure for table `lc_product_groups_info` */

DROP TABLE IF EXISTS `lc_product_groups_info`;

CREATE TABLE `lc_product_groups_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_id` (`product_group_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_product_groups_info` */

/*Table structure for table `lc_product_groups_values` */

DROP TABLE IF EXISTS `lc_product_groups_values`;

CREATE TABLE `lc_product_groups_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_id` (`product_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_product_groups_values` */

/*Table structure for table `lc_product_groups_values_info` */

DROP TABLE IF EXISTS `lc_product_groups_values_info`;

CREATE TABLE `lc_product_groups_values_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_group_value_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_group_value_id` (`product_group_value_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_product_groups_values_info` */

/*Table structure for table `lc_products` */

DROP TABLE IF EXISTS `lc_products`;

CREATE TABLE `lc_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `delivery_status_id` int(11) NOT NULL,
  `sold_out_status_id` int(11) NOT NULL,
  `default_category_id` int(11) NOT NULL,
  `product_groups` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `keywords` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `code` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `sku` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `upc` varchar(24) COLLATE utf8_swedish_ci NOT NULL COMMENT 'Deprecated',
  `gtin` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `taric` varchar(16) COLLATE utf8_swedish_ci NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `quantity_unit_id` int(1) NOT NULL,
  `weight` decimal(10,4) NOT NULL,
  `weight_class` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `dim_x` decimal(10,4) NOT NULL,
  `dim_y` decimal(10,4) NOT NULL,
  `dim_z` decimal(10,4) NOT NULL,
  `dim_class` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `purchase_price` decimal(10,4) NOT NULL,
  `purchase_price_currency_code` varchar(3) COLLATE utf8_swedish_ci NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `image` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `views` int(11) NOT NULL,
  `purchases` int(11) NOT NULL,
  `date_valid_from` date NOT NULL,
  `date_valid_to` date NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `default_category_id` (`default_category_id`),
  KEY `manufacturer_id` (`manufacturer_id`),
  KEY `keywords` (`keywords`),
  KEY `code` (`code`),
  KEY `date_valid_from` (`date_valid_from`),
  KEY `date_valid_to` (`date_valid_to`),
  KEY `purchases` (`purchases`),
  KEY `views` (`views`),
  KEY `product_groups` (`product_groups`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products` */

/*Table structure for table `lc_products_campaigns` */

DROP TABLE IF EXISTS `lc_products_campaigns`;

CREATE TABLE `lc_products_campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `USD` decimal(11,4) NOT NULL,
  `EUR` decimal(11,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products_campaigns` */

/*Table structure for table `lc_products_images` */

DROP TABLE IF EXISTS `lc_products_images`;

CREATE TABLE `lc_products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `filename` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `checksum` char(32) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products_images` */

/*Table structure for table `lc_products_info` */

DROP TABLE IF EXISTS `lc_products_info`;

CREATE TABLE `lc_products_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `short_description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `description` text COLLATE utf8_swedish_ci NOT NULL,
  `head_title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `meta_description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `attributes` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products_info` */

/*Table structure for table `lc_products_options` */

DROP TABLE IF EXISTS `lc_products_options`;

CREATE TABLE `lc_products_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  `price_operator` varchar(1) COLLATE utf8_swedish_ci NOT NULL,
  `USD` decimal(11,4) NOT NULL,
  `EUR` decimal(11,4) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products_options` */

/*Table structure for table `lc_products_options_stock` */

DROP TABLE IF EXISTS `lc_products_options_stock`;

CREATE TABLE `lc_products_options_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `combination` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `sku` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `weight` decimal(11,4) NOT NULL,
  `weight_class` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `dim_x` decimal(11,4) NOT NULL,
  `dim_y` decimal(11,4) NOT NULL,
  `dim_z` decimal(11,4) NOT NULL,
  `dim_class` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `quantity` decimal(11,4) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products_options_stock` */

/*Table structure for table `lc_products_prices` */

DROP TABLE IF EXISTS `lc_products_prices`;

CREATE TABLE `lc_products_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `USD` decimal(11,4) NOT NULL,
  `EUR` decimal(11,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products_prices` */

/*Table structure for table `lc_products_to_categories` */

DROP TABLE IF EXISTS `lc_products_to_categories`;

CREATE TABLE `lc_products_to_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_products_to_categories` */

/*Table structure for table `lc_quantity_units` */

DROP TABLE IF EXISTS `lc_quantity_units`;

CREATE TABLE `lc_quantity_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `decimals` tinyint(1) NOT NULL,
  `separate` tinyint(1) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_quantity_units` */

insert  into `lc_quantity_units`(`id`,`decimals`,`separate`,`priority`,`date_updated`,`date_created`) values 
(1,0,0,0,'2017-10-28 22:47:46','2017-10-28 22:47:46');

/*Table structure for table `lc_quantity_units_info` */

DROP TABLE IF EXISTS `lc_quantity_units_info`;

CREATE TABLE `lc_quantity_units_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_unit_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(512) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quantity_unit_id` (`quantity_unit_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_quantity_units_info` */

insert  into `lc_quantity_units_info`(`id`,`quantity_unit_id`,`language_code`,`name`,`description`) values 
(1,1,'en','pcs','');

/*Table structure for table `lc_settings` */

DROP TABLE IF EXISTS `lc_settings`;

CREATE TABLE `lc_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_group_key` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `type` enum('global','local') COLLATE utf8_swedish_ci NOT NULL DEFAULT 'local',
  `title` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(512) COLLATE utf8_swedish_ci NOT NULL,
  `key` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `value` varchar(8192) COLLATE utf8_swedish_ci NOT NULL,
  `function` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `setting_group_key` (`setting_group_key`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_settings` */

insert  into `lc_settings`(`id`,`setting_group_key`,`type`,`title`,`description`,`key`,`value`,`function`,`priority`,`date_updated`,`date_created`) values 
(1,'store_info','global','Store Name','The name of your store.','store_name','My Store','input()',10,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(2,'store_info','global','Store Email','The store e-mail address.','store_email','store@email.com','input()',11,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(3,'store_info','local','Store Tax ID','The store tax ID or VATIN.','store_tax_id','XX000000000000','input()',12,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(4,'store_info','local','Store Postal Address','The store postal address.','store_postal_address','My Store\r\nStreet\r\nPostcode City\r\nCountry','bigtext()',13,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(5,'store_info','local','Store Visiting Address','The store visiting address if applicable.','store_visiting_address','','bigtext()',14,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(6,'store_info','local','Store Phone Number','The store phone number.','store_phone','+1-212-555-DUCK','input()',15,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(7,'store_info','global','Store Country','The country of your store.','store_country_code','VE','countries()',16,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(8,'store_info','global','Store Time Zone','The store time zone.','store_timezone','Africa/Abidjan','timezones()',17,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(9,'store_info','local','Store Language','The spoken language of your organization.','store_language_code','en','languages()',18,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(10,'store_info','global','Store Currency','The currency of which all prices conform to.','store_currency_code','USD','currencies()',19,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(11,'store_info','global','Store Zone','The zone of your store.','store_zone_code','','zones()',20,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(12,'store_info','global','Store Weight Class','The prefered weight class.','store_weight_class','kg','weight_classes()',21,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(13,'store_info','global','Store Length Class','The prefered length class.','store_length_class','cm','length_classes()',22,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(14,'defaults','global','Default Language','The default language selected, if failed to identify.','default_language_code','en','languages()',10,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(15,'defaults','global','Default Currency','The default currency selected, if failed to identify.','default_currency_code','USD','currencies()',11,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(16,'defaults','global','Default Country','The default country selected if not set otherwise.','default_country_code','VE','countries()',12,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(17,'defaults','global','Default Zone','The default zone selected if not set otherwise.','default_zone_code','','zones()',13,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(18,'defaults','local','Default Tax Class','Default tax class that will be preset when creating new products.','default_tax_class_id','1','tax_classes()',14,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(19,'defaults','global','Default Display Prices Including Tax','Displays prices including tax by default.','default_display_prices_including_tax','1','toggle()',15,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(20,'defaults','global','Default Quantity Unit','Default quantity unit that will be preset when creating new products.','default_quantity_unit_id','1','quantity_units()',16,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(21,'defaults','global','Default Sold Out Status','Default sold out status that will be preset when creating new products.','default_sold_out_status_id','1','sold_out_statuses()',17,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(22,'defaults','global','Default Delivery Status','Default delivery status that will be preset when creating new products.','default_delivery_status_id','1','delivery_statuses()',18,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(23,'listings','global','Maintenance Mode','Setting the store in maintenance mode will prevent users from browsing your site.','maintenance_mode','0','toggle()',2,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(24,'listings','global','Catalog Only Mode','Disables the cart and checkout features leaving only a browsable catalog.','catalog_only_mode','0','toggle(\"t/f\")',1,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(25,'listings','local','Items Per Page','The number of items to be displayed per page.','items_per_page','20','int()',10,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(26,'listings','local','Data Table Rows','The number of data table rows per page.','data_table_rows_per_page','25','input()',11,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(27,'listings','local','Display Stock Count','Show the available amounts of products in stock.','display_stock_count','1','toggle()',12,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(28,'listings','local','Cheapest Shipping','Display the cheapest shipping cost on product page.','display_cheapest_shipping','1','toggle()',13,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(29,'listings','local','Max Age for New Products','Display the new sticker for products younger than the give age. E.g. 1 month or 14 days','new_products_max_age','1 month','input()',14,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(30,'listings','local','Similar Products Box: Number of Items','The maximum amount of items to be display in the box.','box_similar_products_num_items','10','int()',15,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(31,'listings','local','Recently Viewed Products Box: Number of Items','The maximum amount of items to be display in the box.','box_recently_viewed_products_num_items','6','int()',16,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(32,'listings','local','Latest Products Box: Number of Items','The maximum amount of items to be display in the box.','box_latest_products_num_items','10','int()',17,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(33,'listings','local','Popular Products Box: Number of Items','The maximum amount of items to be display in the box.','box_popular_products_num_items','10','int()',18,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(34,'listings','local','Campaign Products Box: Number of Items','The maximum amount of items to be display in the box.','box_campaign_products_num_items','5','int()',19,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(35,'listings','local','Also Purchased Products Box: Number of Items','The maximum amount of items to be display in the box.','box_also_purchased_products_num_items','4','int()',20,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(36,'listings','local','Auto Decimals','Show only decimals if there are any to display.','auto_decimals','1','toggle(\"e/d\")',20,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(37,'images','local','Category Images: Aspect Ratio','The aspect ratio of the category thumbnails','category_image_ratio','1:1','select(\"1:1\",\"2:3\",\"3:2\",\"3:4\",\"4:3\",\"16:9\")',10,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(38,'images','local','Category Images: Clipping Method','The clipping method used for scaled category thumbnails.','category_image_clipping','CROP','select(\"CROP\",\"FIT\",\"FIT_USE_WHITESPACING\")',11,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(39,'images','local','Product Images: Aspect Ratio','The aspect ratio of the product thumbnails','product_image_ratio','1:1','select(\"1:1\",\"2:3\",\"3:2\",\"3:4\",\"4:3\",\"16:9\")',30,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(40,'images','local','Product Images: Clipping Method','The clipping method used for scaled product thumbnails.','product_image_clipping','FIT_USE_WHITESPACING','select(\"CROP\",\"FIT\",\"FIT_USE_WHITESPACING\")',31,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(41,'images','local','Product Images: Trim Whitespace','Trim whitespace before generating thumbnail images.','product_image_trim','0','toggle(\"y/n\")',33,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(42,'images','local','Product Images: Watermark','Watermark product images with the store logo.','product_image_watermark','0','toggle(\"y/n\")',34,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(43,'images','local','Downsample','Downsample large uploaded images to best fit within the given dimensions of \"width,height\" or leave empty. Default: 2048,2048','image_downsample_size','2048,2048','smallinput()',34,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(44,'images','local','Image Quality','The JPEG quality for uploaded images (0-100). Default: 90','image_quality','90','int()',40,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(45,'images','local','Thumbnail Quality','The JPEG quality for thumbnail images (0-100). Default: 65','image_thumbnail_quality','65','int()',41,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(46,'images','local','Interlaced Thumbnails','Generate interlaced thumbnail images for progressive loading. Increases the filesize by 10-20% but improves user experience.','image_thumbnail_interlaced','0','toggle()',42,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(47,'images','local','Whitespace Color','Set the color of any generated whitespace to the given RGB value. Default: 255,255,255','image_whitespace_color','255,255,255','smallinput()',43,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(48,'checkout','local','Register Guests','Automatically create accounts for all guests.','register_guests','0','toggle()',10,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(49,'checkout','local','Order Copy Recipients','Send order copies to the following e-mail addresses. Separate by semi-colons.','email_order_copy','store@email.com','mediumtext()',12,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(50,'checkout','global','Round Amounts','Round currency amounts to prevent hidden decimals.','round_amounts','1','toggle()',13,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(51,'advanced','global','System Cache Enabled','Enables the system cache module which caches frequently used data.','cache_enabled','0','toggle()',10,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(52,'advanced','global','Clear System Cache','Remove all cached system information.','cache_clear','0','toggle()',11,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(53,'advanced','global','Clear Thumbnails Cache','Remove all cached image thumbnails from disk.','cache_clear_thumbnails','0','toggle()',12,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(54,'advanced','global','SEO Links Language Prefix','Precede links with language code e.g. /en/....','seo_links_language_prefix','1','toggle()',13,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(55,'advanced','global','Regional Settings Screen','Enables the regional settings screen upon first visit.','regional_settings_screen_enabled','0','toggle()',14,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(56,'advanced','global','GZIP Enabled','Compresses browser data. Increases the load on the server but decreases the bandwidth.','gzip_enabled','1','toggle()',15,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(57,'advanced','global','Jobs Last Run','Time when background jobs where last executed.','jobs_last_run','2017-10-28 22:47:46','input()',16,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(58,'advanced','local','Jobs Interval','The amount of minutes between each execution of jobs.','jobs_interval','60','int()',17,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(59,'advanced','local','Database Admin Link','The URL to your database manager e.g. phpMyAdmin.','database_admin_link','?app=settings&doc=advanced&action=edit&key=database_admin_link','input()',18,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(60,'advanced','local','Webmail Link','The URL to your webmail client.','webmail_link','?app=settings&doc=advanced&action=edit&key=webmail_link','input()',19,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(61,'advanced','global','SEO Links Enabled','Enabling this requires .htaccess and mod_rewrite rules.','seo_links_enabled','1','toggle()',20,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(62,'security','global','Blacklist','Deny blacklisted clients access to the site.','security_blacklist','0','toggle(\"e/d\")',10,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(63,'security','global','Session Hijacking Protection','Destroy sessions that were signed for a different IP address and user agent.','security_session_hijacking','0','toggle(\"e/d\")',11,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(64,'security','global','HTTP POST Protection','Deny incoming HTTP POST data from external sites by checking for valid form tickets.','security_http_post','0','toggle(\"e/d\")',12,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(65,'security','global','Bad Bot Trap','Catch bad behaving bots from crawling your website by setting up a trap.','security_bot_trap','0','toggle(\"e/d\")',13,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(66,'security','global','Cross-site Scripting (XSS) Detection','Detect common XSS attacks and deny access to the site.','security_xss','1','toggle(\"e/d\")',14,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(67,'security','global','Bad URLs Access Detection','Detect access to commonly attacked URLs.','security_bad_urls','1','toggle(\"e/d\")',15,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(68,'security','local','CAPTCHA','Prevent robots from posting form data by enabling CAPTCHA security.','captcha_enabled','1','toggle()',16,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(69,'','global','Platform Database Version','The platform version of the database','platform_database_version','2.0.2','',0,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(70,'','global','Catalog Template','','store_template_catalog','default.catalog','templates(\"catalog\")',0,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(71,'','global','Catalog Template Settings','','store_template_catalog_settings','{\"product_modal_window\":\"1\",\"sidebar_parallax_effect\":\"1\",\"cookie_acceptance\":\"1\"}','smalltext()',0,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(72,'','global','Admin Template','','store_template_admin','default.admin','templates(\"admin\")',0,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(73,'','global','Jobs Last Push','Time when background jobs where last pushed for execution.','jobs_last_push','2017-10-28 22:47:46','input()',0,'2017-10-28 22:47:46','2017-10-28 22:47:46'),
(74,'','local','Date Cache Cleared','Do not use system cache older than breakpoint.','cache_system_breakpoint','2017-10-28 22:47:46','input()',0,'2017-10-28 22:47:46','2017-10-28 22:47:46');

/*Table structure for table `lc_settings_groups` */

DROP TABLE IF EXISTS `lc_settings_groups`;

CREATE TABLE `lc_settings_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_settings_groups` */

insert  into `lc_settings_groups`(`id`,`key`,`name`,`description`,`priority`) values 
(1,'store_info','Store Info','Store information',10),
(2,'defaults','Defaults','Store default settings',20),
(3,'listings','Listings','Settings for the catalog listing',40),
(4,'images','Images','Settings for graphical elements',50),
(5,'checkout','Checkout','Checkout settings',60),
(6,'advanced','Advanced','Advanced settings',70),
(7,'security','Security','Site security and protection against threats',80);

/*Table structure for table `lc_slides` */

DROP TABLE IF EXISTS `lc_slides`;

CREATE TABLE `lc_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `languages` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `image` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_valid_from` datetime NOT NULL,
  `date_valid_to` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_slides` */

insert  into `lc_slides`(`id`,`status`,`languages`,`name`,`image`,`priority`,`date_valid_from`,`date_valid_to`,`date_updated`,`date_created`) values 
(1,1,'','Flying Cart','slides/1-flying-cart.jpg',1,'0000-00-00 00:00:00','0000-00-00 00:00:00','2017-10-28 22:47:46','2017-10-28 22:47:46');

/*Table structure for table `lc_slides_info` */

DROP TABLE IF EXISTS `lc_slides_info`;

CREATE TABLE `lc_slides_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `caption` text COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slide_info` (`slide_id`,`language_code`),
  KEY `slide_id` (`slide_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_slides_info` */

insert  into `lc_slides_info`(`id`,`slide_id`,`language_code`,`caption`,`link`) values 
(1,1,'en','','');

/*Table structure for table `lc_sold_out_statuses` */

DROP TABLE IF EXISTS `lc_sold_out_statuses`;

CREATE TABLE `lc_sold_out_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderable` tinyint(1) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_sold_out_statuses` */

/*Table structure for table `lc_sold_out_statuses_info` */

DROP TABLE IF EXISTS `lc_sold_out_statuses_info`;

CREATE TABLE `lc_sold_out_statuses_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sold_out_status_id` int(11) NOT NULL,
  `language_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sold_out_status_id` (`sold_out_status_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_sold_out_statuses_info` */

/*Table structure for table `lc_suppliers` */

DROP TABLE IF EXISTS `lc_suppliers`;

CREATE TABLE `lc_suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` text COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `phone` varchar(24) COLLATE utf8_swedish_ci NOT NULL,
  `link` varchar(256) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_suppliers` */

/*Table structure for table `lc_tax_classes` */

DROP TABLE IF EXISTS `lc_tax_classes`;

CREATE TABLE `lc_tax_classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_tax_classes` */

/*Table structure for table `lc_tax_rates` */

DROP TABLE IF EXISTS `lc_tax_rates`;

CREATE TABLE `lc_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `rate` decimal(10,4) NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8_swedish_ci NOT NULL DEFAULT 'percent',
  `address_type` enum('shipping','payment') COLLATE utf8_swedish_ci NOT NULL DEFAULT 'shipping',
  `customer_type` enum('individuals','companies','both') COLLATE utf8_swedish_ci NOT NULL DEFAULT 'both',
  `tax_id_rule` enum('with','without','both') COLLATE utf8_swedish_ci NOT NULL DEFAULT 'both',
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tax_class_id` (`tax_class_id`),
  KEY `geo_zone_id` (`geo_zone_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_tax_rates` */

/*Table structure for table `lc_translations` */

DROP TABLE IF EXISTS `lc_translations`;

CREATE TABLE `lc_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(250) COLLATE utf8_swedish_ci NOT NULL,
  `text_en` text COLLATE utf8_swedish_ci NOT NULL,
  `html` tinyint(1) NOT NULL,
  `pages` text COLLATE utf8_swedish_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_accessed` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_translations` */

insert  into `lc_translations`(`id`,`code`,`text_en`,`html`,`pages`,`date_created`,`date_updated`,`date_accessed`) values 
(1,'title_home','Home',0,'includes/library/lib_breadcrumbs.inc.php','2017-10-29 02:51:05','2017-10-29 02:51:05','2017-10-30 01:56:15'),
(2,'template:title_product_modal_window','Product Modal Window',0,'includes/templates/default.catalog/config.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:56:15'),
(3,'template:description_product_modal_window','Enables or disables the product modal window.',0,'includes/templates/default.catalog/config.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:56:15'),
(4,'template:title_sidebar_parallax_effect','Sidebar Parallax Effect',0,'includes/templates/default.catalog/config.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:56:15'),
(5,'template:description_sidebar_parallax_effect','Enables or disables the sidebar parallax effect.',0,'includes/templates/default.catalog/config.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:56:15'),
(6,'template:title_cookie_acceptance','Cookie Acceptance',0,'includes/templates/default.catalog/config.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:56:15'),
(7,'template:description_cookie_acceptance','Enables or disables the cookie acceptance notice.',0,'includes/templates/default.catalog/config.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:56:15'),
(8,'index:head_title','Online Store',0,'pages/index.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:54:56'),
(9,'index:meta_description','',0,'pages/index.inc.php','2017-10-29 02:51:16','2017-10-29 02:51:16','2017-10-30 01:54:56'),
(10,'text_search_products','Search products',0,'includes/templates/default.catalog/views/column_left.inc.php','2017-10-29 02:51:17','2017-10-29 02:51:17','2017-10-30 01:54:59'),
(11,'title_categories','Categories',0,'includes/templates/default.catalog/views/box_category_tree.inc.php,pages/category.inc.php','2017-10-29 02:51:17','2017-10-29 02:51:17','2017-10-30 01:56:23'),
(12,'title_sign_in','Sign In',0,'includes/templates/default.catalog/views/box_account_login.inc.php,pages/login.inc.php','2017-10-29 02:52:10','2017-10-29 02:52:10','2017-10-29 03:12:17'),
(13,'title_email_address','Email Address',0,'includes/templates/default.catalog/views/box_account_login.inc.php,includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:52:10','2017-10-29 02:52:10','2017-10-29 03:12:17'),
(14,'title_password','Password',0,'includes/templates/default.catalog/views/box_account_login.inc.php,includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:52:10','2017-10-29 02:52:10','2017-10-29 03:12:17'),
(15,'text_new_customers_click_here','New customers click here',0,'includes/templates/default.catalog/views/box_account_login.inc.php','2017-10-29 02:52:10','2017-10-29 02:52:10','2017-10-29 03:12:17'),
(16,'error_login_invalid','Wrong password or the account is disabled, or does not exist',0,'includes/library/lib_customer.inc.php','2017-10-29 02:53:31','2017-10-29 02:53:31','2017-10-29 02:53:31'),
(17,'title_remember_me','Remember Me',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(18,'text_lost_your_password','Lost your password?',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(19,'title_create_an_account','Create an Account',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(20,'description_get_access_to_all_order_history','Get access to all your order history.',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(21,'description_save_your_cart_items','Save your shopping cart for a later visit.',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(22,'description_access_your_cart_simultaneously','Access your shopping cart from different computers. Even simultaneously!',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(23,'description_faster_checkout_with_prefilled_details','Faster checkout with prefilled customer details.',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(24,'description_receive_new_offers','Receive information about new offers and great deals.',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(25,'title_register_now','Register Now',0,'includes/templates/default.catalog/pages/login.inc.php','2017-10-29 02:53:37','2017-10-29 02:53:37','2017-10-29 02:53:37'),
(26,'title_change','Change',0,'includes/templates/default.catalog/views/box_region.inc.php','2017-10-29 02:53:44','2017-10-29 02:53:44','2017-10-29 03:10:26'),
(27,'title_shopping_cart','Shopping Cart',0,'includes/templates/default.catalog/views/box_cart.inc.php','2017-10-29 02:53:45','2017-10-29 02:53:45','2017-10-29 03:10:26'),
(28,'text_items','item(s)',0,'includes/templates/default.catalog/views/box_cart.inc.php','2017-10-29 02:53:45','2017-10-29 02:53:45','2017-10-29 03:10:26'),
(29,'title_name','Name',0,'pages/category.inc.php,pages/search.inc.php','2017-10-29 02:54:53','2017-10-29 02:54:53','2017-10-30 01:56:24'),
(30,'title_price','Price',0,'pages/category.inc.php,pages/search.inc.php','2017-10-29 02:54:53','2017-10-29 02:54:53','2017-10-30 01:56:24'),
(31,'title_popularity','Popularity',0,'pages/category.inc.php,pages/search.inc.php','2017-10-29 02:54:53','2017-10-29 02:54:53','2017-10-30 01:56:24'),
(32,'title_date','Date',0,'pages/category.inc.php,pages/search.inc.php','2017-10-29 02:54:53','2017-10-29 02:54:53','2017-10-30 01:56:24'),
(33,'checkout:head_title','Checkout',0,'pages/checkout.inc.php','2017-10-29 02:55:37','2017-10-29 02:55:37','2017-10-29 02:55:37'),
(34,'title_checkout','Checkout',0,'pages/checkout.inc.php','2017-10-29 02:55:37','2017-10-29 02:55:37','2017-10-29 02:55:37'),
(35,'warning_your_customer_information_unsaved','Your customer information contains unsaved changes.',0,'includes/templates/default.catalog/pages/checkout.inc.php','2017-10-29 02:55:37','2017-10-29 02:55:37','2017-10-29 02:55:38'),
(36,'text_please_wait','Please wait',0,'includes/templates/default.catalog/pages/checkout.inc.php','2017-10-29 02:55:38','2017-10-29 02:55:38','2017-10-29 02:55:38'),
(37,'title_customer_service','Customer Service',0,'includes/templates/default.catalog/layouts/checkout.inc.php,includes/routes/url_customer_service.inc.php','2017-10-29 02:55:47','2017-10-29 02:55:47','2017-10-29 02:58:17'),
(38,'title_page_parse_time','Page Parse Time',0,'includes/library/lib_stats.inc.php','2017-10-29 02:55:48','2017-10-29 02:55:48','2017-10-29 02:55:48'),
(39,'title_page_capture_time','Page Capture Time',0,'includes/library/lib_stats.inc.php','2017-10-29 02:55:48','2017-10-29 02:55:48','2017-10-29 02:55:48'),
(40,'title_included_files','Included Files',0,'includes/library/lib_stats.inc.php','2017-10-29 02:55:48','2017-10-29 02:55:48','2017-10-29 02:55:48'),
(41,'title_memory_peak','Memory Peak',0,'includes/library/lib_stats.inc.php','2017-10-29 02:55:48','2017-10-29 02:55:48','2017-10-29 02:55:48'),
(42,'title_memory_limit','Memory Limit',0,'includes/library/lib_stats.inc.php','2017-10-29 02:55:48','2017-10-29 02:55:48','2017-10-29 02:55:48'),
(43,'title_database_queries','Database Queries',0,'includes/library/lib_stats.inc.php','2017-10-29 02:55:48','2017-10-29 02:55:48','2017-10-29 02:55:48'),
(44,'title_database_parse_time','Database Parse Time',0,'includes/library/lib_stats.inc.php','2017-10-29 02:55:48','2017-10-29 02:55:48','2017-10-29 02:55:48'),
(45,'title_create_account','Create Account',0,'pages/create_account.inc.php','2017-10-29 02:58:17','2017-10-29 02:58:17','2017-10-29 03:12:08'),
(46,'title_contact_us','Contact Us',0,'includes/boxes/box_customer_service_links.inc.php','2017-10-29 02:58:17','2017-10-29 02:58:17','2017-10-29 03:12:08'),
(47,'title_tax_id','Tax ID',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(48,'title_company','Company',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(49,'title_firstname','Firstname',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(50,'title_lastname','Lastname',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(51,'title_address1','Address 1',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(52,'title_address2','Address 2',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(53,'title_postcode','Postcode',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(54,'title_city','City',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(55,'title_country','Country',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(56,'title_select','Select',0,'includes/functions/func_form.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(57,'title_zone_state_province','Zone/State/Province',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(58,'title_email','Email',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(59,'title_phone','Phone',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(60,'title_desired_password','Desired Password',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(61,'title_confirm_password','Confirm Password',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(62,'title_newsletter','Newsletter',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(63,'title_subscribe','Subscribe',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(64,'title_captcha','CAPTCHA',0,'includes/templates/default.catalog/pages/create_account.inc.php','2017-10-29 02:58:26','2017-10-29 02:58:26','2017-10-29 03:12:17'),
(65,'title_search_results_for_s','Search Results for &quot;%s&quot;',0,'pages/search.inc.php','2017-10-29 02:58:52','2017-10-29 02:58:52','2017-10-29 02:58:52'),
(66,'title_search_results','Search Results',0,'pages/search.inc.php','2017-10-29 02:58:52','2017-10-29 02:58:52','2017-10-29 02:58:52'),
(67,'title_relevance','Relevance',0,'pages/search.inc.php','2017-10-29 02:58:52','2017-10-29 02:58:52','2017-10-29 02:58:52');

/*Table structure for table `lc_users` */

DROP TABLE IF EXISTS `lc_users`;

CREATE TABLE `lc_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `username` varchar(32) COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_swedish_ci NOT NULL,
  `permissions` varchar(4096) COLLATE utf8_swedish_ci NOT NULL,
  `last_ip` varchar(15) COLLATE utf8_swedish_ci NOT NULL,
  `last_host` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `login_attempts` int(11) NOT NULL,
  `total_logins` int(11) NOT NULL,
  `date_blocked` datetime NOT NULL,
  `date_expires` datetime NOT NULL,
  `date_active` datetime NOT NULL,
  `date_login` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_users` */

insert  into `lc_users`(`id`,`status`,`username`,`password`,`permissions`,`last_ip`,`last_host`,`login_attempts`,`total_logins`,`date_blocked`,`date_expires`,`date_active`,`date_login`,`date_created`,`date_updated`) values 
(1,1,'admin','3ad8256a7c9df74eb870365766b2f89bcf708bd9f3d41499ae607ce03b0df830','','','',0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2017-10-29 02:47:53','2017-10-29 02:47:53');

/*Table structure for table `lc_zones` */

DROP TABLE IF EXISTS `lc_zones`;

CREATE TABLE `lc_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_code` varchar(4) COLLATE utf8_swedish_ci NOT NULL,
  `code` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `name` varchar(64) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_code` (`country_code`),
  KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_zones` */

insert  into `lc_zones`(`id`,`country_code`,`code`,`name`,`date_updated`,`date_created`) values 
(1,'CA','AB','Alberta','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,'CA','BC','British Columbia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,'CA','MB','Manitoba','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,'CA','NB','New Brunswick','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,'CA','NL','Newfoundland and Labrador','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,'CA','NT','Northwest Territories','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,'CA','NS','Nova Scotia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,'CA','NU','Nunavut','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,'CA','ON','Ontario','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,'CA','PE','Prince Edward Island','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,'CA','QC','Québec','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,'CA','SK','Saskatchewan','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,'CA','YT','Yukon Territory','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,'US','AL','Alabama','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,'US','AK','Alaska','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,'US','AZ','Arizona','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,'US','AR','Arkansas','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,'US','CA','California','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,'US','CO','Colorado','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,'US','CT','Connecticut','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,'US','DE','Delaware','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,'US','FL','Florida','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,'US','GA','Georgia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,'US','HI','Hawaii','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,'US','ID','Idaho','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,'US','IL','Illinois','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,'US','IN','Indiana','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,'US','IA','Iowa','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,'US','KS','Kansas','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,'US','KY','Kentucky','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,'US','LA','Louisiana','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,'US','ME','Maine','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,'US','MD','Maryland','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,'US','MA','Massachusetts','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,'US','MI','Michigan','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,'US','MN','Minnesota','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,'US','MS','Mississippi','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,'US','MO','Missouri','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,'US','MT','Montana','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,'US','NE','Nebraska','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,'US','NV','Nevada','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,'US','NH','New Hampshire','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,'US','NJ','New Jersey','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,'US','NM','New Mexico','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,'US','NY','New York','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,'US','NC','North Carolina','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,'US','ND','North Dakota','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,'US','OH','Ohio','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,'US','OK','Oklahoma','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,'US','OR','Oregon','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,'US','PA','Pennsylvania','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,'US','RI','Rhode Island','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,'US','SC','South Carolina','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,'US','SD','South Dakota','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,'US','TN','Tennessee','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,'US','TX','Texas','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,'US','UT','Utah','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,'US','VT','Vermont','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,'US','VA','Virginia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,'US','WA','Washington','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,'US','WV','West Virginia','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,'US','WI','Wisconsin','0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,'US','WY','Wyoming','0000-00-00 00:00:00','0000-00-00 00:00:00');

/*Table structure for table `lc_zones_to_geo_zones` */

DROP TABLE IF EXISTS `lc_zones_to_geo_zones`;

CREATE TABLE `lc_zones_to_geo_zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL,
  `country_code` varchar(2) COLLATE utf8_swedish_ci NOT NULL,
  `zone_code` varchar(8) COLLATE utf8_swedish_ci NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_zone_id` (`geo_zone_id`),
  KEY `country_code` (`country_code`),
  KEY `zone_code` (`zone_code`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

/*Data for the table `lc_zones_to_geo_zones` */

insert  into `lc_zones_to_geo_zones`(`id`,`geo_zone_id`,`country_code`,`zone_code`,`date_updated`,`date_created`) values 
(1,1,'CA','AB','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(2,1,'CA','BC','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(3,1,'CA','ON','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(4,1,'CA','QC','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(5,1,'CA','NS','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(6,1,'CA','NB','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(7,1,'CA','MB','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(8,1,'CA','PE','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(9,1,'CA','SK','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(10,1,'CA','NL','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(11,2,'US','AL','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(12,2,'US','AK','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(13,2,'US','AZ','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(14,2,'US','AR','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(15,2,'US','CA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(16,2,'US','CO','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(17,2,'US','CT','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(18,2,'US','DE','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(19,2,'US','FL','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(20,2,'US','GA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(21,2,'US','HI','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(22,2,'US','ID','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(23,2,'US','IL','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(24,2,'US','IN','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(25,2,'US','IA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(26,2,'US','KS','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(27,2,'US','KY','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(28,2,'US','LA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(29,2,'US','ME','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(30,2,'US','MD','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(31,2,'US','MA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(32,2,'US','MI','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(33,2,'US','MN','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(34,2,'US','MS','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(35,2,'US','MO','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(36,2,'US','MT','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(37,2,'US','NE','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(38,2,'US','NV','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(39,2,'US','NH','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(40,2,'US','NJ','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(41,2,'US','NM','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(42,2,'US','NY','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(43,2,'US','NC','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(44,2,'US','ND','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(45,2,'US','OH','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(46,2,'US','OK','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(47,2,'US','OR','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(48,2,'US','PA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(49,2,'US','RI','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(50,2,'US','SC','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(51,2,'US','SD','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(52,2,'US','TN','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(53,2,'US','TX','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(54,2,'US','UT','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(55,2,'US','VT','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(56,2,'US','VA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(57,2,'US','WA','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(58,2,'US','WV','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(59,2,'US','WI','2017-10-28 22:47:53','2017-10-28 22:47:53'),
(60,2,'US','WY','2017-10-28 22:47:53','2017-10-28 22:47:53');

/*Table structure for table `orderdet` */

DROP TABLE IF EXISTS `orderdet`;

CREATE TABLE `orderdet` (
  `o_ordernum` int(6) NOT NULL,
  `o_qty` int(3) NOT NULL,
  `o_prodnum` char(5) NOT NULL,
  KEY `o_ordernum` (`o_ordernum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orderdet` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `p_prodnum` char(5) NOT NULL,
  `p_name` varchar(20) NOT NULL,
  `p_desc` text NOT NULL,
  `p_price` decimal(6,2) NOT NULL,
  `p_dateadded` date NOT NULL,
  PRIMARY KEY (`p_prodnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `products` */

insert  into `products`(`p_prodnum`,`p_name`,`p_desc`,`p_price`,`p_dateadded`) values 
('','apple','apples fruit',2.00,'0000-00-00'),
('00001','CBA Logo T-shirt','This T-shirt will show off your CBA connection. \n         Our t-shirts are high quality and 100% preshrunk cotton.',17.95,'2004-08-01'),
('00002','CBA Bumper Sticker','Let the world know you are a proud supporter of the \n         CBA Web site with this colorful bumper sticker.',5.95,'2004-08-01'),
('00003','CBA Coffee Mug','With the CBA logo looking back at you over your \n         morning cup of coffee, you\'re sure to have a great\n         start to your day. Our mugs are microwave and dishwasher\n         safe.',8.95,'2004-08-01'),
('00004','Superhero Body Suit','We have a complete selection of colors and sizes for you\n         to choose from. This body suit is sleek, stylish, and \n         won\'t hinder your crime-fighting or evil scheming abilities.\n         We also offer your choice in monogrammed letter applique.',99.95,'2004-08-01'),
('00005','Small Grappling Hook','This specialized hook will get you out of the tightest\n         places. Specially designed for portability and stealth, \n         please be aware that this hook does come with \n         a weight limit.',139.95,'2004-08-01'),
('00006','Large Grappling Hook','For all your heavy-duty building-to-building swinging needs,\n         this large version of our grappling hook will safely transport\n         you throughout the city. Please be advised however that at \n         50 pounds, this is hardly the hook to use if you\'re a \n         lightweight.',199.95,'2004-08-01');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
