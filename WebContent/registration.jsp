<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<%
    String user = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String gender=request.getParameter("gender");
    String dob=request.getParameter("dob");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/members","root", "");
    Statement st = con.createStatement();
    //ResultSet rs;
    String sql="insert into members(first_name, last_name, dob, gender, email, uname, pass, regdate) values ('" + fname + "','" + lname + "','"+dob+"','"+gender+"','" + email + "','" + user + "','" + pwd + "', CURDATE())";
    //Statement myStat=con.createStatement();;
        String sql1="select uname from members"; 
        ResultSet rp = st.executeQuery(sql1);
        int n = 1;
       /*while(n<=2)
       {
           if(n==1)
           {
       while(rp.next())
       {
        String uname=rp.getString("uname");
        if(uname==user) 
        {
            out.print("Enter a valid user name try another name!!!");
            n=3;
            response.sendRedirect("reg.jsp");
        }
       }
       n++;
           }
        else
        {*/
            int i = st.executeUpdate(sql);
          if (i > 0) {
        //session.setAttribute("userid", user);
             response.sendRedirect("welcome.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
          } else {
             response.sendRedirect("index.html");
          }
        //}
      //}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration page</title>
    </head>
    <body>
     
    </body>
</html>
