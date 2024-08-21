<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<head>
    <title>Course Update Submission</title>
    <meta http-equiv="refresh" content="3;url=courseform.jsp"> <!-- Redirects after 3 seconds -->
</head>
<%
    String firstName = request.getParameter("firstName");
    String icnumber = request.getParameter("icnumber");
    String courseName = request.getParameter("courseName");
    String creditHours = request.getParameter("creditHours");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String location = request.getParameter("location");

    Connection conn = null;
    PreparedStatement pstmt = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/jkdm", "username", "password");

        String sql = "INSERT INTO courses (firstName, icnumber, courseName, creditHours, startDate, endDate, location) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, firstName);
        pstmt.setString(2, icnumber);
        pstmt.setString(3, courseName);
        pstmt.setString(4, creditHours);
        pstmt.setString(5, startDate);
        pstmt.setString(6, endDate);
        pstmt.setString(7, location);

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            out.println("Course updated successfully.");
        } else {
            out.println("Failed to update course.");
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
