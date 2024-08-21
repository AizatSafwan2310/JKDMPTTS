<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Department Data</title>
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
    nav {
      display: flex;
      justify-content: flex-end;
    }
    nav a {
      color: white;
      text-decoration: none;
      padding: 10px;
    } 

    .container {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      margin-top: 20px;
    }

    .box {
      background-color: #FFDE21;
      color: #192841;
      width: 300px;
      height: 150px;
      margin: 15px;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: transform 0.3s, box-shadow 0.3s;
      padding: 10px; /* Add padding to reduce text size */
      box-sizing: border-box;
    }

    .box:hover {
      transform: translateY(-5px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .box a {
      text-decoration: none;
      color: inherit;
      display: block;
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
      text-align: center;
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>Departments</h1>
  </div>

  <div class="container">
    <div class="box">
      <a href="perkastamandepartmentdata.jsp">PERKASTAMAN</a>
    </div>
    <div class="box">
      <a href="kpsmdepartmentdata.jsp">KHIDMAT PENGURUSAN DAN SUMBER MANUSIA (KPSM)</a>
    </div>
    <div class="box">
      <a href="cdndepartmentdata.jsp">CUKAI DALAM NEGERI (CDN)</a>
    </div>
    <div class="box">
      <a href="pertekdepartmentdata.jsp">PERKHIDMATAN TEKNIK (PERTEK)</a>
    </div>
    <div class="box">
      <a href="zpbpkdepartmentdata.jsp">ZON PERDAGANGAN BEBAS PELABUHAN KUANTAN (ZPBPK)</a>
    </div>
    <div class="box">
      <a href="ltsasdepartmentdata.jsp">LAPANGAN TERBANG SULTAN AHMAD SHAH</a>
    </div>
    <div class="box">
      <a href="penguatkuasaandepartmentdata.jsp">PENGUATKUASAAN</a>
    </div>
    <div class="box">
      <a href="marindepartmentdata.jsp">MARIN</a>
    </div>
       <div class="box">
      <a href="pematuhandepartmentdata.jsp">PEMATUHAN</a>
    </div>
  </div>
  
  
  

</body>
</html>
