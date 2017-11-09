<?php
//connect to the database - either include a connection variable file 
//or type the following lines:
$connect = mysql_connect("localhost", "root", "") 
  or die ("Hey loser, check your server connection.");

mysql_select_db("ecommerce");

$query = "INSERT INTO products VALUES (
         00001, 'apples','vegetables are food',2.50,31-10-2017,
         00002, 'water','drink essential liquid',1.5,31-10-2017,
		 00003, 'beer', 'enjoy a moment',3.75,31-10-2017,
         00004, 'cheese', 'food for soul',4.75,31-10-2017)";
$result = mysql_query($query)
  or die(mysql_error());
echo "Products added successfully!";

?>
