<%@page import="java.math.BigDecimal"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Time;
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Display Orders and Payments</title>
    <header>
        <nav>
            <a href="employeepage.jsp">Back</a>
            <a href="homepage.jsp">Logout</a>
        </nav>
    </header>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://i.pinimg.com/originals/ec/83/43/ec8343e166adf3d0eb13e11fad0e59ef.jpg') center center fixed;
            background-size: contain;
            margin: 0;
            padding: 0;
            background-color: #f2f2f2;
        }
        header {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: right;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header h1 {
            margin: 0;
        }
        nav {
            background-color: #444;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 80%;
            margin: 20px auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #333;
            color: #fff;
        }
        .status-dropdown {
            padding: 5px;
            border-radius: 5px;
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Orders</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Phone Number</th>
                    <th>Menu</th>
                    <th>Quantity</th>
                    <th>Event Date</th>
                    <th>Event Time</th>
                    <th>Event Location</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection details
                    String url = "jdbc:mysql://localhost:3307/ovcs";
                    String user = "root";
                    String dbPassword = "";

                    Connection con = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;

                    try {
                        // Load the JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish a connection
                        con = DriverManager.getConnection(url, user, dbPassword);

                        // Query to fetch order data
                        String query = "SELECT id,name, phoneNumber, menu, quantity, eventDate, eventTime, eventLocation, status FROM booking";
                        pstmt = con.prepareStatement(query);
                        rs = pstmt.executeQuery();

                        // Display order data in table
                        while (rs.next()) {
                            int id = rs.getInt("id");

                            String name = rs.getString("name");
                            String phonenumber = rs.getString("phoneNumber");
                            String menu = rs.getString("menu");
                            String quantity = rs.getString("quantity");
                            String eventDate = rs.getString("eventDate");
                            String eventTime = rs.getString("eventTime");
                            String eventLocation = rs.getString("eventLocation");
                            String status = rs.getString("status");
                %>
                <tr>
                    <td><%= name%></td>
                    <td hidden ><%= id%></td>
                    <td><%= phonenumber%></td>
                    <td><%= menu%></td>
                    <td><%= quantity%></td>
                    <td><%= eventDate%></td>
                    <td><%= eventTime%></td>
                    <td><%= eventLocation%></td>
                    
                    <td>
                        <form action="updateStatus.jsp" method="post">
                            <input type="hidden" name="id" value="<%= id%>">
                            <input type="hidden" name="name" value="<%= name%>">
                            <input type="hidden" name="phoneNumber" value="<%= phonenumber%>">
                            <select name="status" class="status-dropdown">
                                <option value="Pending" <%= status.equals("Pending") ? "selected" : ""%>>Pending</option>
                                <option value="Approved" <%= status.equals("Approved") ? "selected" : ""%>>Approved</option>
                                <option value="Rejected" <%= status.equals("Rejected") ? "selected" : ""%>>Rejected</option>
                            </select>
                            <input type="submit" value="Update">
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("<p>SQL Exception: " + e.getMessage() + "</p>");
                    } catch (Exception e) {
                        out.println("<p>Exception: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) {
                                rs.close();
                            }
                            if (pstmt != null) {
                                pstmt.close();
                            }
                            if (con != null) {
                                con.close();
                            }
                        } catch (SQLException e) {
                            out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                        }
                    }
                %>
            </tbody>
        </table>

        <h2>Payments</h2>
        <table>
            <thead>
                <tr>
                    <th>Payment Proof</th>
                    <th>Amount Paid</th>
                    <th>Date Of Payment</th>
                    <th>Time Of Payment</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        // Re-establish a connection for payment data
                        con = DriverManager.getConnection(url, user, dbPassword);

                        // Query to fetch payment data
                        String query = "SELECT paymentProof, amountPaid, dateOfPayment, timeOfPayment FROM payment";
                        pstmt = con.prepareStatement(query);
                        rs = pstmt.executeQuery();

                        // Display payment data in table
                        while (rs.next()) {
                            String paymentProof = rs.getString("paymentProof");
                            BigDecimal amountPaid = rs.getBigDecimal("amountPaid");
                            java.sql.Date dateOfPayment = rs.getDate("dateOfPayment");
                            java.sql.Time timeOfPayment = rs.getTime("timeOfPayment");

                            // Convert Date and Time to String
                            String dateOfPaymentStr = (dateOfPayment != null) ? dateOfPayment.toString() : "";
                            String timeOfPaymentStr = (timeOfPayment != null) ? timeOfPayment.toString() : "";
                %>
                <tr>
                    <td><a href="<%= paymentProof%>" target="_blank">View Proof</a></td>
                    <td><%= amountPaid%></td>
                    <td><%= dateOfPaymentStr%></td>
                    <td><%= timeOfPaymentStr%></td>
                </tr>
                <%
                        }
                    } catch (SQLException e) {
                        out.println("<p>SQL Exception: " + e.getMessage() + "</p>");
                    } catch (Exception e) {
                        out.println("<p>Exception: " + e.getMessage() + "</p>");
                    } finally {
                        try {
                            if (rs != null) {
                                rs.close();
                            }
                            if (pstmt != null) {
                                pstmt.close();
                            }
                            if (con != null) {
                                con.close();
                            }
                        } catch (SQLException e) {
                            out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>