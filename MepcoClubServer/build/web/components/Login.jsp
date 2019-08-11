<%-- 
    Document   : Login
    Created on : 17 Mar, 2019, 7:20:54 PM
    Author     : NITHISHKUMAR K R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/collegeLogo.jpg">
    </head>
    <body>
      
      <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h5 class="card-title text-center"><img src="../img/hack.ico" alt="WillBeUpdatedSoon" width="50" height="50"></h5>
                <h5 class="card-title text-center"><span class="btn badge-success">Admin | OB's Login</span>&nbsp;&nbsp;&nbsp;<a class="btn btn-warning" href="../index.html">HOME</a> </h5>
                <form class="form-signin" action="LoginProcess.jsp" method="POST">
                  <div class="form-label-group">
                      <input type="email" id="inputEmail" class="form-control" name="email" placeholder="Email address" required autofocus><br>
                  </div>

                  <div class="form-label-group">
                      <input type="password" id="inputPassword" class="form-control" name="password" placeholder="Password" required><br>
                  </div>
 
                  <div class="custom-control custom-checkbox mb-3">
                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                    <label class="custom-control-label" for="customCheck1">Remember password</label>
                  </div>
                  <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Sign in</button>
                  <hr class="my-4">
                  <a href="ForgotPassword.jsp">Forgot Password?</a>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </body>
</html>
