<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*, java.time.*, java.time.temporal.ChronoUnit" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Completion Summary</title>
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
            width: 1000px;
            margin: 80px auto;
        }
        .container p {
            margin: 0;
            padding: 5px 0;
        }
        .container p span {
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: navy;
            color: yellow;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:nth-child(odd) {
            background-color: #e0e0e0;
        }
    </style>
    <script>
        function printSummary() {
            window.print();
        }
    </script>
</head>
<body>
    <div class="header">
        <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
        <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
        <nav>
            <a href="JKDMDashboard.jsp">BACK</a>
        </nav>
    </div>
    <div class="container">
        <h2>Course Completion Summary for, <%
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
        <%
            String url = "jdbc:mysql://localhost:3307/jkdm";
            String dbUser = "root";
            String dbPassword = "";

            if (currentSession != null) {
                String firstName = (String) currentSession.getAttribute("firstName");
                String icnumber = (String) currentSession.getAttribute("icnumber");

                if (firstName != null && icnumber != null) {
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, dbUser, dbPassword);

                        String query = "SELECT courseName, creditHours, startDate, endDate " +
                                       "FROM courses " +
                                       "WHERE firstName = ? AND icnumber = ?";
                        pstmt = con.prepareStatement(query);
                        pstmt.setString(1, firstName);
                        pstmt.setString(2, icnumber);
                        rs = pstmt.executeQuery();

                        int totalCredits = 0;
                        int courseCount = 0;
                        long totalDays = 0;

                        LocalDate earliestStartDate = null;
                        LocalDate latestEndDate = null;

                        out.print("<table>");
                        out.print("<tr><th>Course Name</th><th>Credit Hours</th><th>Start Date</th><th>End Date</th><th>Days</th></tr>");

                        while (rs.next()) {
                            String courseName = rs.getString("courseName");
                            int creditHours = rs.getInt("creditHours");
                            LocalDate startDate = rs.getDate("startDate").toLocalDate();
                            LocalDate endDate = rs.getDate("endDate").toLocalDate();

                            if (earliestStartDate == null || startDate.isBefore(earliestStartDate)) {
                                earliestStartDate = startDate;
                            }
                            if (latestEndDate == null || endDate.isAfter(latestEndDate)) {
                                latestEndDate = endDate;
                            }

                            long courseDays = ChronoUnit.DAYS.between(startDate, endDate) + 1;

                            totalCredits += creditHours;
                            totalDays += courseDays;
                            courseCount++;

                            out.print("<tr>");
                            out.print("<td>" + courseName + "</td>");
                            out.print("<td>" + creditHours + "</td>");
                            out.print("<td>" + startDate + "</td>");
                            out.print("<td>" + endDate + "</td>");
                            out.print("<td>" + courseDays + "</td>");
                            out.print("</tr>");
                        }

                        out.print("</table>");

                        int minRequiredCredits = 42;
                        int remainingCredits = minRequiredCredits - totalCredits;
                        remainingCredits = remainingCredits > 0 ? remainingCredits : 0;

                        double percentageCompleted = (totalCredits / (double) minRequiredCredits) * 100;

                        out.print("<p><span>Total Credit Hours:</span> " + totalCredits + "</p>");
                        out.print("<p><span>Number of Courses Attended:</span> " + courseCount + "</p>");
                        out.print("<p><span>Total Days for All Courses:</span> " + totalDays + "</p>");
                        out.print("<p><span>Percentage Completed:</span> " + String.format("%.2f", percentageCompleted) + "%</p>");
                        out.print("<p><span>Remaining Credit Hours to Pass:</span> " + remainingCredits + "</p>");
                        out.print("<p><span>Status:</span> " + (totalCredits >= minRequiredCredits ? "Pass and Met" : "Do Not Meet") + " the Minimum Credit Hours Requirement</p>");
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
                    out.print("Error: User is missing.");
                }
            } else {
                response.sendRedirect("JKDMLogin.jsp");
            }
        %>
        <button onclick="printSummary()">Print</button>
    </div>
</body>
</html>
