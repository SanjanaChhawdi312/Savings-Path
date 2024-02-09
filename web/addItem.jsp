<%-- 
    Document   : addItem
    Created on : 24 Nov, 2023, 7:25:45 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Home.css" type="text/css">
        <title>Add Item Page</title>
        <script>
            function redirectToPage(page) {
                window.location.href = page;
            }
        </script>
        <link rel="stylesheet" href="Home.css" type="text/css">
    </head>
    <body>
        <div class="sidebar">
            <h2>Savings Path</h2>
            <a href="#" onclick="redirectToPage('Home.jsp')">Home</a>
            <a href="#" onclick="redirectToPage('summary.jsp')">Profile</a>
            <a href="#" onclick="redirectToPage('savings.jsp')">Add Savings</a>
            <a href="#">Add Item</a>
            <a href="#" onclick="redirectToPage('transaction.jsp')">Transaction History</a>
            <a href="#" onclick="redirectToPage('logout.jsp')">Logout</a>
        </div>
            <div class="header">Add New Item</div>
            <div class="content-container">
            <%@page import="java.util.Map"%>
            <%@page import="java.util.HashMap"%>

            <%
                String insertStatus = (String) request.getAttribute("insertStatus");
                if (insertStatus != null) {
                    if (insertStatus.equals("success")) {
                        out.println("<div class=\"info\"><br><center>Record inserted successfully</center></div>");
                    } else if (insertStatus.equals("failure")) {
                        out.println("<div class=\"info\"><center><br>Failed to insert record</center></div>");
                    }
                }
            %>
            <center><div class="wrapper">
            <form action="itemController" method="POST">

                <div class="column">
                <label for="Item item">Item Name:</label>
                <input type="text" id="item" name="item" required>
                </div>

                <div class="column">
                <label for="group"> Category:</label>
                <input type="radio" id="a" name="group" value="grocery" required>
                Grocery

                <input type="radio" id="b" name="group" value="travel">
                Travel

                <input type="radio" id="c" name="group" value="other">
                Other
                </div>

                <div class="column">
                <label for="price">Price:</label>
                <input type="text" id="price" name="price" required>
                </div>

                <div class="column">
                    <label for="dt">Date (yyyy-mm-dd):</label>
                    <input type="text" id="dt" name="dt" pattern="\d{4}-\d{2}-\d{2}" title="Please enter the date in the format yyyy-mm-dd">
                </div>

                <button type="submit">Add Item</button>
            </form>    
                </div></center>
            </div>
    </body>
</html>
