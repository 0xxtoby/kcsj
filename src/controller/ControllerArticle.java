package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerArticle extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String cat_id_Str=req.getParameter("cat_id");
        if (cat_id_Str!=null) {
            req.setAttribute("cat_id",cat_id_Str);
        }
        else {
            req.setAttribute("cat_id","-1");
        }
        req.getRequestDispatcher("/blog_index/article.jsp").forward(req,resp);
    }
}
