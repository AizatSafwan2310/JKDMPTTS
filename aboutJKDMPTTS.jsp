<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>About JKDM Pahang Training Tracker System</title>
  
  <div class="header">
        <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
        <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap">
        <nav>
        <a href="JKDMHomepage.jsp">BACK</a>
    </nav>
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
        .header {
            background-color: #192841;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header img {
            width: 50px;
            padding-left: 40px;
        }
        .header h1 {
            display: inline-block;
            color: #FFDE21;
            margin: 0;
            padding-left: 10px;
            vertical-align: middle;
            font-family: 'Gugi', sans-serif; /* Use Gugi font */
            font-weight: normal; /* Make the text unbold */
          }

        nav {
            display: flex;
            justify-content: flex-end;
        }

        nav a {
            color: white;
            text-decoration: none;
            padding: 10px;
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

    .main-content {
      margin-left: 0; /* Adjusted to 0 initially */
      padding: 20px;
      transition: margin-left 0.5s; /* Add transition effect */
    }

    .centered-text {
      text-align: center;
      margin-top: 100px;
      font-family: Anaktoria;
      color: navy;
      font-size: 68px;
    }

    .infographic {
      text-align: center;
      margin-top: 20px;
      color: white;
      font-size: 30px;
    }

    .infographic img {
      width: 200px;
      border-radius: 50%;
      box-shadow: 0 0 20px rgba(255, 255, 255, 0.5);
      animation: bounce 2s infinite;
    }

    @keyframes bounce {
      0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
      }
      40% {
        transform: translateY(-20px);
      }
      60% {
        transform: translateY(-10px);
      }
    }

    /* Hamburger icon styles */
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
    
    .about-container {
      background-color: rgba(255, 255, 255, 0.8);
      padding: 20px;
      border-radius: 10px;
      color: #000;
      margin-top: 20px;
      margin-left: 450px;
      width: 650px;
      max-width: 1000px;
      align-content: centre;
    }

    .about-container h2 {
      text-align: center;
      font-family: 'Gugi', sans-serif;
    }

    .about-container p {
      font-size: 18px;
      line-height: 1.6;
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
  

  <!-- Hamburger icon for toggling sidebar -->
  <div class="hamburger" onclick="toggleSidebar()">
    <div class="line"></div>
    <div class="line"></div>
    <div class="line"></div>
  </div>

  <div class="sidebar">
    <button class="nav-button" onclick="location.href='JKDMHomepage.jsp'">HOME</button>
    <button class="nav-button" onclick="location.href='JKDMLogin.jsp'">LOG IN</button>
    <button class="nav-button" onclick="location.href='aboutJKDMPTTS.jsp'">ABOUT US</button>
  </div>

  <div class="main-content">
    <div class="centered-text">
      <p>JKDM PAHANG TRAINING TRACKER SYSTEM</p>
    </div>
    
    <div class="about-container">
      <h2>About JKDM Pahang Training Tracker System</h2>
      <p>
        The Jabatan Kastam Diraja Malaysia Pahang Training Tracker System (JKDM Pahang TTS) is 
        an advanced web-based application crafted to optimize the management and monitoring of 
        training programs within the JKDM Pahang branch. It centralizes training data, allowing 
        for streamlined recording and access to course information, which significantly reduces 
        manual tracking efforts and disparate record-keeping. The system enables real-time progress 
        tracking, ensuring that staff members meet mandatory training requirements while facilitating 
        compliance monitoring through alerts and reports. With its comprehensive reporting capabilities, 
        JKDM Pahang TTS supports the evaluation of training program effectiveness, assisting in data-driven 
        decision-making. Additionally, the system enhances accessibility with a user-friendly interface, 
        making it easier for both staff and administrators to manage and review training activities efficiently.
      </p>
    </div>
    
   
  </div>

  <div class="footer">
    &copy; 2024 OVCS. All rights reserved.
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
</body>
</html>
