<?php
if (!session_id()) {
  session_start();
}//connect to the database
$connect = mysql_connect("localhost", "root", "") 
  or die ("Hey loser, check your server connection.");
mysql_select_db("ecommerce");
?>
<html>
<head>
<title>Here is Your Shopping Cart!</title>
</head>
<body>
<div align="center">
You currently have

<?php
$sessid = session_id();

//display number of products in cart
$query = "SELECT * FROM carttemp WHERE carttemp_sess = '$sessid'";
$results = mysql_query($query)
  or die (mysql_query());
$rows = mysql_num_rows($results);
echo $rows;
?>

product(s) in your cart.<br>

<table border="1" align="center" cellpadding="5">
  <tr>
    <td>Quantity</td>
    <td>Item Name</td>
    <td>Price Each</td>
    <td>Extended Price</td>
    <td></td>
    <td></td>
<?php
$total = 0;
while ($row = mysql_fetch_array($results)) {
  echo "<tr>";
  extract($row);
  $prod = "SELECT * FROM products " .
          "WHERE p_prodnum='$carttemp_prodnum'";
  $prod2 = mysql_query($prod);
  $prod3 = mysql_fetch_array($prod2);
  extract($prod3);
  echo "<td>
          <form method=\"POST\" action=\"modcart.php?action=change\">
            <input type=\"hidden\" name=\"modified_hidden\"
              value=\"$carttemp_hidden\">
            <input type=\"text\" name=\"modified_quan\" size=\"2\"
              value=\"$carttemp_quan\">";
  echo "</td>";
  echo "<td>";
  echo "<a href=\"getprod.php?prodid=" . $p_prodnum . "\">";
  echo "THUMBNAIL<br>IMAGE</a></td>";
  echo "<td>";
  echo "<a href=\"getprod.php?prodid=" . $p_prodnum . "\">";
  echo $p_name;
  echo "</a></td>";
  echo "<td align=\"right\">";
  echo $p_price;
  echo "</td>";
  echo "<td align=\"right\">";
  //get extended price
  $extprice = number_format($p_price * $carttemp_quan, 2);
  echo $extprice;
  echo "</td>";
  echo "<td>";
  echo "<input type=\"submit\" name=\"Submit\"
          value=\"Change Qty\">
        </form></td>";
  echo "<td>";
  echo "<form method=\"POST\" action=\"modcart.php?action=delete\">
        <input type=\"hidden\" name=\"modified_hidden\"
          value=\"$carttemp_hidden\">";
  echo "<input type=\"submit\" name=\"Submit\"
          value=\"Delete Item\">
        </form></td>";
  echo "</tr>";
  //add extended price to total
  $total = $extprice + $total;

}
?>
  <tr>
    <td colspan=\"4\" align=\"right\">
      Your total before shipping is:</td>
    <td align=\"right\"> <?php echo number_format($total, 2); ?></td>
    <td></td>
    <td>
<?php
echo "<form method=\"POST\" action=\"modcart.php?action=empty\">
        <input type=\"hidden\" name=\"carttemp_hidden\"
          value=\"";
if (isset($carttemp_hidden)) {
  echo $carttemp_hidden;
}
echo "\">";
echo "<input type=\"submit\" name=\"Submit\" value=\"Empty Cart\">
      </form>";
?>

</td>
</tr>
</table>
<form method="POST" action="checkout.php">
<input type="submit" name="Submit" value="Proceed to Checkout">
</form>
<a href="cbashop.php">Go back to the main page</a>
</div>
</body>
</html>
