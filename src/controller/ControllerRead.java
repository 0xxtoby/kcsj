package controller;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerRead extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String idStr= req.getParameter("id");
        int id= Integer.parseInt(idStr);
        req.setAttribute("id",id);

        req.getRequestDispatcher("/blog_index/read.jsp").forward(req,resp);
    }
}
