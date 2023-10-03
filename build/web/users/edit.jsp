<%@page import="Models.User"%>
<%@page import="ModeloDAO.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Staff Management System</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Custom styles -->
        <link href="../css/dashboard.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Staff Management System</a>
              </div>
            </div>
          </nav>
        
        <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="StaffServlet?action=list">Staff</a></li>
            <li><a href="StattendanceServlet?action=list">Attendance</a></li>
            <li><a href="LeaveServlet?action=list">Leaves</a></li>
            <li><a href="SalaryServlet?action=list">Salaries</a></li>
            <li class="active"><a href="UserServlet?action=list">Users<span class="sr-only">(current)</span></a></li>
            <li><a href="<%=request.getContextPath()%>/LogoutServlet">Logout</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

          <h2 class="sub-header">Edit User</h2>
          <div class="user-form" style="width: 50%;">
              <%
              UserDAO dao=new UserDAO();
              int id=Integer.parseInt((String)request.getAttribute("userId"));
              User per=(User)dao.list(id);
          %>
            <form>
                Email:<br>
                <input class="form-control" type="email" name="txtEmail" value="<%= per.getEmail()%>" required><br>
                Password: <br>
                <input class="form-control" type="password" name="txtPassword" value="<%= per.getPassword()%>" required><br>
                <div class="form-group">
                    <select name="cmbRole">
                        <option value="Admin">Admin</option>
                        <option value="Moderator">Moderator</option>
                        <option value="User">User</option>
                    </select>   
                </div>
                <input type="hidden" name="txtUserId" value="<%= per.getUserId()%>">
                <button type="submit" class="btn btn-primary" name="action" value="editrow">Submit</button>
            </form>
          </div>
        </div>
      </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
   
    </body>
</html>
