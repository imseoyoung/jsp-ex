package sylim.daotoex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class MemberDAO {
    private String url = "jdbc:oracle:thin:@localhost:1521:dink15";
    private String uid = "C##scott";
    private String upw = "tiger";
    
    public MemberDAO() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<MemberDTO> memberSelect() {
        ArrayList<MemberDTO> dtos = new ArrayList<MemberDTO>();
        
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DriverManager.getConnection(url, uid, upw);
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select * from member");
            
            while(rs.next()) {
                String name = rs.getString("name");
                String id = rs.getString("id");
                String pw = rs.getString("pw");
                String phone = rs.getString("phone");
                
                MemberDTO dto = new MemberDTO(name, id, pw, phone);
                dtos.add(dto);
            }
        } catch(Exception e) {
            
        } finally {
            try {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        
        return dtos;
    }
    
    public int memberUpdate(MemberDTO member) {
        Connection conn = null;
        Statement stmt = null;
        int result = 0;
        
        try {
            conn = DriverManager.getConnection(url, uid, upw);
            stmt = conn.createStatement();
            
            // 회원 정보 업데이트 SQL 실행
            String query = "UPDATE member SET pw = '" + member.getPw() + "', name = '" + member.getName() + "', phone = '" + member.getPhone() + "' WHERE id = '" + member.getId() + "'";
            result = stmt.executeUpdate(query);
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            } catch(Exception e) {
                e.printStackTrace();
            }
        }
        
        return result;
    }
    
}
