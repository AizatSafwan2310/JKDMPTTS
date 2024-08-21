<%@ page import="java.sql.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>PerTek Department Data</title>
    <div class="header">
        <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
        <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap">
        <nav>
            <a href="departmentdata.jsp">BACK</a>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #192841;
            color: white;
        }
        .status-red {
            background-color: #f44336; /* Red */
            color: white;
        }
        .status-yellow {
            background-color: #ffeb3b; /* Yellow */
            color: black;
        }
        .status-green {
            background-color: #4caf50; /* Green */
            color: white;
        }
        h1 {
            color: #192841;
        }
    </style>
</head>
<body>
    <h1>PerTek Department Data</h1>
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Work Position</th>
                <th>Group</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Branch</th>
                <th>Courses</th>
                <th>Total Credit Hours</th>
                <th>Course Count</th>
                <th>Status of Completion</th>
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

                try {
                    // Load JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish database connection
                    con = DriverManager.getConnection(url, dbUser, dbPassword);

                    // SQL query to fetch data for the KPSM department, grouping by firstName, lastName, and icnumber
                    String query = "SELECT r.firstName, r.lastName, r.workposition, r.email, r.phoneNumber, r.branch, " +
                                   "GROUP_CONCAT(c.courseName SEPARATOR ', ') AS courses, " +
                                   "SUM(c.creditHours) AS totalCreditHours, COUNT(c.courseName) AS courseCount, " +
                                   "(CASE WHEN SUM(c.creditHours) >= 42 THEN 'COMPLETED' ELSE 'NOT COMPLETED' END) AS statusOfCompletion " +
                                   "FROM jkdmregister r " +
                                   "JOIN courses c ON r.icnumber = c.icnumber " +
                                   "WHERE r.department = 'Perkhidmatan Teknik' OR r.department = 'PerTek' OR r.department = 'Pertek' " +
                                   "GROUP BY r.firstName, r.lastName, r.icnumber, r.workposition, r.email, r.phoneNumber, r.branch";

                    pstmt = con.prepareStatement(query);

                    // Execute the query
                    rs = pstmt.executeQuery();

                    // Display the data in the table
                    while (rs.next()) {
                        String firstName = rs.getString("firstName");
                        String lastName = rs.getString("lastName");
                        String workposition = rs.getString("workposition");
                        String email = rs.getString("email");
                        String phoneNumber = rs.getString("phoneNumber");
                        String branch = rs.getString("branch");
                        String courses = rs.getString("courses");
                        int totalCreditHours = rs.getInt("totalCreditHours");
                        int courseCount = rs.getInt("courseCount");
                        String statusOfCompletion = rs.getString("statusOfCompletion");

                        // Determine the color class based on the total credit hours
                        String colorClass = "";
                        if (totalCreditHours < 21) {
                            colorClass = "status-red";
                        } else if (totalCreditHours < 42) {
                            colorClass = "status-yellow";
                        } else {
                            colorClass = "status-green";
                        }

                       String group = "";
                        switch (workposition) {
                            case "WK54":
                            case "WK52":
                            case "WK44":
                            case "WK41":
                            case "WK48":
                                group = "Pengurusan dan Profesional";
                                break;
                            case "N32":
                            case "N22":
                            case "N19":
                            case "WK19":
                            case "WK22":
                            case "WK29":
                            case "WK32":
                            case "WK28":
                            case "WK26":
                                group = "Pegawai Sokongan 1";
                                break;
                            case "N11":
                            case "H11":
                            case "N14":
                            case "H14":
                                group = "Pegawai Sokongan 2";
                                break;
                            default:
                                group = "Unknown";
                        }
                        %>
                        <tr class="<%= colorClass %>">
                            <td><%= firstName %></td>
                            <td><%= lastName %></td>
                            <td><%= workposition %></td>
                            <td><%= group %></td>
                            <td><%= email %></td>
                            <td><%= phoneNumber %></td>
                            <td><%= branch %></td>
                            <td><%= courses %></td>
                            <td><%= totalCreditHours %></td>
                            <td><%= courseCount %></td>
                            <td><%= statusOfCompletion %></td>
                        </tr>
                        <%
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
            %>
        </tbody>
    </table>
</body>
</html>
