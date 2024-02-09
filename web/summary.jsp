<%-- 
    Document   : summary
    Created on : 24 Nov, 2023, 8:10:54 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.Calendar" %>

<%
    HttpSession mySession = request.getSession();
    String email = (String) mySession.getAttribute("email");

    if (email != null) {
        int grocery = 0, travel = 0, other = 0, totalExpenditure, totalSavings = 0, balance;
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/userDB", "users", "user@admin");
            Calendar calendar = Calendar.getInstance();
            int currentMonth = calendar.get(Calendar.MONTH) + 1;

            // Query for expenditures
            String expenditureSql = "SELECT CATEGORY, SUM(PRICE) AS TOTAL_SPENT FROM USERS.ITEMDATA " +
                                     "WHERE EMAIL_ID = ? AND MONTH(DATE) = ? GROUP BY CATEGORY";

            statement = con.prepareStatement(expenditureSql);
            statement.setString(1, email);
            statement.setInt(2, currentMonth);
            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String category = resultSet.getString("CATEGORY");
                int totalSpent = resultSet.getInt("TOTAL_SPENT");

                if ("grocery".equalsIgnoreCase(category)) {
                    grocery = totalSpent;
                } else if ("travel".equalsIgnoreCase(category)) {
                    travel = totalSpent;
                } else if ("other".equalsIgnoreCase(category)) {
                    other = totalSpent;
                }
            }

            totalExpenditure = grocery + travel + other;

            // Query for savings
            String savingsSql = "SELECT COALESCE(SUM(AMOUNT), 0) AS TOTAL_SAVINGS FROM SAVINGS WHERE EMAIL = ?";
            statement = con.prepareStatement(savingsSql);
            statement.setString(1, email);
            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                totalSavings = resultSet.getInt("TOTAL_SAVINGS");
            }

            balance = totalSavings - totalExpenditure;

            mySession.setAttribute("balance", balance);
            mySession.setAttribute("groceryTotal", grocery);
            mySession.setAttribute("travelTotal", travel);
            mySession.setAttribute("otherTotal", other);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    } else {
        System.out.println("Email is null or empty");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Home.css" type="text/css">
        <title>Home Page</title>
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
            <a href="#">Profile</a>
            <a href="#" onclick="redirectToPage('savings.jsp')">Add Savings</a>
            <a href="#" onclick="redirectToPage('addItem.jsp')">Add Item</a>
            <a href="#" onclick="redirectToPage('transaction.jsp')">Transaction History</a>
            <a href="#" onclick="redirectToPage('logout.jsp')">Logout</a>
        </div>
            <div class="header">Monthly Summary</div><br>
            <div class="content-container">
            <div class="card-container">
                <div class="balance">
                    <h2>Balance</h2>
                    <p><center><%= mySession.getAttribute("balance") %></center></p>
                </div>
                <div class="c1">
                    <h2>Grocery</h2>
                    <p><center>Total Spent: <%= mySession.getAttribute("groceryTotal") %></center></p>

                </div>
                <div class="c2">
                    <h2>Travel</h2>
                    <p><center>Total Spent: <%= mySession.getAttribute("travelTotal") %></center></p>
                </div>
                <div class="c3">
                    <h2>Other</h2>
                    <p><center>Total Spent: <%= mySession.getAttribute("otherTotal") %></center></p>
                </div>
            </div>
            </div>
    </body>
</html>
