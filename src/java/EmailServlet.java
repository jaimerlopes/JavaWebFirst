import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;



@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
       private static final Logger LOGGER = Logger.getLogger(EmailServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obter o conteúdo do e-mail da solicitação
        String content = request.getParameter("emailContent");

        // Imprimir o conteúdo na console do servidor
        System.out.println("Conteúdo do e-mail recebido:");
        System.out.println(content);
        LOGGER.log(Level.INFO, "Conteúdo do e-mail recebido: {0}", content);

        // Responder à solicitação HTTP com uma mensagem de sucesso
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print("Conteúdo do e-mail recebido com sucesso!");
        out.flush();
    }
}
