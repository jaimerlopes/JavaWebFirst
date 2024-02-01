<%-- 
    Document   : guardar_alunos
    Created on : 01/02/2024, 20:27:29
    Author     : Acer
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
//String first_name=request.getParameter("first_name");
//String last_name=request.getParameter("last_name");
//String city_name=request.getParameter("city_name");
//String email=request.getParameter("email");

int inumero;
String snome, semail,sdatanasc;
inumero=Integer.parseInt(request.getParameter("numero"));
snome = request.getParameter("nome");
semail = request.getParameter("email");
sdatanasc = request.getParameter("datanasc");
//Date ddatanasc=Date.valueOf(sdatanasc);
  PreparedStatement sta = null;
//Inserir os dados na tabela 

//Executa o comando INSERT 






try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdalunos", "root", "root");
         sta = conn.prepareStatement("INSERT INTO alunos VALUES(?,?,?,?)");
            sta.setInt(1, inumero);
            sta.setString(2, snome);
            sta.setString(3, semail);
            sta.setString(4, sdatanasc);
          sta.executeUpdate();
//            int i=st.executeUpdate("insert into users(first_name,last_name,city_name,email)values('"+first_name+"','"+last_name+"','"+city_name+"','"+email+"')");
        out.println("Data is successfully inserted!");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>