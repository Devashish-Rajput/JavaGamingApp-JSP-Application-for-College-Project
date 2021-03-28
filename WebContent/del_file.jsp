<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Db_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String id=(request.getParameter("id"));
 Db_Connection d=new Db_Connection();
 Connection con=d.Connection();
String sql_string="Delete from files where id='"+id+"'";
Statement ms=con.createStatement();
ms.executeUpdate(sql_string);
response.sendRedirect("storage.jsp");%>

