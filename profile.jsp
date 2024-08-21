<%@ page import="java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Profile</title>
    <div class="header">
        <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
        <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap">
        <nav>
        <a href="JKDMDashboard.jsp">BACK</a>
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
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: left;
            width: 420px;
            margin: 80px auto;
        }
        .container img {
            width: 130px;
            height: auto;
            display: block;
            margin: 0 auto;
        }
        .container h2 {
            text-align: center;
            margin: 0;
            padding: 0;
            font-size: 24px;
            color: #333;
        }
        .profile-info {
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .profile-info label {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="images/profileicon.png" alt="Profile" />
        <h2>Your Profile, <%
            HttpSession currentSession = request.getSession(false);
            if (currentSession != null) {
                String firstName = (String) currentSession.getAttribute("firstName");
                if (firstName != null) {
                    out.print(firstName);
                } else {
                    out.print("Guest");
                }
            } else {
                out.print("Guest");
            }
        %>!</h2>
        <div class="profile-info">
            <%
                if (currentSession != null) {
                    String firstName = (String) currentSession.getAttribute("firstName");
                    String lastName = (String) currentSession.getAttribute("lastName");
                    String workposition = (String) currentSession.getAttribute("workposition");
                    String icnumber = (String) currentSession.getAttribute("icnumber");
                    String email = (String) currentSession.getAttribute("email");
                    String phoneNumber = (String) currentSession.getAttribute("phoneNumber");
                    String address = (String) currentSession.getAttribute("address");
                    String branch = (String) currentSession.getAttribute("branch");
                    String department = (String) currentSession.getAttribute("department");
                    
                    String group = "";

                    // Determine the group based on workposition
                    if (workposition != null) {
                        List<String> pengurusanDanProfesional = Arrays.asList("WK54", "WK52", "WK44", "WK41", "WK48");
                        List<String> pegawaiSokongan1 = Arrays.asList("N32", "N22", "N19", "WK19", "WK22", "WK29", "WK32", "WK28", "WK26");
                        List<String> pegawaiSokongan2 = Arrays.asList("N11", "H11", "N14", "H14");

                        if (pengurusanDanProfesional.contains(workposition)) {
                            group = "Pengurusan dan Profesional";
                        } else if (pegawaiSokongan1.contains(workposition)) {
                            group = "Pegawai Sokongan 1";
                        } else if (pegawaiSokongan2.contains(workposition)) {
                            group = "Pegawai Sokongan 2";
                        } else {
                            group = "Unknown Group";
                        }
                    }

                    if (firstName != null && lastName != null && workposition != null &&
                        icnumber != null && email != null && phoneNumber != null && address != null &&
                        branch != null && department != null) {
                        out.print("<label>First Name:</label> " + firstName + "<br>");
                        out.print("<label>Last Name:</label> " + lastName + "<br>");
                        out.print("<label>Work Position:</label> " + workposition + "<br>");
                        out.print("<label>Group:</label> " + group + "<br>");
                        out.print("<label>IC Number:</label> " + icnumber + "<br>");
                        out.print("<label>Email:</label> " + email + "<br>");
                        out.print("<label>Phone Number:</label> " + phoneNumber + "<br>");
                        out.print("<label>Address:</label> " + address + "<br>");
                        out.print("<label>Department:</label> " + department + "<br>");
                        out.print("<label>Branch:</label> " + branch + "<br>");
                    } else {
                        out.print("Profile information is missing.");
                    }
                } else {
                    response.sendRedirect("login.jsp");
                }
            %>
        </div>
        <form action="updateProfile.jsp" method="post">
            <input type="submit" value="Update Profile">
        </form>
    </div>
</body>
</html>
