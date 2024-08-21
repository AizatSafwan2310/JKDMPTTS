<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Update Status</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: url('https://i.pinimg.com/originals/ec/83/43/ec8343e166adf3d0eb13e11fad0e59ef.jpg') center center fixed;
                background-size: contain;
                margin: 0;
                padding: 0;
                background-color: #f2f2f2;
            }

            .container {
                padding: 20px;
                margin: 50px auto;
                width: 50%;
                background-color: rgba(255, 255, 255, 0.8);
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                text-align: center;
            }

            .success-msg {
                margin-bottom: 20px;
                color: green;
            }

            .error-msg {
                margin-bottom: 20px;
                color: red;
            }

            .action-buttons button {
                padding: 8px 16px;
                margin: 0 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Update Status</h2>
            <%
                // Retrieve parameters from the request
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String phonenumber = request.getParameter("phoneNumber");
                String newStatus = request.getParameter("status");

                // Database connection details
                String url = "jdbc:mysql://localhost:3307/ovcs";
                String user = "root";
                String dbPassword = "";

                Connection con = null;
                PreparedStatement pstmt = null;

                try {
                    // Load the JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish a connection
                    con = DriverManager.getConnection(url, user, dbPassword);

                    // Update the status in the database
                    String query = "UPDATE booking SET status=? WHERE name=? AND phoneNumber=? AND id=?";
                    pstmt = con.prepareStatement(query);
                    pstmt.setString(1, newStatus);
                    pstmt.setString(2, name);
                    pstmt.setString(3, phonenumber);
                    pstmt.setInt(4, id);

                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
            %>
            <p class="message">Status updated successfully!</p>
            <!-- Button to redirect to displaydata.jsp -->
            <div class="redirect-button">
                <p>Redirecting to Display Data in 3 seconds...</p>
            </div>
            <!-- JavaScript for redirection -->
           <script>
    setTimeout(function () {
        if (window.history.length > 1) {
            window.history.back(); // Redirect to the previous page
        } 
    }, 3000); // 3 seconds
</script>

            <%
            } else {
            %>
            <p class="message">Failed to update status.</p>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<p class=\"message\">SQL Exception: " + e.getMessage() + "</p>");
                } catch (Exception e) {
                    out.println("<p class=\"message\">Exception: " + e.getMessage() + "</p>");
                } finally {
                    // Close the database resources
                    try {
                        if (pstmt != null) {
                            pstmt.close();
                        }
                        if (con != null) {
                            con.close();
                        }
                    } catch (SQLException e) {
                        out.println("<p class=\"message\">Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </div>
    </body>
</html>
