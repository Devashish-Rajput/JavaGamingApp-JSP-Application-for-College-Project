<%@page import="java.util.Random"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.Connection"%>
<%@page import="database.Db_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String b=request.getParameter("feed"); 
String userid1 =(String) request.getSession().getAttribute("userid");
Db_Connection d=new Db_Connection();
Connection co=d.Connection();
Date dNow = new Date( );
         SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd/hh:mm:ss");
         String date1=ft.format(dNow);
Random rand = new Random();
                int  n = rand.nextInt(9999) + 1;
                String idTemp=(String.valueOf(n));
String sql="insert into feeds (id,uname,feed,date) values ('"+idTemp+"','"+userid1+"','"+b+"','"+date1+"');";
Statement ms=co.createStatement();
ms.executeUpdate(sql);
response.sendRedirect("homepage.jsp");%>%>

