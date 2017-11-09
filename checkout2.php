<?php
session_start();
//connect to the database
$connect = mysql_connect("localhost", "root", "") 
  or die ("Hey loser, check your server connection.");
mysql_select_db("ecommerce");
if ($_POST['same'] == 'on') {
  $_POST['shipfirst'] = $_POST['firstname'];
  $_POST['shiplast'] = $_POST['lastname'];
  $_POST['shipadd1'] = $_POST['add1'];
  $_POST['shipadd2'] = $_POST['add2'];
  $_POST['shipcity'] = $_POST['city'];
  $_POST['shipstate'] = $_POST['state'];
  $_POST['shipzip'] = $_POST['zip'];
  $_POST['shipphone'] = $_POST['phone'];
  $_POST['shipemail'] = $_POST['email'];
}
?>
<html>
<head>
<title>Step 2 of 3 - Verify Order Accuracy</title>
</head>
<body>
Step 1 - Please Enter Billing and Shipping Information<br>
<strong>Step 2 - Please Verify Accuracy and Make Any Necessary
     Changes</strong><br>
Step 3 - Order Confirmation and Receipt<br>

<form method="post" action="checkout3.php">
<table width="300" border="1" align="left">
  <tr>
    <td colspan="2" bgcolor="#0000FF">
      <div align="center"><strong>Billing Information</strong></div>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">First Name</div>
    </td>
    <td width="50%">
      <input type="text" name="firstname" maxlength="15"
        value="<?php echo $_POST['firstname']; ?> ">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Last Name</div>
    </td>
    <td width="50%">
      <input type="text" name="lastname" maxlength="50"
        value="<?php echo $_POST['lastname']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address</div>
    </td>
    <td width="50%">
      <input type="text" name="add1" maxlength="50"
        value="<?php echo $_POST['add1']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address 2</div>
    </td>
    <td width="50%">
      <input type="text" name="add2" maxlength="50"
        value="<?php echo $_POST['add2']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">City</div>
    </td>
    <td width="50%">
      <input type="text" name="city" maxlength="50"
        value="<?php echo $_POST['city']; ?> ">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">State</div>
    </td>
    <td width="50%">
      <input type="text" name="state" size="2" maxlength="2"
        value="<?php echo $_POST['state']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Zip</div>
    </td>
    <td width="50%">
      <input type="text" name="zip" maxlength="5" size="5"
        value="<?php echo $_POST['zip']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Phone Number</div>
    </td>
    <td width="50%">
      <input type="text" name="phone" size="12" maxlength="12"
        value="<?php echo $_POST['phone']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Fax Number</div>
    </td>
    <td width="50%">
      <input type="text" name="fax" maxlength="12" size="12"
        value="<?php echo $_POST['fax']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">E-Mail Address</div>
    </td>
    <td width="50%">
      <input type="text" name="email" maxlength="50"
        value="<?php echo $_POST['email']; ?>">
    </td>
  </tr>
</table>
<table width="300" border="1">
  <tr bgcolor="#990000">
    <td colspan="2">
      <div align="center"><strong>Shipping Information</strong></div>
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Shipping Info same as Billing</div>
    </td>
    <td width="50%">
      <input type="checkbox" name="same"></td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">First Name</div>
    </td>
    <td width="50%">
      <input type="text" name="shipfirst" maxlength="15"
        value="<?php echo $_POST['shipfirst']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Last Name</div>
    </td>
    <td width="50%">
      <input type="text" name="shiplast" maxlength="50"
        value="<?php echo $_POST['shiplast']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address</div>
    </td>
    <td width="50%">
      <input type="text" name="shipadd1" maxlength="50"
        value="<?php echo $_POST['shipadd1']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address 2</div>
    </td>
    <td width="50%">
      <input type="text" name="shipadd2" maxlength="50"
        value="<?php echo $_POST['shipadd2']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">City</div>
    </td>
    <td width="50%">
      <input type="text" name="shipcity" maxlength="50"
         value="<?php echo $_POST['shipcity']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">State</div>
    </td>
    <td width="50%">
      <input type="text" name="shipstate" size="2" maxlength="2"
        value="<?php echo $_POST['shipstate']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Zip</div>
    </td>
    <td width="50%">
      <input type="text" name="shipzip" maxlength="5" size="5"
        value="<?php echo $_POST['shipzip']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Phone Number</div>
    </td>
    <td width="50%">
      <input type="text" name="shipphone" size="12" maxlength="12"
        value="<?php echo $_POST['shipphone']; ?>">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">E-Mail Address</div>
    </td>
    <td width="50%">
      <input type="text" name="shipemail" maxlength="50"
        value="<?php echo $_POST['shipemail']; ?>">
    </td>
  </tr>
</table>

<hr>
<table border="1" align="left" cellpadding="5">
  <tr>
    <td>Quantity</td>
    <td>Item Image</td>
    <td>Item Name</td>
    <td>Price Each</td>
    <td>Extended Price</td>
    <td></td>
    <td></td>
  </tr>
<?php

$sessid = session_id();

$query = "SELECT * FROM carttemp WHERE carttemp_sess = '$sessid'";
$results = mysql_query($query)
  or die (mysql_query());

$total = 0;
while ($row = mysql_fetch_array($results)) {
  extract($row);
  $prod = "SELECT * FROM products WHERE
           p_prodnum = '$carttemp_prodnum'";
  $prod2 = mysql_query($prod);
  $prod3 = mysql_fetch_array($prod2);
  extract($prod3);
  echo "<tr><td>";
  echo $carttemp_quan;
  echo "</td>";
  echo "<td>";
  echo "<a href=\"getprod.php?prodid=" .
        $p_prodnum . "\">";
  echo "THUMBNAIL<br>IMAGE</td></a>";
  echo "<td>";
  echo "<a href=\"getprod.php?prodid=" .
        $p_prodnum . "\">";
  echo $p_name;
  echo "</td></a>";
  echo "<td align=\"right\">";
  echo $p_price;
  echo "</td>";
  echo "<td align=\"right\">";
  //get extended price
  $extprice = number_format($p_price * $carttemp_quan, 2);
  echo $extprice;
  echo "</td>";
  echo "<td>";
  echo "<a href=\"cart.php\">Make Changes to Cart</a>";
  echo "</td>";
  echo "</tr>";
  //add extended price to total
  $total = $extprice + $total;

}
?>
<tr>
<td colspan="4" align="right">Your total before shipping is:</td>
<td align="right"> <?php echo number_format($total, 2); ?></td>
<td></td>
<td></td>
</tr>
</table>
<input type="hidden" name="total" value="<?php echo $total; ?>">
<p>
  <input type="submit" name="Submit" value="Send Order --&gt;">
</p>
</form>

</body>
</html>
