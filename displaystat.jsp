<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Details</title>
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
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 800px;
            margin: 20px auto;
        }
        h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .status-pass {
            background-color: green;
            color: white;
        }
        .status-halfpass {
            background-color: yellow;
            color: black;
        }
        .status-low {
            background-color: red;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Staff Details</h2>
        <%
            String url = "jdbc:mysql://localhost:3307/jkdm";
            String dbUser = "root";
            String dbPassword = "";
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String icnumber = request.getParameter("icnumber");

            if (icnumber != null && !icnumber.trim().isEmpty()) {
                try {
                    // Load JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    // Establish database connection
                    con = DriverManager.getConnection(url, dbUser, dbPassword);

                    // SQL query to get staff details
                    String query = "SELECT * FROM jkdmregister WHERE icnumber = ?";
                    pstmt = con.prepareStatement(query);
                    pstmt.setString(1, icnumber);
                    rs = pstmt.executeQuery();

                    // Check if any result is found
                    if (rs.next()) {
                        String firstName = rs.getString("firstName");
                        String lastName = rs.getString("lastName");
                        String workPosition = rs.getString("workposition");
                        String email = rs.getString("email");
                        String phoneNumber = rs.getString("phoneNumber");
                        String department = rs.getString("department");
                        String branch = rs.getString("branch");
                        
                          String group = "";

                    // Determine the group based on workposition
                    if (workPosition != null) {
                        List<String> pengurusanDanProfesional = Arrays.asList("WK54", "WK52", "WK44", "WK41", "WK48");
                        List<String> pegawaiSokongan1 = Arrays.asList("N32", "N22", "N19", "WK19", "WK22", "WK29", "WK32", "WK28", "WK26");
                        List<String> pegawaiSokongan2 = Arrays.asList("N11", "H11", "N14", "H14");

                        if (pengurusanDanProfesional.contains(workPosition)) {
                            group = "Pengurusan dan Profesional";
                        } else if (pegawaiSokongan1.contains(workPosition)) {
                            group = "Pegawai Sokongan 1";
                        } else if (pegawaiSokongan2.contains(workPosition)) {
                            group = "Pegawai Sokongan 2";
                        } else {
                            group = "Unknown Group";
                        }
                    }

                        // SQL query to get course details
                        String courseQuery = "SELECT courseName, creditHours, startDate, endDate,  location FROM courses WHERE icnumber = ?";
                        pstmt = con.prepareStatement(courseQuery);
                        pstmt.setString(1, icnumber);
                        ResultSet courseRs = pstmt.executeQuery();

                        // Calculate total credit hours and count of courses
                        int totalCredits = 0;
                        int courseCount = 0;

                        while (courseRs.next()) {
                            totalCredits += courseRs.getInt("creditHours");
                            courseCount++;
                        }
                        String status;
                        String statusClass;
                        if (totalCredits >= 42) {
                            status = "COMPLETED";
                            statusClass = "status-pass";
                        } else if (totalCredits >= 21) {
                            status = "ALMOST COMPLETED";
                            statusClass = "status-halfpass";
                        } else {
                            status = "BARELY COMPLETED";
                            statusClass = "status-low";
                        }

                        out.println("<h3>Staff Information</h3>");
                        out.println("<table>");
                        out.println("<tr><th>First Name</th><td>" + firstName + "</td></tr>");
                        out.println("<tr><th>Last Name</th><td>" + lastName + "</td></tr>");
                        out.println("<tr><th>Work Position</th><td>" + workPosition + "</td></tr>");
                        out.println("<tr><th>Group</th><td>" + group + "</td></tr>");
                        out.println("<tr><th>Email</th><td>" + email + "</td></tr>");
                        out.println("<tr><th>Phone Number</th><td>" + phoneNumber + "</td></tr>");
                        out.println("<tr><th>Department</th><td>" + department + "</td></tr>");
                        out.println("<tr><th>Branch</th><td>" + branch + "</td></tr>");
                        out.println("<tr><th>Total Credits</th><td>" + totalCredits + "</td></tr>");
                        out.println("<tr><th>Course Count</th><td>" + courseCount + "</td></tr>");
                        out.println("<tr><th>Status</th><td class=\"" + statusClass + "\">" + status + "</td></tr>");
                        
                        out.println("</table>");
                    } else {
                        out.println("<p>No staff found with the provided IC number.</p>");
                    }
                } catch (Exception e) {
                    out.print("Error: " + e.getMessage());
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        out.print("Error closing database resources: " + e.getMessage());
                    }
                }
            } else {
                out.println("<p>Please provide an IC number.</p>");
            }
        %>
    </div>
</body>
</html>
