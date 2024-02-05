<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    // Parâmetros do formulário
    String userId = request.getParameter("userId");
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String dataNasciment = request.getParameter("dataNasciment");

    try {

      // Carregar o driver JDBC
        Class.forName("com.mysql.jdbc.Driver");

        // Estabelecer a conexão com o banco de dados
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdalunos", "root", "root");

        // Atualizar os dados do usuário no banco de dados
        String updateQuery = "UPDATE alunos SET nome = ?, e_mail = ?, datanasc=? WHERE numero = ?";
        PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
        updateStatement.setString(1, nome);
        updateStatement.setString(2, email);
        updateStatement.setString(3, dataNasciment);
        updateStatement.setString(4, userId);
        int rowsAffected = updateStatement.executeUpdate();

        // Verificar se a atualização foi bem-sucedida
        if (rowsAffected > 0) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edição Salva</title>
</head>
<body>
    <h2>Edição Salva</h2>
    <p>Os dados do usuário foram atualizados com sucesso.</p>
</body>
</html>
<%
        } else {
            // Nenhuma linha foi afetada (usuário não encontrado ou nenhum campo foi modificado)
            out.println("Nenhum dado foi modificado ou o usuário não foi encontrado.");
        }

        // Fechar a conexão
        updateStatement.close();
        connection.close();

    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
        e.printStackTrace();
    }
%>