<%-- 
    Document   : success
    Created on : 20 Apr, 2023, 8:01:31 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="container">
            <div class="sidebar">
                <h2>Savings Path</h2>
                <a href="#">Home</a>
                <a href="#" onclick="redirectToPage('summary.jsp')">Profile</a>
                <a href="#" onclick="redirectToPage('savings.jsp')">Add Savings</a>
                <a href="#" onclick="redirectToPage('addItem.jsp')">Add Item</a>
                <a href="#" onclick="redirectToPage('transaction.jsp')">Transaction History</a>
                <a href="#" onclick="redirectToPage('logout.jsp')">Logout</a>
            </div>
            <div class="content-container">
                <div id="text-container">
                    <h1>Welcome to Savings Path</h1>
                    Empower Your Financial Future.
                    Managing your finances has never been this seamless and insightful. 
                    Welcome to Savings Path, where we believe that financial well-being is within everyone's reach. 
                    Whether you're looking to budget wisely, save efficiently, or invest intelligently, we've got you covered.
                    <center><video width="640" height="360" controls>
                        <source src="data/savings_video.mp4" type="video/mp4">
                    </video></center>
                    <h1>Key Features:</h1>

                    <h3>Smart Budgeting: </h3>
                    Gain control over your spending with our intuitive budgeting tools. Set personalized budgets, track expenses effortlessly, and receive insightful analyses to make informed financial decisions.    
                    
                    <h3>Effortless Saving:</h3>
                    Saving for the future made easy. Our platform helps you set and achieve savings goals, automates contributions, and provides tips on maximizing your savings potential.

                    <h3>Real-Time Insights:</h3>
                    Stay in the know with our real-time financial insights. Monitor your financial health, receive alerts, and access personalized tips to optimize your money management strategy.

                    <h1> Why Choose Saving Path?</h1>

                    <h3>User-Friendly Interface:</h3> Our platform is designed with simplicity in mind, making it easy for anyone to navigate and utilize powerful financial tools.

                    <h3>Accessible Anytime, Anywhere:</h3>Manage your finances on the go. Our responsive design ensures a seamless experience across devices.

                    Ready to take control of your financial journey? Join Saving Paths today and embark on a path towards financial freedom.<br>
                </div>
            </div>    
    </div>    
    </body>
</html>
