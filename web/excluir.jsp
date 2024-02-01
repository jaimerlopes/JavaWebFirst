<%-- 
    Document   : guardar_alunos
    Created on : 01/02/2024, 20:27:29
    Author     : Acer
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int inumero;
String snome, semail,sdatanasc;
inumero=Integer.parseInt(request.getParameter("numero"));

    try
    {
         Class.forName("com.mysql.jdbc.Driver");
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdalunos", "root", "root");
        String sql = "DELETE FROM alunos WHERE  numero=?";
        PreparedStatement sta = conn.prepareStatement(sql);
        
        sta.setInt(1, inumero);
        sta.executeUpdate();
        out.println("Data is successfully deleted!");
    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
    }
%>