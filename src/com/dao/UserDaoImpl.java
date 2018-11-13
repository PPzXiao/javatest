package com.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
 
import com.entity.User;
import com.util.DBconn;
 
public class UserDaoImpl implements UserDao{
	
	public boolean register(User user) {
		boolean flag = false;
		DBconn.init();
		if(!(user.getName().equals("")||user.getPwd().equals("")||user.getEmail().equals(""))){
		int i =DBconn.addUpdDel("insert into user(Nickname,Password,RegisterDate,Email) " +
				"values('"+user.getName()+"','"+user.getPwd()+"','"+user.getDate()+"','"+user.getEmail()+"')");
		if(i>0){
			flag = true;
		}
		}
		DBconn.closeConn();
		return flag;
	}
    public boolean login(String Nickname, String Password) {
		boolean flag = false;
		try {
			    DBconn.init();
				ResultSet rs = DBconn.selectSql("select * from user where Nickname='"+Nickname+"' and Password='"+Password+"'");
				while(rs.next()){
					if(rs.getString("Nickname").equals(Nickname) && rs.getString("Password").equals(Password)){
						flag = true;
					}
				}
				DBconn.closeConn();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public List<User> getUserAll() {
		List<User> list = new ArrayList<User>();
    	try {
		    DBconn.init();
			ResultSet rs = DBconn.selectSql("select * from user");
			while(rs.next()){
				User user = new User();
				user.setID(rs.getInt("UserID"));
				user.setName(rs.getString("Nickname"));
				user.setPwd(rs.getString("Password"));
				user.setDate(rs.getString("RegisterDate"));
				user.setEmail(rs.getString("Email"));
				list.add(user);
			}
			DBconn.closeConn();
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	public boolean update(int UserID,String Nickname, String Password,String RegisterDate, String Email) {
		boolean flag = false;
		DBconn.init();
		String sql ="update user set Nickname ='"+Nickname
				+"' , Password ='"+Password
				+"' , RigisterDate ='"+RegisterDate
				+"' , Email ='"+Email
				+"' where id = "+UserID;
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
	public boolean delete(int UserID) {
		boolean flag = false;
		DBconn.init();
		String sql = "delete  from user where id="+UserID;
		int i =DBconn.addUpdDel(sql);
		if(i>0){
			flag = true;
		}
		DBconn.closeConn();
		return flag;
	}
    
}
