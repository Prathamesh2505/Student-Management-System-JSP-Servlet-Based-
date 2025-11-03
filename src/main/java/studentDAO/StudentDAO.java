package studentDAO;
import java.util.ArrayList;

import studentDTO.Student;

public interface StudentDAO {
	public boolean insertStudent(Student s);

	public boolean updateStudent(Student s);

	public boolean deleteStudent(int id);

	public boolean updateStudentData(Student s);

	public Student getStudent(String email, String pass);

	public Student getStudent(long phone,String email);

	public ArrayList<Student> getAllStudent();

	public Student getStudentById(int id);


}
