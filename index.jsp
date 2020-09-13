<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP CRUD Application</title>

    <%@ include file="connection.jsp"%>
    <jsp:include page="navbar.jsp" />
    <jsp:include page="header.jsp" />
    <link rel="stylesheet" href="css/jquery-dataTables.min.css">

    <style>
        .container-fluid {
            margin-top: 30px;
        }

        h2 {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        th {
            width: 400px;
            background: rgb(11, 141, 43);
        }

        .table {
            display: block;
            overflow-x: auto;
            overflow-y: auto;
            white-space: nowrap;
        }
    </style>

</head>

<body>

    <!-- View employee list -->
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <a class="btn btn-primary" style="float: right;" href="add_amployee.jsp">Add Employee</a>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <h2 class="text-center">Employee List</h2>
                <table class="table table-hover table-bordered table-responsive table-success" id="emp_table">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">First Name</th>
                            <th class="text-center">Last Name</th>
                            <th class="text-center">Date of Birth</th>
                            <th class="text-center">Section</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Phone</th>
                            <th class="text-center">Address</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                        Statement stat = null;
                        ResultSet res = null;
                        stat = conn.createStatement();
                        String data = "select * from emp_tbl order by emp_id desc";
                        res = stat.executeQuery(data);
                        while(res.next()){
                       
                        %>

                        <tr>
                            <td class="text-center"><%=res.getString("emp_id") %></td>
                            <td class="text-center"><%=res.getString("emp_fname") %></td>
                            <td class="text-center"><%=res.getString("emp_lname") %></td>
                            <td class="text-center"><%=res.getString("emp_dob") %></td>
                            <td class="text-center"><%=res.getString("emp_section") %></td>
                            <td class="text-center"><%=res.getString("emp_email") %></td>
                            <td class="text-center"><%=res.getString("emp_phone") %></td>
                            <td class="text-center"><%=res.getString("emp_address") %></td>
                            <td class="text-center">
                                <a class="btn btn-warning"
                                    href='edit_employee.jsp?u=<%=res.getString("emp_id") %>'>Edit</a>
                                <a class="btn btn-danger"
                                    href='delete_employee.jsp?d=<%=res.getString("emp_id") %>'>Delete</a>

                            </td>
                        </tr>

                        <%
                            }
                        %>

                    </tbody>
                </table>
            </div>
        </div>
    </div>


    <jsp:include page="footer.jsp" />
    <script src="js/jquery.js"></script>
    <script src="js/jquery-dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#emp_table').dataTable();
        })
    </script>

</body>

</html>