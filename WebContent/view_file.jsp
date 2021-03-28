<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="database.Db_Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>File view</title>
    </head>
    <body>
        <%  
            String id=(request.getParameter("id"));
            String uname3=(request.getParameter("uname"));
            String type;
            Blob file = null;
            byte[ ] fileData = null ;

            try
            {    
                Db_Connection dbconn=new Db_Connection();
                Connection conn= dbconn.Connection();
            
                String sqlString = "SELECT * FROM files WHERE id = '"+id+"'";
                Statement myStatement = conn.createStatement();
                
                ResultSet rs=myStatement.executeQuery(sqlString);
                
                if (rs.next()) 
                {
                    
                    file = rs.getBlob("file");
                    fileData = file.getBytes(1,(int)file.length());
                     type=rs.getString("type");
 
                response.setContentType( "type" );
                            
                
                
                response.setHeader("Content-Disposition", "inline");
                response.setContentLength(fileData.length);
                
                OutputStream output = response.getOutputStream();
                output.write(fileData);
                
                output.flush();
                }               
            } catch (SQLException ex) {Logger.getLogger(Logger.class.getName()).log(Level.SEVERE, null, ex);} 
        %>        
    </body>
</html>
