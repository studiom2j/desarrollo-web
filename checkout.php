<?php
session_start();
?>
<html>
<head>
<title>Step 1 of 3 - Billing and Shipping Information</title>
</head>
<body>
<strong>Order Checkout</strong><br>
<strong>Step 1 - Please Enter Billing and Shipping 
  Information</strong><br>
Step 2 - Please Verify Accuracy of Order Information and Send Order<br>
Step 3 - Order Confirmation and Receipt<br>

<form method="post" action="checkout2.php">

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
      <input type="text" name="firstname" maxlength="15">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Last Name</div>
    </td>
    <td width="50%">
      <input type="text" name="lastname" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address</div>
    </td>
    <td width="50%">
      <input type="text" name="add1" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address 2</div>
    </td>
    <td width="50%">
      <input type="text" name="add2" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">City</div>
    </td>
    <td width="50%">
      <input type="text" name="city" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">State</div>
    </td>
    <td width="50%">
      <input type="text" name="state" size="2" maxlength="2">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Zip</div>
    </td>
    <td width="50%">
      <input type="text" name="zip" maxlength="5" size="5">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Phone Number</div>
    </td>
    <td width="50%">
      <input type="text" name="phone" size="12" maxlength="12">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Fax Number</div>
    </td>
    <td width="50%">
      <input type="text" name="fax" maxlength="12" size="12">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">E-Mail Address</div>
    </td>
    <td width="50%">
      <input type="text" name="email" maxlength="50">
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
      <input type="checkbox" name="same">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">First Name</div>
    </td>
    <td width="50%">
      <input type="text" name="shipfirst" maxlength="15">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Last Name</div>
    </td>
    <td width="50%">
      <input type="text" name="shiplast" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address</div>
    </td>
    <td width="50%">
      <input type="text" name="shipadd1" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Billing Address 2</div>
    </td>
    <td width="50%">
      <input type="text" name="shipadd2" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">City</div>
    </td>
    <td width="50%">
      <input type="text" name="shipcity" maxlength="50">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">State</div>
    </td>
    <td width="50%">
      <input type="text" name="shipstate" size="2" maxlength="2">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Zip</div>
    </td>
    <td width="50%">
      <input type="text" name="shipzip" maxlength="5" size="5">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">Phone Number</div>
    </td>
    <td width="50%">
      <input type="text" name="shipphone" size="12" maxlength="12">
    </td>
  </tr>
  <tr>
    <td width="50%">
      <div align="right">E-Mail Address</div>
    </td>
    <td width="50%">
      <input type="text" name="shipemail" maxlength="50">
    </td>
  </tr>
</table>
<p>
  <input type="submit" name="Submit" 
    value="Proceed to Next Step --&gt;">
</p>
</form>

 </body>
 </html>
