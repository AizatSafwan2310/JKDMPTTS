<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>
   <div class="header">
        <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
        <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap">
        <nav>
        <a href="JKDMLogin.jsp">LOG IN</a>
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
            text-align: center;
            width: 500px; /* Set your desired width */
            margin: 80px auto; /* Center the container */
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
        }

        input,
        button {
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>JKDM Pahang Registration Page</h2>

        <%
            // Retrieve form parameters
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String workposition = request.getParameter("workposition");
            String icnumber = request.getParameter("icnumber");
            String email = request.getParameter("email");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String branch = request.getParameter("branch");
            String department = request.getParameter("department");
            String password = request.getParameter("password");

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/JKDM";
            String dbUser = "root";
            String dbPassword = "admin";

            // Check if all required fields are filled
            if (firstName != null && lastName != null &&  workposition != null && 
                icnumber != null && email != null && phoneNumber != null && address != null && 
                branch != null && department != null && password != null) {

                // Validate password
                if (password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&_])[A-Za-z\\d@$!%*?&_]{8,}$")) {
                    Connection con = null;
                    PreparedStatement pstmt = null;

                    try {
                        // Load JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish database connection
                        con = DriverManager.getConnection(url, dbUser, dbPassword);

                        // SQL query to insert data into the jkdmregister table
                        String query = "INSERT INTO jkdmregister (firstName, lastName, workposition, icnumber, email, phoneNumber, address, branch, department, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                        // Create prepared statement
                        pstmt = con.prepareStatement(query);
                        pstmt.setString(1, firstName);
                        pstmt.setString(2, lastName);
                        pstmt.setString(3, workposition);
                        pstmt.setString(4, icnumber);
                        pstmt.setString(5, email);
                        pstmt.setString(6, phoneNumber);
                        pstmt.setString(7, address);
                        pstmt.setString(8, branch);
                        pstmt.setString(9, department);
                        pstmt.setString(10, password);

                        // Execute the query
                        int rowsAffected = pstmt.executeUpdate();

                        // Check if data is inserted successfully
                        if (rowsAffected > 0) {
                            out.println("<p>Data inserted successfully!</p>");
                            response.sendRedirect("JKDMLogin.jsp");
                        } else {
                            out.println("<p>Failed to insert data</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            // Close database resources
                            if (pstmt != null) pstmt.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
                        }
                    }
                } else {
                    out.println("<p>Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.</p>");
                }
            } else {
                out.println("<p></p>");
            }
        %>

       <form action="JKDMRegister.jsp" method="post">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required>

    <label for="workgrade">Position:</label>
    <input type="text" id="workposition" name="workposition" required>

    <label for="icnumber">IC Number:</label>
    <input type="text" id="icnumber" name="icnumber" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>

    <label for="phoneNumber">Phone Number:</label>
    <input type="tel" id="phoneNumber" name="phoneNumber" required>

    <label for="address">Address:</label>
    <input type="text" id="address" name="address" required>

    <label for="branch">Branch:</label>
    <input type="text" id="branch" name="branch" required>

    <label for="department">Department:</label>
    <input type="text" id="department" name="department" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">Register</button>
</form>

    </div>
</body>
</html>
