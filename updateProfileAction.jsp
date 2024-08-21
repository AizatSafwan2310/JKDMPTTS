<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://i.pinimg.com/736x/e8/bb/c3/e8bbc31257dc0aa88f2b6a8c55daa1a9.jpg') center center fixed;
            background-size: cover;
            margin: 0;
            overflow-x: hidden;
            position: relative;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            margin: 80px auto;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Profile</h2>
        <%
            HttpSession currentSession = request.getSession(false); // Rename variable to avoid conflict

            if (currentSession != null) {
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

                // Database connection parameters
                String url = "jdbc:mysql://localhost:3307/jkdm";
                String dbUser = "root";
                String dbPassword = "";

                if (firstName != null && lastName != null && workposition != null &&
                    icnumber != null && email != null && phoneNumber != null && address != null &&
                    branch != null && department != null) {

                    Connection con = null;
                    PreparedStatement pstmt = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, dbUser, dbPassword);

                        String query = "UPDATE jkdmregister SET firstName = ?, lastName = ?, workposition = ?, email = ?, phoneNumber = ?, address = ?, branch = ?, department = ? WHERE icnumber = ?";
                        pstmt = con.prepareStatement(query);
                        pstmt.setString(1, firstName);
                        pstmt.setString(2, lastName);
                        pstmt.setString(3, workposition);
                        pstmt.setString(4, email);
                        pstmt.setString(5, phoneNumber);
                        pstmt.setString(6, address);
                        pstmt.setString(7, branch);
                        pstmt.setString(8, department);
                        pstmt.setString(9, icnumber);

                        int rowsAffected = pstmt.executeUpdate();

                        if (rowsAffected > 0) {
                            // Update session attributes
                            currentSession.setAttribute("firstName", firstName);
                            currentSession.setAttribute("lastName", lastName);
                            currentSession.setAttribute("workposition", workposition);
                            currentSession.setAttribute("email", email);
                            currentSession.setAttribute("phoneNumber", phoneNumber);
                            currentSession.setAttribute("address", address);
                            currentSession.setAttribute("branch", branch);
                            currentSession.setAttribute("department", department);

                            out.println("<p>Profile updated successfully! Redirecting...</p>");
                        } else {
                            out.println("<p>Failed to update profile.</p>");
                        }
                    } catch (Exception e) {
                        out.println("<p>Error: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (pstmt != null) pstmt.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            out.println("<p>Error closing database resources: " + e.getMessage() + "</p>");
                        }
                    }
                } else {
                    out.println("<p>All fields are required.</p>");
                }
            } else {
                response.sendRedirect("JKDMLogin.jsp");
            }
        %>
        <script>
            setTimeout(function() {
                window.location.href = 'profile.jsp';
            }, 3000);
        </script>
    </div>
</body>
</html>
