<%-- 
    Document   : savings
    Created on : 25 Nov, 2023, 11:35:04 PM
    Author     : Dell
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="Home.css" type="text/css">
        <title>Add Savings</title>
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
            <a href="#">Add Savings</a>
            <a href="#" onclick="redirectToPage('addItem.jsp')">Add Item</a>
            <a href="#" onclick="redirectToPage('transaction.jsp')">Transaction History</a>
            <a href="#">Logout</a>
        </div>
        <div class="header">Add New Savings</div>
        <div class="content-container">
            <%@ page import="java.util.Map" %>
            <%@ page import="java.util.HashMap" %>

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
            <center>
                <div class="wrapper">
                    <form action="savingsController" method="POST">

                        <div class="column">
                            <label for="amount">Amount:</label>
                            <input type="text" id="amount" name="amount" required>
                        </div>

                        <div class="column">
                            <label for="dt">Date (yyyy-mm-dd):</label>
                            <input type="text" id="dt" name="dt" pattern="\d{4}-\d{2}-\d{2}" title="Please enter the date in the format yyyy-mm-dd" required>
                        </div>

                        <button type="submit">Add Savings</button>
                    </form>    
                </div>
            </center>
        </div>
    </body>
</html>
