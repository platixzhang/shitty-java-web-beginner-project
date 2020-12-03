package webproject;
import java.util.List;

public class UserService {
	private UsersOperation uo = new UsersOperation();
    public int DelUser(String username, JDBCKonnekt c)
    {
    	int ans=-1;
        try{
            ans = uo.delUser(username, c);
        }catch (Exception e){
            e.printStackTrace();
        }
        return ans;
    }
    public List<Users> getUsers(JDBCKonnekt c) {
    	List<Users> list = null;
        try{
            list = uo.getUsers(c);
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
	}
    public int modifyPassword(String username,String password,JDBCKonnekt c)
    {
    	int ans=-1;
    	try {
    		ans = uo.modifyUser(username, password, c);
    	}catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    	return ans;
    }
}