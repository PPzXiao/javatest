package com.dao;

import java.util.List;
 
import com.entity.User;
 
public interface UserDao {
	public boolean login(String Nickname,String Password);//��¼
	public boolean register(User user);//ע��
	public List<User> getUserAll();//�����û���Ϣ����
	public boolean delete(int UserID) ;//����idɾ���û�
	public boolean update(int UserID,String Nickname, String Password,String RigisterDate, String Email) ;//�����û���Ϣ
}