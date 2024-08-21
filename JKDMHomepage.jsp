<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Homepage</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: url('https://i.pinimg.com/736x/e8/bb/c3/e8bbc31257dc0aa88f2b6a8c55daa1a9.jpg') center center fixed;
      background-size: cover;
      margin: 0;
      overflow-x: hidden;
      position: relative;
    }

    body::before {
      content: "";
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      z-index: -1;
    }

    .header {
      background-color: #192841;
      padding: 10px;
      text-align: center;
      position: relative;
    }

    .header img {
      width: 50px;
      vertical-align: middle;
    }

    .header h1 {
      display: inline-block;
      color: #FFDE21;
      margin: 0;
      padding-left: 10px;
      vertical-align: middle;
      font-family: 'Gugi', sans-serif;
      font-weight: normal;
    }

    .search-container {
      position: absolute;
      right: 20px;
      top: 50%;
      transform: translateY(-50%);
    }

    .search-container input[type="text"] {
      padding: 5px;
      font-size: 16px;
    }

    .search-container input[type="button"] {
      padding: 5px 10px;
      font-size: 16px;
      background-color: #FFDE21;
      border: none;
      cursor: pointer;
      color: #192841;
    }

    .search-container input[type="button"]:hover {
      background-color: #e5c100;
    }

    .sidebar {
      width: 0;
      background-color: rgba(0, 0, 0, 0.5);
      padding-top: 20px;
      float: left;
      height: calc(100vh - 60px);
      overflow: hidden;
      transition: width 0.5s;
    }

    .sidebar .nav-button {
      display: block;
      margin: 10px auto;
      width: 80%;
      padding: 10px 20px;
      background-color: rgba(128, 128, 128, 0.5);
      border: none;
      border-radius: 5px;
      color: white;
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
      margin-left: 0;
      padding: 20px;
      transition: margin-left 0.5s;
    }

    .centered-text {
      text-align: center;
      margin-top: 100px;
      font-family: Anaktoria;
      color: whitesmoke;
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

    .hamburger {
      position: fixed;
      top: 10px;
      left: 10px;
      z-index: 999;
      cursor: pointer;
    }

    .hamburger .line {
      width: 30px;
      height: 3px;
      background-color: #fff;
      margin: 5px 0;
      transition: transform 0.3s, opacity 0.3s;
    }

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
  <div class="header">
    <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
    <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
    <div class="search-container">
      <form action="displaystat.jsp" method="get">
        <input type="text" name="icnumber" placeholder="Enter IC Number">
        <input type="submit" value="Search">
      </form>
    </div>
  </div>
 <div class="hamburger" onclick="toggleSidebar()">
    <div class="line"></div>
    <div class="line"></div>
    <div class="line"></div>
  </div>

  <div class="sidebar">
    <button class="nav-button" onclick="location.href='JKDMHomepage.jsp'">HOME</button>
    <button class="nav-button" onclick="location.href='JKDMLogin.jsp'">LOG IN</button>
    <button class="nav-button" onclick="location.href='departmentdata.jsp'">DEPARTMENT</button>
    <button class="nav-button" onclick="location.href='aboutJKDMPTTS.jsp'">ABOUT US</button>
  </div>

  <div class="main-content">
    <div class="centered-text">
      <p>TRAINING TRACKER</p>
      <p>JABATAN KASTAM DIRAJA MALAYSIA PAHANG</p>
    </div>
    <div class="infographic">
      <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMIcon">
    </div>
  </div>

  <div class="footer">
    &copy; 2024 JKDM PAHANG RESERVED RIGHTS. 
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
