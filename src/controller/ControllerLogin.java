package controller;


import dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ControllerLogin extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("logoin.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String email=req.getParameter("email");
        String password=req.getParameter("password");
        System.out.println(email);
        System.out.println(password);

        UserDao userDao=new UserDao();
        if (userDao.isValid(email,password)){
            HttpSession session=req.getSession();

            session.setAttribute("user",email);
            resp.sendRedirect("admin");
        }
        else
        {
            req.setAttribute("error","账号或密码错误");
           doGet(req,resp);
        }
    }
}

