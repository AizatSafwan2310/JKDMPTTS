<%-- 
    Document   : receipt
    Created on : 4 Jul 2023, 12:19:17 pm
    Author     : vivo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <style>
   body {
      font-family: Arial, sans-serif;
      background-color:blanchedalmond;
      color: #141414;
    }
    
    .container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      text-align: center;
    }
    
    .receipt {
      width: 400px;
      padding: 20px;
      background-color: #ffffff;
      border: 1px solid #dddddd;
      border-radius: 5px;
    }
    
    .receipt h2 {
      margin-top: 0;
    }
    
    .receipt label {
      display: block;
      margin-bottom: 10px;
      font-weight: bold;
    }
    
    .receipt input {
      width: 100%;
      padding: 5px;
      margin-bottom: 15px;
      border: 1px solid #dddddd;
      border-radius: 3px;
    }
    
    .receipt button {
      padding: 10px 20px;
      background-color: #4caf50;
      color: #ffffff;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .go-back {
      margin-top: 20px;
    }
    </style>
    <title>Receipt Page</title>
</head>
<body>
  <div class="container">
    <div class="receipt">
      <h2>Receipt</h2>
      <form>
          <label for="customerName">Name:<br></br></label>
        
        
          <label for="customerPhoneNumber">Phone Number: <br></br></label>
        
        
          <label for="customerEmail">Email Address:<br> </br></label>
        
        
          <label for="customerAddress">Address:<br></br></label>
          
          <label for="package">Package:</label>
          
          <label for="amount">Total Price:</label>
        
      </form>
    </div>
    <div class="go-back">
  <a href="homepage.jsp">Go Back to Homepage</a>
</div>
  </div>
</body>
</html>

