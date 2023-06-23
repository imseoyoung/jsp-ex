package sylim.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

/**
 * Servlet implementation class JoinOk
 */
@WebServlet("/JoinOk")
public class JoinOk extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private String name, id, pw, phone;
    private String query;
    private Connection conn;
    private Statement stmt;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinOk() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//      response.getWriter().append("Served at: ").append(request.getContextPath());
        System.out.println("doGet");
        actionDo(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
//      doGet(request, response);
        System.out.println("doPost");
        actionDo(request, response);
    }

    private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String driver = "oracle.jdbc.driver.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:dink15";
        String user = "C##scott";
        String password = "tiger";
        
        name = request.getParameter("name");
        id = request.getParameter("id");
        pw = request.getParameter("pw");
        phone = request.getParameter("phone");
        
        query = "insert into member(name, id, pw, phone) values('" + name + "','" + id + "','" + pw + "','" + phone + "')";
    
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            int iResult = stmt.executeUpdate(query);
            
            if( iResult == 1 ) {
                System.out.println("insert success");
                response.sendRedirect("joinResult.jsp");
            } else {
                System.out.println("insert fail");
                response.sendRedirect("join.html");
            }
            
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            response.sendRedirect("join.html");
        } finally {
            try {
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        }
    }
}