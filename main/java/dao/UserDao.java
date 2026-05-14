package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDao {

	public User login(String email, String password) {

	    User user = null;

	    try {

	        Connection connection = DBConnection.getConnection();

	        String sql = "SELECT * FROM users WHERE email=? AND password=?" ;

	        PreparedStatement ps = connection.prepareStatement(sql);

	        ps.setString(1, email);
	        ps.setString(2, password);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {

	            user = new User();

	            user.setId(rs.getInt("id"));
	            user.setNom(rs.getString("nom"));
	            user.setEmail(rs.getString("email"));
	            user.setPassword(rs.getString("password"));
	            user.setRole(rs.getString("role"));
	        }

	    } catch(Exception e) {

	        e.printStackTrace();
	    }

	    return user;
	}
	public int countEtudiants() {

	    int total = 0;

	    try {
	        Connection connection = DBConnection.getConnection();

	        String sql = "SELECT COUNT(*) FROM users WHERE role='etudiant'";

	        PreparedStatement ps = connection.prepareStatement(sql);

	        ResultSet rs = ps.executeQuery();

	        if(rs.next()) {
	            total = rs.getInt(1);
	        }

	    } catch(Exception e) {
	        e.printStackTrace();
	    }

	    return total;
	}
}