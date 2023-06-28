package sylim.ex2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("*.do")
public class FrontCon extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FrontCon() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doGet");
        actionDo(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("doPost");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("actionDo");
        String uri = request.getRequestURI();
        System.out.println("uri : " + uri);

        String conPath = request.getContextPath();
        System.out.println("conPath : " + conPath);

        String command = uri.substring(conPath.length());
        System.out.println("command : " + command);
        if (command.equals("insert.do")) {
            System.out.println("/insert.do");
            System.out.println("-----------------------");
        } else if (command.equals("update.do")) {
            System.out.println("/update.do");
            System.out.println("-----------------------");
        } else if (command.equals("select.do")) {
            System.out.println("/select.do");
            System.out.println("-----------------------");
        } else if (command.equals("delete.do")) {
            System.out.println("/delete.do");
            System.out.println("-----------------------");
        }
    }
}

