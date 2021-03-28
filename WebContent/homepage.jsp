<%@page import="com.sun.xml.rpc.processor.modeler.j2ee.xml.string"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="database.Db_Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <title>Home</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <%String userid1 =(String) request.getSession().getAttribute("userid");%>
        <%session.setAttribute("userid", userid1);%> 
    
        <style>
            .b1{
                background-color:chocolate;color: white;
            padding: 15px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 3px 1px;
    cursor: pointer;
            }
            @keyframes example {
    0%   {background-color: Black;}
    25%  {background-color: yellow;}
    50%  {background-color: blue;}
    100% {background-color: DarkMagenta;}
}

button{
    width: 200px;
    height: 40px;
    background-color: black;
    animation-name: example;
    animation-duration: 10s;
    font-family: fantasy;
    color: lime;
    
}
ad{
    width: 20%;
    height: 15px;
    background-color: black;
    
    font-family: fantasy;
    color: lime;
 
        background-color:chocolate;color: white;
            padding: 15px 25px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 3px 1px;
    cursor: pointer;
            
}
    
        </style>
        
        
    </head>
    <body style="background-color:#885e31">
            
    <div id="wrapper">
        <div id="headerpan"></div>
           
    <div id="leftpan">
        <div id="menu">
				<ul>
                             <li><a href="homepage.jsp"><h2>Home</h2></a></li>
                             <li><a href="storage.jsp"><h2>Free storage</h2></a></li>
							<li><a href="games.jsp"><h2>Games</h2></a></li>
				</ul>
			</div>

    </div>

    <div id="centerpan">
        
        <form action="feed.jsp" >
            <center>
                <%session.setAttribute("userid", userid1);%>
                <input type="text" class="text" placeholder="Share your thoughts!!" name="feed"><br>
               <input type="submit" class="button" value="Post">
                             
            </center>
        </form>
            
            
                 <%
                        try
                        {
                                Db_Connection dbconn=new Db_Connection();
                                Connection myconnection= dbconn.Connection();
                                String sql = "SELECT uname,feed,date FROM feeds ORDER BY sno DESC";
                                Statement myStat = myconnection.createStatement();
                                ResultSet rp=myStat.executeQuery(sql);
                                while(rp.next())
                                { 
                                %>
                                <div id="p" >
                                    <div id="left"><h3 style="text-align:left"><%out.println(rp.getString("uname"));%></h3>
                                <%out.print("Date & Time : ");
                                out.print(rp.getString("date"));%>
                                <%out.println('\n');%></div>
                                <div id="ddiv" ><%out.print(rp.getString("feed"));%></div>
                                    </div>
                              <% }%>
                               
              <%
                                myconnection.close();
                        }catch(Exception e){e.printStackTrace();}    
                        
                    %>  
            
        
       </div>

    <div id="rightpan">
        <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.html">Please Login</a>
<%} else {
%>
<h1 style="color:crimson">Welcome !</h1> <h1 style="color:crimson"><%=session.getAttribute("userid")%> :)</h1>
<a href='logout.jsp'><ad>Log out</ad></a>
<%
    }
%>

        
       </div>

    </div>          
    </body>
</html>
