<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course Report</title>
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
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.9);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        h1 {
            text-align: center;
            color: #192841;
        }
    </style>
</head>
<body>
    <h1>Course Report</h1>
    <table>
        <thead>
            <tr>
                <th>Course Name</th>
                <th>Credit Hours</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection parameters
                String url = "jdbc:mysql://localhost:3307/jkdm"; // Adjust URL as needed
                String dbUser = "root"; // Adjust as needed
                String dbPassword = ""; // Adjust as needed

                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                // Retrieve firstName and icnumber from session
                HttpSession currentSession = request.getSession(false);
                if (session != null) {
                    String firstName = (String) session.getAttribute("firstName");
                    String icnumber = (String) session.getAttribute("icnumber");

                    if (firstName != null && icnumber != null) {
                        try {
                            // Load JDBC driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Establish database connection
                            con = DriverManager.getConnection(url, dbUser, dbPassword);

                            // SQL query to select data from the course table based on firstName and icnumber
                            String query = "SELECT courseName, creditHours, startDate, endDate, location " +
                                           "FROM courses " +
                                           "WHERE firstName = ? AND icnumber = ?";

                            // Create prepared statement
                            pstmt = con.prepareStatement(query);
                            pstmt.setString(1, firstName);
                            pstmt.setString(2, icnumber);

                            // Execute the query
                            rs = pstmt.executeQuery();

                            // Process the result set
                            while (rs.next()) {
                                String courseName = rs.getString("courseName");
                                int creditHours = rs.getInt("creditHours");
                                Date startDate = rs.getDate("startDate");
                                Date endDate = rs.getDate("endDate");
                                String location = rs.getString("location");

                                out.print("<tr>");
                                out.print("<td>" + courseName + "</td>");
                                out.print("<td>" + creditHours + "</td>");
                                out.print("<td>" + startDate + "</td>");
                                out.print("<td>" + endDate + "</td>");
                                out.print("<td>" + location + "</td>");
                                out.print("</tr>");
                            }
                        } catch (Exception e) {
                            out.print("Error: " + e.getMessage());
                        } finally {
                            try {
                                // Close database resources
                                if (rs != null) rs.close();
                                if (pstmt != null) pstmt.close();
                                if (con != null) con.close();
                            } catch (SQLException e) {
                                out.print("Error closing database resources: " + e.getMessage());
                            }
                        }
                    } else {
                        out.print("Error: User information is missing.");
                    }
                } else {
                    out.print("Error: No session found.");
                }
            %>
        </tbody>
    </table>
</body>
</html>
