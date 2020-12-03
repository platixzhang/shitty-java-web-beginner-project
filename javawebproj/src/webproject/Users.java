package webproject;

public class Users {
	private String username;				//Ö÷¼ü
    private String pass;
    public Users(String username,String pass){
        this.username = username;
        this.pass = pass;
    }
    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return pass;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String pass) {
        this.pass = pass;
    }
}
