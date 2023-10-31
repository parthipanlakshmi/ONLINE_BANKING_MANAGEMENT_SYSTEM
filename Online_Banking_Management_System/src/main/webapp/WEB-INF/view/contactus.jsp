<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
 <style>
 .container-1{
  height: 95vh;      
  width: 100%;
  position: relative;
  background: linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),url(resources/images/background.jpeg);
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  align-items: center;
 }
 
 .container-2{
 position: absolute;
 top: 50% ;
 left: 50%;
 transform: translate( -50% , -50%)
 }
 
 p{
  font-family: 'Poppins', sans-serif;
 font-weight: 700;
 letter-spacing: 1	px;
 color: #ffffff;
 }
 b{
 color: #ffffff;}
 
 </style>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
<%@ include file="components/common_cs_js.jsp"%>
</head>
<body>
<div class="container-1">
<a href="/" style= "color:white">Return</a>
<div class="container-2" >
<p class="d-flex justify-content-center align-items-center">
<b>Address: </b><p>280,ambattur,chennai-600053</p>
<b>Email: </b><p>actssupport@cdac.in</p>
<b>Phone:</b><p>+91-20-2570-4100, Fax: +91-20-2569 4004</p>
</div>


</div>

</body>
</html>