package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dao.UserDaoImpl;
import com.entity.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

//    public LoginServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("Nickname"); //得到jsp页面传过来的参数
		String pwd = request.getParameter("Password");
		User user = new User();
		UserDao ud = new UserDaoImpl();
		HttpSession session=request.getSession();
		if((user=ud.login(name, pwd)) != null){
			user=ud.getAll1(user);
			request.setAttribute("message", "欢迎用户"+name); //向request域中放置信息
			session.setAttribute("userInfo", user);
			session.setAttribute("grant", 0);
			request.getRequestDispatcher("/success.jsp").forward(request, response);//转发到成功页面
		}else{
			response.sendRedirect("login.jsp"); //重定向到首页
		}

	}

}
