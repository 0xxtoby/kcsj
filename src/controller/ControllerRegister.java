package controller;

import dao.UserDao;
import util.Data_Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerRegister extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("register.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String email=req.getParameter("email");
        String password=req.getParameter("password");

        System.out.println("注册");
        System.out.println(username);
        System.out.println(email);
        System.out.println(password);

        UserDao dao=new UserDao();
        if (dao.register(username,email,password)){
            req.setAttribute("error","注册成功请登录");

            req.getRequestDispatcher("logoin.jsp").forward(req,resp);
        }
        else {
            req.setAttribute("error","姓名或邮箱已存在");

            req.getRequestDispatcher("register.jsp").forward(req,resp);
        }

        doGet(req,resp);
    }
}
