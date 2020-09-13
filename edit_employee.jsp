<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Employee</title>

    <%@ include file="connection.jsp"%>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="header.jsp" />

    <style>
        .container {
            margin-top: 30px;
        }

        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
        }
    </style>

</head>

<body>


    <!-- edit employee -->
    <%
        Statement stat = null;
        ResultSet res = null;
        PreparedStatement stmt = null;
    %>

    <div class="container">
        <div class="row">
            <div class="col-md-6 card mx-auto">
                <h2 class="text-center">Update Employee Details</h2>
                <form action="" method="POST">

                <%
                 stat = conn.createStatement();
                 String u = request.getParameter("u");
                 int num = Integer.parseInt(u);
                 String data = "select * from emp_tbl where emp_id='"+num+"'";
                 res = stat.executeQuery(data);
                 while(res.next()){

                %>
                    <input type="hidden" name="emp_id" value='<%=res.getString("emp_id") %>' />
                    <div class="form-group">
                        <label for="">First Name</label>
                        <input type="text" class="form-control" name="emp_fname"
                            value='<%=res.getString("emp_fname") %>' required>
                    </div>
                    <div class="form-group">
                        <label for="">Last Name</label>
                        <input type="text" class="form-control" name="emp_lname"
                            value='<%=res.getString("emp_lname") %>' required>
                    </div>
                    <div class="form-group">
                        <label for="">Date of Birth</label>
                        <input type="date" class="form-control" name="emp_dob" value='<%=res.getString("emp_dob") %>'
                            required>
                    </div>
                    <div class="form-group">
                        <label for="">Section</label>
                        <select class="form-control" name="emp_section" required>
                            <option selected><%=res.getString("emp_section") %></option>
                            <option value="Packing">Packing</option>
                            <option value="Cutting">Cutting</option>
                            <option value="Mixing">Mixing</option>
                            <option value="Stores">Stores</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" class="form-control" name="emp_email"
                            value='<%=res.getString("emp_email") %>' required>
                    </div>
                    <div class="form-group">
                        <label for="">Phone</label>
                        <input type="tel" class="form-control" name="emp_phone" value='<%=res.getString("emp_phone") %>'
                            required>
                    </div>
                    <div class="form-group">
                        <label for="">Address</label>
                        <textarea rows="3" class="form-control" name="emp_address"
                            required><%=res.getString("emp_address") %></textarea>
                    </div>
                    <div class="col-md-6 mx-auto">
                        <button type="submit" class="btn btn-info"
                            style="width: 100%;margin-bottom: 20px;">Submit</button>
                    </div>

                    <%
                 }
                %>

                </form>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />

</body>

</html>


<!-- Create the connection for update employee-->
<%

    String emp_id = request.getParameter("emp_id");
    String emp_fname = request.getParameter("emp_fname");
    String emp_lname = request.getParameter("emp_lname");
    String emp_dob = request.getParameter("emp_dob");
    String emp_section = request.getParameter("emp_section");
    String emp_email = request.getParameter("emp_email");
    String emp_phone = request.getParameter("emp_phone");
    String emp_address = request.getParameter("emp_address"); 
    if(emp_id != null && emp_fname != null && emp_lname != null && emp_dob != null && emp_section != null && emp_email != null && emp_phone != null && emp_address != null)
    {
    conn = DriverManager.getConnection(host,"root","");
    String query = "update emp_tbl set emp_fname=?, emp_lname=?, emp_dob=?, emp_section=?, emp_email=?, emp_phone=?, emp_address=? where emp_id='"+emp_id+"'";
    stmt = conn.prepareStatement(query);
    stmt.setString(1, emp_fname);
    stmt.setString(2, emp_lname);
    stmt.setString(3, emp_dob);
    stmt.setString(4, emp_section);
    stmt.setString(5, emp_email);
    stmt.setString(6, emp_phone);
    stmt.setString(7, emp_address);
    stmt.executeUpdate();
    response.sendRedirect("index.jsp");
    
    }
    %>