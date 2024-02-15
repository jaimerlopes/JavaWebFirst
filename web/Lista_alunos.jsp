<%-- 
    Document   : guardar_alunos
    Created on : 01/02/2024, 20:27:29
    Author     : Acer
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
//String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "bdalunos";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <body>
 <!-- Content to be printed -->
    <div id="contentToPrint">
        <h1>Retrieve data from database in jsp - Alunos</h1>
        <table border="1">
            <tr>
                <td>Numero</td>
                <td>Nome</td>
                <td>e-mail</td>
                <td>data_nascimento</td>

            </tr>
            <%
            try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            String sql ="select * from alunos";
            resultSet = statement.executeQuery(sql);
            while(resultSet.next()){
            %>
            <tr>
                <td><%=resultSet.getString("numero") %></td>
                <td><%=resultSet.getString("nome") %></td>
                <td><%=resultSet.getString("e_mail") %></td>
                <td><%=resultSet.getString("datanasc") %></td>

            </tr>
            <%
            }
            connection.close();
            } catch (Exception e) {
            e.printStackTrace();
            }
            %>
        </table> 
    </div>

    <!-- Print Button -->
    <button onclick="printContent()">Print Page</button>

        <!-- Print Button -->
    <button onclick="sendEmail()">Send email</button>
    <!-- JavaScript to handle the print action -->
    <script>
        function printContent() {
            var contentToPrint = document.getElementById('contentToPrint');
            
            // Open a new window and write the content to it
            var printWindow = window.open('', '_blank');
            printWindow.document.write('<html><head><title>Print</title></head><body>');
            printWindow.document.write(contentToPrint.innerHTML);
            printWindow.document.write('</body></html>');
            
            // Close the document stream to finish writing
            printWindow.document.close();
            
            // Trigger the print dialog
            printWindow.print();
        }
         function sendEmail() {
            var contentToEmail = document.getElementById('contentToPrint').innerHTML;

            // Use Ajax to send content to the servlet
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "teste1?emailContent=" + encodeURIComponent(contentToEmail), true);
            xhr.send();

            // You can handle the response from the servlet if needed
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log(xhr.responseText); // Log the response from the servlet
                }
            };
        }
    </script>

    </body>
</html>