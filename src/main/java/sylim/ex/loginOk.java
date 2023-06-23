package sylim.ex;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class loginOk
 */
@WebServlet("/loginOk")
public class loginOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginOk() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    System.out.println("doPost");
		actionDo(request, response);
	}
	
	 private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();

	        String id = request.getParameter("id");
	        String pw = request.getParameter("pw");

	        Connection conn = null;
	        PreparedStatement pstmt = null;
	        ResultSet rs = null;

	        String driver = "oracle.jdbc.driver.OracleDriver";
	        String url = "jdbc:oracle:thin:@localhost:1521:dink15";
	        String user = "C##scott";
	        String dbPassword = "tiger";
	        String query = "SELECT * FROM member WHERE id = ? AND pw = ?";

	        try {
	            Class.forName(driver);
	            conn = DriverManager.getConnection(url, user, dbPassword);
	            pstmt = conn.prepareStatement(query);
	            pstmt.setString(1, id);
	            pstmt.setString(2, pw);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                // Valid information, redirect to loginResult.jsp
	                response.sendRedirect("loginResult.jsp?id=" + id + "&pw=" + pw);
	            } else {
	                // Invalid information, redirect to login.html
	                response.sendRedirect("login.html");
	            }
	        } catch (ClassNotFoundException e) {
	            out.println("jdbc driver 로딩 실패");
	            e.printStackTrace();
	        } catch (SQLException e) {
	            out.println("오라클 연결 실패");
	            e.printStackTrace();
	        } finally {
	            // Close resources
	            try {
	                if (rs != null) {
	                    rs.close();
	                }
	                if (pstmt != null) {
	                    pstmt.close();
	                }
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }
	        }
	 }
}
