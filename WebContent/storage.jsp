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
        <title>Storage</title>
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
        
        <form method="post" action="UploadFileController" enctype="multipart/form-data">
     <center>              
        
                        <h1>Free Storage!</h1>        
                        <input type="hidden" name="uname2"  value="<%=session.getAttribute("userid")%>">
                        <h2>File Name :</h2>
                        <input type="text" class="text" name="title" placeholder="enter your file name" size="30" required="">
                           <h2>Choose File :</h2>
                           <input type="file" class="button" name="file_uploaded" itemid="filename" required=""/>
                       
                            <input type="submit" class="button" value="Upload">
      </center>
            <%session.setAttribute("userid", userid1);%> 
        </form>
            
                 <%
                        try
                        {
                                Db_Connection dbconn=new Db_Connection();
                                Connection myconnection= dbconn.Connection();
                                String sqlString = "SELECT * FROM files WHERE unames='"+userid1+"' ORDER BY id ASC";
                                Statement myStatement = myconnection.createStatement();
                                ResultSet rs=myStatement.executeQuery(sqlString);   
                                %>
                                <h1>Your files!</h1><br>
                                <%
                                    int temp=1;
                                    
                           while(rs.next())
                                {   
                            %> 
                            
                            
                            <center>
                            <div id="align" ><%out.print(temp);%>.
                                <h2><%out.print(rs.getString("title")); %></h2>
                                <a href="view_file.jsp?id=<%out.println(rs.getString("id"));%>"><h3>Download</h3></a>
                                <a href="del_file.jsp?id=<%out.println(rs.getString("id"));%>"><h3>Delete</h3></a></div>
                                    </center>    
                         
                            <%
                                temp+=1;
                                }
                            %>
                               
                   <%
                                rs.close();
                                myStatement.close(); 
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
