package studentDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.Connector;
import studentDTO.Student;

public class StudentDAOImp implements StudentDAO {
	Connection con = null;

	public StudentDAOImp() {
		this.con = Connector.getConnection();
	}

	@Override
	public boolean insertStudent(Student s) {
		int res = 0;
		String query = "insert into student values(0,?,?,?,?,?,?,SYSDATE())";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2, s.getPhone());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLoc());
			ps.setString(6, s.getPass());
			res = ps.executeUpdate();
			ps.close();

		} catch (SQLException e) {

			e.printStackTrace();
		}
		if (res > 0) {
			return true;
		} else
			return false;
	}

	@Override
	public boolean updateStudent(Student s) {
		
		    String query = "UPDATE student SET pass = ? WHERE id = ?";
		    int rows = 0;

		    try {
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setString(1, s.getPass());
		        ps.setInt(2, s.getId());  // Use primary key for safety

		        rows = ps.executeUpdate();

		        if (rows > 0) {
		            System.out.println("✅ Password updated for ID: " + s.getId());
		        } else {
		            System.out.println("⚠️ No record updated. Check if ID exists.");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        System.out.println("❌ Error updating student: " + e.getMessage());
		    }

		    return rows > 0; // returns true if update succeeded
		}

	

	
		@Override
		public boolean deleteStudent(int id) {
		    try (Connection con = Connector.getConnection();
		         PreparedStatement ps = con.prepareStatement("DELETE FROM student WHERE id=?")) {
		        ps.setInt(1, id);
		        return ps.executeUpdate() > 0;
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return false;
		}
	

	@Override
	public Student getStudent(String email, String pass) {
		String query = "select * from student where email=? and pass=?";
		ResultSet rs = null;
		Student s = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, pass);
			rs = ps.executeQuery();

			while (rs.next()) {
				s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setEmail(rs.getString("email"));
				s.setBranch(rs.getString("branch"));
				s.setLoc(rs.getString("loc"));
				s.setPass(rs.getString("pass"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (s != null) {
			return s;
		} else {
			return null;
		}
	}

	@Override
	public Student getStudent(long phone, String email) {
		Student s = null;
		String query = "select * from student where phone=? and email=?";

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = new Student();
				s.setId(rs.getInt("id"));
				s.setName(rs.getString("name"));
				s.setPhone(rs.getLong("phone"));
				s.setEmail(rs.getString("email"));
				s.setBranch(rs.getString("branch"));
				s.setLoc(rs.getString("loc"));
				s.setPass(rs.getString("pass"));
			}
			System.out.println(s);
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 System.out.println("Error fetching student: " + e.getMessage());
		}
		return s;
	}


	@Override
	public ArrayList<Student> getAllStudent() {
	    ArrayList<Student> list = new ArrayList<>();
	    try {
	        Connection con = Connector.getConnection();
	        PreparedStatement ps = con.prepareStatement("SELECT * FROM student");
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Student s = new Student();
	            s.setId(rs.getInt("id"));
	            s.setName(rs.getString("name"));
	            s.setPhone(rs.getLong("phone"));
	            s.setEmail(rs.getString("email"));
	            s.setBranch(rs.getString("branch"));
	            s.setLoc(rs.getString("loc"));
	            s.setPass(rs.getString("pass"));
	            list.add(s);
	        }
	        System.out.println(list);

	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}


	@Override
	public boolean updateStudentData(Student s) {
		String query="update student set name=?,phone=?,email=?,branch=?,loc=? where id=?";
		int res=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, s.getName());
			ps.setLong(2,s.getPhone());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getBranch());
			ps.setString(5, s.getLoc());
			ps.setInt(6,s.getId());
			
			res=ps.executeUpdate();
			
		
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		if(res>0) {
			return true;
		}
		else {
		
		return true;
	}
}

	@Override
	public Student getStudentById(int id) {
	    Student s = null;
	    try (Connection con = Connector.getConnection();
	         PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE id=?")) {
	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            s = new Student();
	            s.setId(rs.getInt("id"));
	            s.setName(rs.getString("name"));
	            s.setPhone(rs.getLong("phone"));
	            s.setEmail(rs.getString("email"));
	            s.setBranch(rs.getString("branch"));
	            s.setLoc(rs.getString("loc"));
	            s.setPass(rs.getString("pass"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return s;
	}


}
