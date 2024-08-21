<%@page import="java.sql.*, javax.servlet.*, javax.servlet.http.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JKDM Pahang Login Page</title>
    <div class="header">
        <img src="https://i.pinimg.com/736x/4c/dd/1c/4cdd1cb33d9457d42dc137ed86e04847.jpg" alt="JKDMP">
        <h1>Jabatan Kastam Diraja Malaysia Pahang</h1>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gugi&display=swap">
        <nav>
        <a href="JKDMHomepage.jsp">HOME</a>
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
            width: 400px; /* Set your desired width */
            margin: 80px auto; /* Center the container */
        }

        .container img {
            width: 130px; /* Set image width */
            height: auto; /* Maintain aspect ratio */
            display: block;
            margin: 0 auto; /* Center the image */
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
    
    <img src="images/loginicon.png" alt="Login" />

    <h2>JKDM Pahang Login Page</h2>

    <%
        String icnumber = request.getParameter("icnumber");
        String password = request.getParameter("password");

        // Check if username and password are not null or empty
        if (icnumber != null && !icnumber.isEmpty() && password != null && !password.isEmpty()) {
            String url = "jdbc:mysql://localhost:3306/JKDM";
            String user = "root";
            String dbPassword = "admin";

            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url, user, dbPassword);
                String query = "SELECT * FROM jkdmregister WHERE icnumber = ? AND password = ?";
                pstmt = con.prepareStatement(query);
                pstmt.setString(1, icnumber);
                pstmt.setString(2, password);

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    // User found in database, proceed to logged in page
                    session.setAttribute("icnumber", icnumber);
                    session.setAttribute("firstName", rs.getString("firstName"));
                    session.setAttribute("lastName", rs.getString("lastName"));
                    session.setAttribute("workposition", rs.getString("workposition"));
                    session.setAttribute("email", rs.getString("email"));
                    session.setAttribute("phoneNumber", rs.getString("phoneNumber"));
                    session.setAttribute("address", rs.getString("address"));
                    session.setAttribute("branch", rs.getString("branch"));
                    session.setAttribute("department", rs.getString("department"));
                    // Redirect to user dashboard
                    response.sendRedirect("JKDMDashboard.jsp");
                } else {
                    // User not found in database
                    out.println("<p>Invalid username or password</p>");
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
                }
            }
        } else {
            out.println("");
        }
    %>

    <form action="JKDMLogin.jsp" method="post">
        <label for="icnumber">IC Number:</label>
        <input type="text" id="icnumber" name="icnumber" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Log In">
        <div class="no-account">
            <p>Don't have an account? <a href="JKDMRegister.jsp">Register here</a>.</p>
        </div>
    </form>
</div>
</body>
</html>
