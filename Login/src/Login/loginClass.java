package Login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginClass {
	public Connection getConnection()throws IllegalAccessException,
    ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BookAShow","root","Aayush07@");
		return conn;
	}
	public int validation(String username ,String password)throws Exception{
		Connection con = getConnection();
		PreparedStatement ps=con.prepareStatement("select * from BLogin where usernamme=? and password=?");  
        ps.setString( 1 , username );  
		ps.setString( 2 , password );
		int id  = 0;
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			id = rs.getInt(1);
		}
		rs.close();
		ps.close();
		con.close();
		if(id > 0){
			return id;
		}
		else {
			return -1;
		}
	}
	
	public int getCityID(String city) throws SQLException, IllegalAccessException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("Select city_id from cities where city_name = ?");
		ps.setString(1 , city);
		ResultSet rs = ps.executeQuery();
		int city_id = 0;
		while(rs.next()) {
			city_id  = rs.getInt(1);
		}
		return city_id;
	}
	public int getMovieID(String movie) throws SQLException, IllegalAccessException, ClassNotFoundException {
		Connection con = getConnection();
		PreparedStatement ps = con.prepareStatement("Select movie_id from movies where movie_name = " + movie);
		ResultSet rs = ps.executeQuery();
		int movie_id = 0;
		while(rs.next()) {
			movie_id = rs.getInt(1);
		}
		return movie_id;			
	}
}
