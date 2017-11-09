<?php
//connect to the database - either include a connection variable file or
//type the following lines:
$connect = mysql_connect("localhost", "root", "") or 
  die ("Hey loser, check your server connection.");
mysql_select_db("ecommerce");
$query = "SELECT * FROM products";
$results = mysql_query($query)
  or die(mysql_error());

?>
<html>
<head>
<title>Product List</title>
</head>
<body>
<table>
  <tr>
    <td width="10%">Product Number</td>
    <td width="20%">Name</td>
    <td width="50%">Description</td>
    <td width="10%">Price</td>
    <td width="10%">Date Added</td>
  </tr>
<?php
while ($row = mysql_fetch_array($results)) {
  extract($row);
  echo "<tr><td width=\"10%\">";
  echo $p_prodnum;
  echo "</td><td width=\"20%\">";
  echo $p_name;
  echo "</td><td width=\"50%\">";
  echo $p_desc;
  echo "</td><td width=\"10%\">";
  echo $p_price;
  echo "</td><td width=\"10%\">";
  echo $p_dateadded;
  echo "</td></tr>";
}
?>
</table>
</body>
</html>
