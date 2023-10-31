<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Customer</title>
<%@ include file="./components/common_cs_js.jsp"%>
</head>
<body style="background-color: #83c5be;">
<%@ include file="./components/navbar.jsp"%>

<div class="container-fluid">
  <div class="row mt-2">
       <div class="col-md-4 offset-md-4 admin" >
            <div class="card">
                <%@ include file="components/message.jsp"%>
                <div class="card-body px-5">
                    <img src="resources/images/registerphoto.jpeg" class="rounded mx-auto d-block" alt="img" height="90px" width="90px">
                    <h3 class="text-center my-3">Update Customer..!!</h3>
            <form action="updateuser" method="post">
            <input type="hidden" name="date" value="<%=java.time.LocalDate.now().toString()%>"/>
                 
                 
                  <div class="form-group">
                     <label for="email">Customer Id</label>
                     <input type="number" class="form-control" id="username" aria-describedby="emailHelp" name="id" placeholder="Enter Customer Id.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="email">Mobile No.</label>
                     <input type="number" class="form-control" id="username" aria-describedby="emailHelp" name="phoneNumber" placeholder="Enter phone number.." required>
                 </div>
                 
                  <div class="form-group">
                     <label for="email">Email Id</label>
                     <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="emailId" placeholder="Enter email id.." required>
                 </div>
           
                <div class="form-group">
                     <label for="phone">Present Address</label>
                     <textarea style="height:90px" class="form-control" placeholder="Enter Present Address" name="presentAddress" required></textarea>
                 </div>
        
                <div class="container text-center">
                      <button class="btn custom-bg text-color"><b>Update Customer</b></button>
                </div>
                 
            </form>
                </div>
            </div>
           
            
       </div>
  </div>
</div>
</body>
</html>