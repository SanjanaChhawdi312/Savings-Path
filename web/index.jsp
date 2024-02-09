<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<!DOCTYPE html>
<html>
<head>
    <title>Savings Path - Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="loginCss.css" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="loginjs.js"></script>
</head>

<body>
    <html:form action="/loginpath" method="post">
        <div class="header">Savings Path</div>
        <div class="backbox">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="linear-gradient(90deg,#25274d,#464866)" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg>
            <label for="username" class="visually-hidden">Enter username</label>
            <input type="text" id="email" name="email" class="box" placeholder="Enter email id" autocomplete="off">
            <br><br>
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="linear-gradient(90deg,#25274d,#464866)" class="bi bi-lock-fill" viewBox="0 0 16 16">
                <path d="M8 1a2 2 0 0 1 2 2v4H6V3a2 2 0 0 1 2-2zm3 6V3a3 3 0 0 0-6 0v4a2 2 0 0 0-2 2v5a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V9a2 2 0 0 0-2-2z"/>
            </svg>
            
            <label for="pwd" class="visually-hidden">Enter password</label>
            <input type="password" id="pwd" name="pwd" minlength="8" class="box" placeholder="Enter password" autocomplete="off">
            <br><br>
            <a href="#"><I><h6>Forgot Password</h6></I></a>
            <a href="register.html"><I><h6>Create a new account</h6></I></a>
            <br>
            <input type="submit" class="button" value="Login" />
        </div>
    </html:form>    

</body>
</html>
