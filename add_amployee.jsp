<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>

   
    <%@ include file="connection.jsp"%>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="header.jsp" />

    <style>
        .container {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>

</head>

<body>

    <div class="container">
        <div class="row">
            <div class="col-md-6 card mx-auto" style="margin-top: 20px;">
                <h2 class="text-center">Add employee</h2>
                <form action="" method="POST">
                    <div class="form-group">
                        <label for="">First Name</label>
                        <input type="text" class="form-control" name="emp_fname" placeholder="First name" required>
                    </div>
                    <div class="form-group">
                        <label for="">Last Name</label>
                        <input type="text" class="form-control" name="emp_lname" placeholder="Last name"  required>
                    </div>
                    <div class="form-group">
                        <label for="">Date of Birth</label>
                        <input type="date" class="form-control" name="emp_dob" placeholder="dd/mm/yyyy"  required>
                    </div>
                    <div class="form-group">
                        <label for="">Section</label>
                        <select class="form-control" name="emp_section" placeholder="eg: packing"  required>
                            <option value="" selected>Choose an option</option>
                            <option value="Packing">Packing</option>
                            <option value="Cutting">Cutting</option>
                            <option value="Mixing">Mixing</option>
                            <option value="Stores">Stores</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" class="form-control" name="emp_email" placeholder="user@gmail.com"  required>
                    </div>
                    <div class="form-group">
                        <label for="">Phone</label>
                        <input type="tel" class="form-control" name="emp_phone" placeholder="071 6925322"  required>
                    </div>
                    <div class="form-group">
                        <label for="">Address</label>
                        <textarea rows="3" class="form-control" name="emp_address" placeholder="Address"  required></textarea>
                    </div>
                    <div class="col-md-6 mx-auto">
                        <button type="submit" class="btn btn-info" style="width: 100%;margin-bottom: 20px;">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>

</html>

<!-- Create the connection -->
<%

String emp_fname = request.getParameter("emp_fname");
String emp_lname = request.getParameter("emp_lname");
String emp_dob = request.getParameter("emp_dob");
String emp_section = request.getParameter("emp_section");
String emp_email = request.getParameter("emp_email");
String emp_phone = request.getParameter("emp_phone");
String emp_address = request.getParameter("emp_address"); 

PreparedStatement stat = null;
if(emp_fname != null && emp_lname != null && emp_dob != null && emp_section != null && emp_email != null && emp_phone != null && emp_address != null)
{
String data = "insert into emp_tbl(emp_fname,emp_lname,emp_dob,emp_section,emp_email,emp_phone,emp_address) values(?,?,?,?,?,?,?)";
stat = conn.prepareStatement(data);
stat.setString(1, emp_fname);
stat.setString(2, emp_lname);
stat.setString(3, emp_dob);
stat.setString(4, emp_section);
stat.setString(5, emp_email);
stat.setString(6, emp_phone);
stat.setString(7, emp_address);
stat.executeUpdate();
response.sendRedirect("index.jsp");

}
%>