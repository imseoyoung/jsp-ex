package sylim.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private MemberDAO memberDAO;
       
    public JoinOk() {
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
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String phone = request.getParameter("phone");

        MemberDTO member = new MemberDTO(name, id, pw, phone);
        memberDAO = new MemberDAO();
        
        int result = memberDAO.memberInsert(member);

        if (result == 1) {
            System.out.println("insert success");
            response.sendRedirect("joinResult.jsp");
        } else {
            System.out.println("insert fail");
            response.sendRedirect("join.html");
        }
    }
}