package sylim.daotoex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
    private String url = "jdbc:oracle:thin:@localhost:1521:dink15";
    private String uid = "C##scott";
    private String upw = "tiger";
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    DataSource ds = null;
    
    public MemberDAO() {
//        try {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
        
        try {
            Context ctx = new InitialContext();
            ds = (DataSource)ctx.lookup("java:comp/env/jdbc/Oracle11g");
        } catch(Exception e) {
            e.printStackTrace();       
        }
    }
            
    
    public ArrayList<MemberDTO> memberSelect() {
        ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
        
        try (Connection conn = DriverManager.getConnection(url, uid, upw);
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM member");
             ResultSet rs = pstmt.executeQuery()) {
            
            while (rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("pw");
                String phone = rs.getString("phone");
                
                MemberDTO dto = new MemberDTO(name, id, pw, phone);
                dtos.add(dto);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return dtos;
    }
    
    public int memberUpdate(MemberDTO member) {
        int result = 0;
        
        try (Connection conn = DriverManager.getConnection(url, uid, upw);
             PreparedStatement pstmt = conn.prepareStatement("UPDATE member SET pw = ?, name = ?, phone = ? WHERE id = ?")) {
            
            pstmt.setString(1, member.getPw());
            pstmt.setString(2, member.getName());
            pstmt.setString(3, member.getPhone());
            pstmt.setString(4, member.getId());
            
            result = pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return result;
    }
}