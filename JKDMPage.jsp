<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Homepage</title>
  
  <div class="header">
    <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
    <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap">
  </div> 

<style>
   body {
  font-family: Arial, sans-serif;
  background: url('https://i.pinimg.com/736x/e8/bb/c3/e8bbc31257dc0aa88f2b6a8c55daa1a9.jpg') center center fixed;
  background-size: cover;
  margin: 0;
  overflow-x: hidden;
  position: relative;
}

/* Pseudo-element for the overlay */
body::before {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5); /* Adjust the rgba value to change darkness and transparency */
  z-index: -1; /* Ensures the overlay is behind the content */
}


    .header {
      background-color: #808080;
      color: #3a1f04;
      padding: 10px;
      text-align: center;
    }

    .header img {
      width: 30px;
      vertical-align: middle;
    }

    .header h1 {
  display: inline-block;
  margin: 0;
  padding-left: 10px;
  vertical-align: middle;
  font-family: 'Gugi', sans-serif; /* Use Gugi font */
  font-weight: normal; /* Make the text unbold */
}

    .sidebar {
      width: 0; /* Initially hidden */
      background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent black */
      padding-top: 20px;
      float: left;
      height: calc(100vh - 60px); /* Adjusting for header height */
      overflow: hidden; /* Hide overflowing content */
      transition: width 0.5s; /* Add transition effect */
    }

    .sidebar .nav-button {
      display: block;
      margin: 10px auto;
      width: 80%;
      padding: 10px 20px;
      background-color: rgba(128, 128, 128, 0.5); /* Grey with transparency */
      border: none;
      border-radius: 5px;
      color: white; /* Change text color to white */
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s, color 0.3s;
      text-align: center;
    }

    .sidebar .nav-button:hover {
      background-color: #ccc;
      color: #000;
    }
    .hamburger {
      position: fixed;
      top: 10px;
      left: 10px;
      z-index: 999; /* Ensure it's above other elements */
      cursor: pointer;
    }

    .hamburger .line {
      width: 30px;
      height: 3px;
      background-color: #fff;
      margin: 5px 0;
      transition: transform 0.3s, opacity 0.3s;
    }

    /* Styles for the "active" state of the hamburger icon */
    .hamburger.active .line:nth-child(1) {
      transform: translateY(8px) rotate(45deg);
    }

    .hamburger.active .line:nth-child(2) {
      opacity: 0;
    }

    .hamburger.active .line:nth-child(3) {
      transform: translateY(-8px) rotate(-45deg);
    }
    .footer {
      background-color: #808080;
      color: white;
      text-align: center;
      padding: 10px;
      position: fixed;
      bottom: 0;
      width: 100%;
    }
      </style>
      
      </head>
      
<body>
  <div class="hamburger" onclick="toggleSidebar()">
    <div class="line"></div>
    <div class="line"></div>
    <div class="line"></div>
  </div>
    <script>
    function toggleSidebar() {
      var sidebar = document.querySelector('.sidebar');
      var mainContent = document.querySelector('.main-content');
      var hamburger = document.querySelector('.hamburger');

      if (sidebar.style.width === '250px') {
        sidebar.style.width = '0';
        mainContent.style.marginLeft = '0';
        hamburger.classList.remove('active');
      } else {
        sidebar.style.width = '250px';
        mainContent.style.marginLeft = '250px';
        hamburger.classList.add('active');
      }
    }
  </script>

  <div class="sidebar">
    <button class="nav-button" onclick="location.href='profile.jsp'">PROFILE</button>
    <button class="nav-button" onclick="location.href='courseform.jsp'">COURSE UPDATE</button>
    <button class="nav-button" onclick="location.href='report.jsp'">REPORT</button>
    <button class="nav-button" onclick="location.href='summary.jsp'">SUMMARY</button>
    <button class="nav-button" onclick="location.href='JKDMHomepage.jsp'">LOG OUT</button>
  </div>
  
   <div class="footer">
    &copy; 2024 JKDM PAHANG RESERVED RIGHTS. 
  </div>