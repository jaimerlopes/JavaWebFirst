<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    // Parâmetros do formulário
    String userId = request.getParameter("userId");
            String nome = null;
            String email = null;
                                String numero = null;

    // Conexão com o banco de dados
//    String jdbcURL = "jdbc:mysql://localhost:330/bdalunos";
//    String dbUser = "root";
//    String dbPassword = "root";

    try {
        // Carregar o driver JDBC
        Class.forName("com.mysql.jdbc.Driver");

        // Estabelecer a conexão com o banco de dados
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdalunos", "root", "root");

        // Consulta para obter os dados do usuário pelo ID
        String query = "SELECT * FROM alunos WHERE numero = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, userId);
        ResultSet resultSet = pstmt.executeQuery();

        if (resultSet.next()) {
            // Dados do usuário
             numero = resultSet.getString("numero");
             nome = resultSet.getString("nome");
             email = resultSet.getString("e_mail");
             out.println(email);
             java.sql.Date dataNasciment=resultSet.getDate("datanasc");
      
  

            // Exibir o formulário preenchido com os dados do usuário
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuário</title>
</head>
<body>
    <h2>Editar Usuário</h2>
    <form action="salvarEdicao.jsp" method="post">
        <label for="userId">ID do Usuário:</label>
        <input type="text" id="userId" name="userId" value="<%=numero%>" readonly>
        <br>
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" value="<%=nome%>" required>
        <br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%=email%>" required>
        <br>
        <label for="email">Data Nascimento</label>
        <input type="date" id="dataNasciment" name="dataNasciment" value="<%=dataNasciment%>" required>
        <br>
        <input type="submit" value="Salvar Edição">
    </form>
</body>
</html>
<%
        } else {
            // Usuário não encontrado
            out.println("Usuário não encontrado.");
        }

        // Fechar a conexão
        resultSet.close();
        pstmt.close();
        connection.close();

    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
        e.printStackTrace();
    }
%>