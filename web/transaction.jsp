<%-- 
    Document   : transaction
    Created on : 25 Nov, 2023, 9:47:56 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Home.css" type="text/css">
        <title>Transaction History</title>
        <script>
            function redirectToPage(page) {
                window.location.href = page;
            }
        </script>
    </head>
    <body>
        <div class="sidebar">
            <h2>Savings Path</h2>
            <a href="#" onclick="redirectToPage('Home.jsp')">Home</a>
            <a href="#" onclick="redirectToPage('summary.jsp')">Profile</a>
            <a href="#" onclick="redirectToPage('savings.jsp')">Add Savings</a>
            <a href="#" onclick="redirectToPage('addItem.jsp')">Add Item</a>
            <a href="#">Transaction History</a>
            <a href="#" onclick="redirectToPage('logout.jsp')">Logout</a>
        </div>
            <div class="header">Transaction History</div><br>
            <div class="content-container">
        <%
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                HttpSession mySession = request.getSession();
                String email = (String) mySession.getAttribute("email");
                if (email != null) {
                    con = DriverManager.getConnection("jdbc:derby://localhost:1527/userDB", "users", "user@admin");
                    String query = "SELECT ITEM_NAME, CATEGORY, SUM(PRICE) AS TOTAL_PRICE, DATE FROM USERS.ITEMDATA WHERE EMAIL_ID = ? GROUP BY ITEM_NAME, CATEGORY, DATE ORDER BY DATE DESC";
                    pstmt = con.prepareStatement(query);
                    pstmt.setString(1, email);
                    rs = pstmt.executeQuery();

                    out.println("<center><table border='1'>");
                    out.println("<tr><th>Item Name</th><th>Category</th><th>Total Price</th><th>Date</th></tr>");

                    double totalPrice = 0;

                    while (rs.next()) {
                        String itemName = rs.getString("ITEM_NAME");
                        String category = rs.getString("CATEGORY");
                        double totalItemPrice = rs.getDouble("TOTAL_PRICE");
                        Date date = rs.getDate("DATE");

                        out.println("<tr><td>" + itemName + "</td><td>" + category + "</td><td>" + totalItemPrice + "</td><td>" + date + "</td></tr>");

                        totalPrice += totalItemPrice;
                    }

                    out.println("<tr><td colspan='2'><b>Total</b></td><td><b>" + totalPrice + "</b></td><td></td></tr>");

                    out.println("</table> </center>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (con != null) {
                    try {
                        con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
            </div>
    </body>
</html>
