package controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import database.Db_Connection;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.RequestDispatcher;

@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)

public class UploadFileController extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
        
                InputStream inputStream = null;

                Random rand = new Random();
                int  n = rand.nextInt(9999) + 1;
                String idTemp=(String.valueOf(n));
                String uname2=(request.getParameter("uname2"));

                  String title=(request.getParameter("title"));
                  String fname=request.getParameter("filename");
                Part filePart = request.getPart("file_uploaded");
                String type=filePart.getContentType(); 
                
                if (filePart != null) 
                {
                    System.out.println(filePart.getSubmittedFileName().toString());
                    System.out.println(filePart.getName());                    
                    System.out.println(filePart.getSize());
                    System.out.println(filePart.getContentType());

                    inputStream = filePart.getInputStream();
                }
        
                try 
                {
                    Db_Connection dbconn=new Db_Connection();
                    Connection conn= dbconn.Connection();
                    
                    String sql = "INSERT INTO files (unames,id, title,type, file) values ( ?, ?, ?, ?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, uname2);
                    statement.setString(2, idTemp);
                    statement.setString(3, title);
                    statement.setString(4,type);
             
                    if (inputStream != null) 
                    {
                        statement.setBinaryStream(5, inputStream, (int) filePart.getSize());
                    }
                    
                  int row = statement.executeUpdate();
                    if (row > 0) 
                    {
                        
                        out.println("File uploaded!!!");
                        out.println(fname);
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("storage.jsp");
                        rs.include(request, response);
                    }
                    else
                    {
                        out.println("Couldn't upload your file!!!");
                        
                        conn.close();
                        
                        RequestDispatcher rs = request.getRequestDispatcher("storage.jsp");
                        rs.include(request, response);
                    }    

                }catch(Exception e){e.printStackTrace();}     
    }   
}