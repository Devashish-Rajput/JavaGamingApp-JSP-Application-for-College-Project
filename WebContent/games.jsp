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
        
        <title>Games</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="styles.css" rel="stylesheet" type="text/css"/>
        <%String userid1 =(String) request.getSession().getAttribute("userid");%>
        <%session.setAttribute("userid", userid1);%> 
    
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
        <center><h1>Games!</h1></center>
        <div id="menu">
            <ul>
                <li><a href="pacman-master/index.html"><button>1. Pacman</button></a></li>
            <li><a href="clumsy-bird-master/index.html"><button>2. Clumary bird</button></a> </li>
            <li><a href="2048/index.html"><button>3. 2048 number game</button></a></li>
            <li><a href="javascript-tetris-master/index.html"><button>4. Tetris</button> </a> </li>
            <li><a href="javascript-breakout-master/index.html"><button>5. Breakout</button></a></li>
            <li><a href="javascript-delta-master/index.html"><button>6. Delta</button> </a></li>
        <li>    <a href="javascript-snakes-master/index.html"><button>7. Snake</button> </a>         </li>
        <li><a href="angrybirdsx-master/Game/index.html"><button>8. Angrybird</button></a></li>
        <li><a href="HexGL-master/index.html"><button>9. HexGL</button></a> </li>
            
            </ul>
                             
 

            </div>
            
        
       </div>

    <div id="rightpan">
        <%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.html">Please Login</a>
<%} else {
%>
<h1 style="color:crimson">Welcome !</h1> <h1 style="color: crimson"><%=session.getAttribute("userid")%> :)</h1>
<a href='logout.jsp'><ad>Log out</ad></a>
<%
    }
%>

        
       </div>

    </div>          
    </body>
</html>
