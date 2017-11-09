<?php
session_start();
//connect to the database - either include a connection variable file 
//or type the following lines:
$connect = mysql_connect("localhost", "root", "") 
  or die("Hey loser, check your server connection.");
//make our database active
mysql_select_db("ecommerce");

//get our variable passed through the URL
$prodid = $_REQUEST['prodnum'];

//get information on the specific product we want
$query = "SELECT * FROM products WHERE p_prodnum='$prodid'";
$results = mysql_query($query)
  or die(mysql_error());
$row = mysql_fetch_array($results);
extract($row);
?>
<html>
<head>
<title><?php echo $p_name; ?></title>
</head>
<body>
<div align="center">
<table cellpadding="5" width="80%">
  <tr>
    <td>PRODUCT IMAGES</td>
    <td><strong><?php echo $p_images; ?></strong><br>
      <?php echo $p_images; ?><br \>
      <br>Product Number: <?php echo $p_prodnum; ?>
      <br>Price: $<?php echo $p_price; ?><br>
      <form method="POST" action="modcart.php?action=add">
        Quantity: <input type="text" name="qty" size="2"><br>
        <input type="hidden" name="p_prodnum" 
          value="<?php echo $p_prodnum ?>">
        <input type="submit" name="Submit" value="Add to cart">
      </form>

      <form method="POST" action="cart.php">
        <input type="submit" name="Submit" value="View cart">
      </form>
    </td>
  </tr>
</table>
<hr width="200">
<p><a href="index.php">Go back to the main page</a></p>
</div>
</body>
</html>
