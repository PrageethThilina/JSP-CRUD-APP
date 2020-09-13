<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("d");
    int no = Integer.parseInt(id);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_crud_db","root","");
    Statement stat = conn.createStatement();
    stat.executeUpdate("delete from emp_tbl where emp_id='"+no+"'");
    response.sendRedirect("index.jsp");


%>