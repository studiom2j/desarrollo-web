<?php
//connect to the database - either include a connection variable file or
//type the following lines:
$connect = mysql_connect("localhost", "root", "") or
  die ("Hey loser, check your server connection.");

//Create the ecommerce database
if (mysql_query("CREATE DATABASE ecommerce")) {
  echo "Woo hoo! Database created! <br>";
} else {
  echo "Sorry, try creating the database again.";
}
mysql_select_db("ecommerce");

//Define the product table
$query = "CREATE TABLE products (
          products_prodnum CHAR(5) NOT NULL,
          products_name VARCHAR(20) NOT NULL,
          products_proddesc TEXT NOT NULL,
          products_price DEC (6,2) NOT NULL,
          products_dateadded DATE NOT NULL,
          PRIMARY KEY(products_prodnum))";

$product = mysql_query($query)
  or die(mysql_error());

//Define the customer table
$query2 = "CREATE TABLE customers (
           customers_custnum INT(6) NOT NULL AUTO_INCREMENT,
           customers_firstname VARCHAR (15) NOT NULL,
           customers_lastname VARCHAR (50) NOT NULL,
           customers_add1 VARCHAR (50) NOT NULL,
           customers_add2 VARCHAR (50),
           customers_city VARCHAR (50) NOT NULL,
           customers_state CHAR (2) NOT NULL,
           customers_zip CHAR (5) NOT NULL,
           customers_phone CHAR (12) NOT NULL,
           customers_fax CHAR (12),
           customers_email VARCHAR (50) NOT NULL,
           PRIMARY KEY (customers_custnum))";

$customers = mysql_query($query2)
  or die(mysql_error());

//Define the general order table
$query3 = "CREATE TABLE ordermain (
           ordermain_ordernum INT(6) NOT NULL AUTO_INCREMENT,
           ordermain_orderdate DATE NOT NULL,
           ordermain_custnum INT(6) NOT NULL,
           ordermain_subtotal DEC (7,2) NOT NULL,
           ordermain_shipping DEC (6,2),
           ordermain_tax DEC(6,2),
           ordermain_total DEC(7,2) NOT NULL,
           ordermain_shipfirst VARCHAR(15) NOT NULL,
           ordermain_shiplast VARCHAR(50) NOT NULL,
           ordermain_shipcompany VARCHAR (50),
           ordermain_shipadd1 VARCHAR (50) NOT NULL,
           ordermain_shipadd2 VARCHAR(50),
           ordermain_shipcity VARCHAR(50) NOT NULL,
           ordermain_shipstate CHAR(2) NOT NULL,
           ordermain_shipzip CHAR(5) NOT NULL,
           ordermain_shipphone CHAR(12) NOT NULL,
           ordermain_shipemail VARCHAR(50),
           PRIMARY KEY(ordermain_ordernum)) ";

$ordermain = mysql_query($query3)
  or die(mysql_error());

//Define the order details table
$query4 = "CREATE TABLE orderdet (
           orderdet_ordernum INT (6) NOT NULL,
           orderdet_qty INT(3) NOT NULL,
           orderdet_prodnum CHAR(5) NOT NULL,
           KEY(orderdet_ordernum))";

$orderdet = mysql_query($query4)
  or die(mysql_error());

echo "Tables created successfully.";
?>
