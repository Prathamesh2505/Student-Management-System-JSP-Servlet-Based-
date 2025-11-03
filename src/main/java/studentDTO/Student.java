package studentDTO;
//pojo class
public class Student {
	private int id;
	private String name;
	private long phone;
	private String email;
	private String branch;
	private String loc;
	private String pass;
	private String ConfirmPass;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getConfirmPass() {
		return ConfirmPass;
	}
	public void setConfirmPass(String confirmpass) {
		this.ConfirmPass = confirmpass;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Name: "+name+" ID: "+id+" Branch: "+branch+" Location: "+loc+" Phone: "+phone+" Email:  "+email;
	}
	
}
