<%-- 
    Document   : joinClub
    Created on : 28 Mar, 2019, 11:21:02 PM
    Author     : NITHISHKUMAR K R
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join club</title>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="icon" href="../img/extraCurricular/photography.png">
    </head>
    <body>
        <div class="container">
        <div class="row">
          <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card card-signin my-5">
              <div class="card-body">
                <h5 class="card-title text-center"><img src="../img/hack.ico" alt="WillBeUpdatedSoon" width="50" height="50"></h5>
                <h5 class="card-title text-center">Join Club</h5>
                <form class="form-signin" action="/MepcoClubServer/AddMembers" method="POST">
                  
                  <div class="form-label-group">
                      <input type="email" class="form-control" name="email" placeholder="Email address" required><br>
                  </div>
                  
                  <div class="form-label-group">
                    <select name="dept" class="form-control">
                        <option value="it">IT</option>
                        <option value="cse" selected>CSE</option>
                        <option value="ece">ECE</option>
                        <option value="others">Other</option>
                    </select>
                  </div><br>  
                    
                  <div class="form-label-group">
                      <input type="text" id="inputEmail" class="form-control" name="rollno" placeholder="Roll number" required><br>
                  </div>

                    
                  <div class="form-label-group">
                      <select name="club" class="form-control">
                            <option value="google">Google</option>
                            <option value="math">Math</option>
                            <option value="microsoft">Microsoft</option>
                            <option value="csi">CSI</option>
                            <option value="innovative">Innovative</option>
                            <option value="health">Health</option>
                            <option value="finearts">Fine Arts</option>
                            <option value="photography">Photography</option>
                        </select> 
                  </div><br>
                  <button class="btn btn-lg btn-info btn-block" type="submit">Join</button>
                  <hr class="my-4">
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </body>
</html>
