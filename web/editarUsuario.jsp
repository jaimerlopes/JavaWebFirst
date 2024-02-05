<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>

<%
    // Parâmetros do formulário
    String userId = request.getParameter("userId");
    String nome = null;
    String email = null;
    String numero = null;


    try {
        // Carregar o driver JDBC
        Class.forName("com.mysql.jdbc.Driver");

        // Estabelecer a ligação com o a base de dados
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdalunos", "root", "root");

        // Consulta para obter os dados do aluno pelo numero 
        String query = "SELECT * FROM alunos WHERE numero = ?";
        PreparedStatement pstmt = connection.prepareStatement(query);
        pstmt.setString(1, userId);
        ResultSet resultSet = pstmt.executeQuery();

        if (resultSet.next()) {
            // Dados do uluno
             numero = resultSet.getString("numero");
             nome = resultSet.getString("nome");
             email = resultSet.getString("e_mail");
             java.sql.Date dataNasciment=resultSet.getDate("datanasc");
            // Exibir o formulário preenchido com os dados do aluno
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Usuário</title>
       <!-- Adicione o link para o CSS do Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <h2>Editar aluno</h2>
    
        <form action="salvarEdicao.jsp" method="post">
            <div class="mb-3">
                <label for="nome" class="form-label">Numero </label>
                <input type="text" class="form-control col-2" class="form-control" id="userId" name="userId" value="<%=numero%>" readonly>
            </div>

            <div class="mb-3">
                <label for="Nome:" class="form-label">Nome</label>
                <input type="text" class="form-control col-2"  id="nome" name="nome" value="<%=nome%>" required>
            </div>

            <div class="mb-3">
                <label for="email">Email:</label>
                <input type="email" class="form-control col-2" id="email" name="email" value="<%=email%>" required>
            </div>
            
            <div class="mb-3">
                <label for="email">Data Nascimento</label>
                <input type="date"  class="form-control col-2" id="dataNasciment" name="dataNasciment" value="<%=dataNasciment%>" required>
            </div>
            <button type="submit" class="btn btn-primary">Enviar</button>
        </form>  
        
    <!-- Adicione o link para o JavaScript do Bootstrap -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
<%
        } else {
            // aluno não encontrado
            out.println("Usuário não encontrado.");
        }

        // Fechar a ligação
        resultSet.close();
        pstmt.close();
        connection.close();

    } catch (Exception e) {
        out.println("Erro: " + e.getMessage());
        e.printStackTrace();
    }
%>