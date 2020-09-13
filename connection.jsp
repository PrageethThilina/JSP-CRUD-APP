<%
    String host = "jdbc:mysql://localhost:3306/jsp_crud_db";
    Connection conn = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection(host,"root","");
%>