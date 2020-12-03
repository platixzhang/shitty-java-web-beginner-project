package webproject;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class JDBCKonnekt {
	private String url = "jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf-8&allowPublicKeyRetrieval=true";
	private String username = "root";
	private String password = "314159";
	private Connection con=null;
	private Statement stmt=null;
	private ResultSet rs=null;
	private boolean rs_2;
	public JDBCKonnekt(){
        con = getConnection();
    }
	public Connection getConnection()								//链接SQL＆Jvav【bushi
	{
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url,username,password);
			if(!con.isClosed())
			System.out.println("Database linked successfully!\n");
			//String sql = "insert into person(username,name,age,teleno) values('heiel','link',13,'13333333535');";
	        //executeSql(sql);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("ClassNotFoundException\n");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("SQLException\n");
			e.printStackTrace();
		}
		return con;
	}
	public void executeSql(String sql)
	{
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
			//输出结果
			while (rs.next()) {  
                System.out.println(rs.getInt("id"));  
                System.out.println(rs.getString("name")); 
            }
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				rs_2=stmt.execute(sql);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			//e.printStackTrace();
		}
	}
	public List<Map<String,Object>> query(String sql){
        PreparedStatement pstmt = null;
        List<Map<String,Object>> list = null;
        try{
            pstmt = con.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            String[] keys = new String[rsmd.getColumnCount()];
            for(int i=1;i<=rsmd.getColumnCount();++i){
                keys[i-1] = rsmd.getColumnLabel(i);
            }
            list = new ArrayList<Map<String,Object>>();
            while(rs.next()){
                Map<String,Object> map = new HashMap<String,Object>();
                for(int i=0;i<keys.length;++i){
                    map.put(keys[i],rs.getObject(keys[i]));
                }
                list.add(map);
            }
            rs.close();
            pstmt.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }
	public void closeConnect()
	{
		if (rs != null) { //关闭结果集对象  
            try {  
                rs.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
        if (stmt != null) { // 关闭数据库操作对象  
            try {  
                stmt.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
        if (con != null) { // 关闭数据库连接对象  
            try {  
                if (!con.isClosed()) {  
                    con.close();  
                }  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        } 
	}
}