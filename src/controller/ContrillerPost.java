package controller;

import bean.Post;
import dao.PostDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.Enumeration;

public class ContrillerPost extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String[] id = req.getParameterValues("id");
        String action=req.getParameter("action");
        String cat_id=req.getParameter("cat_id");

        if (cat_id!=null){
            req.setAttribute("cat_id", cat_id);
        }
        else {
            req.setAttribute("cat_id", "-1");
        }


        if (id!=null){
            for (int i=0;i<id.length;i++){
            System.out.print("get(id):"+id[i]+" ");
            }
            System.out.println("\n");
        }
        System.out.println("选择"+action);
        if (action==null||"".equals(action)){
            req.setAttribute("p_class", "1");
            System.out.println("111");
            req.setAttribute("title", "博客");
        }else {
            if ("del".equals(action)) {
                PostDao postDao = new PostDao();
                if (postDao.del(id)) {
                    req.setAttribute("error", "删除成功");
                    req.setAttribute("p_class", "1");
                    req.setAttribute("title", "博客");
                } else
                    req.setAttribute("error", "删除失败");
                req.setAttribute("p_class", "1");
                req.setAttribute("title", "博客");

            } else if ("draft".equals(action)) {
                req.setAttribute("p_class", "2");
                req.setAttribute("title", "草稿");
            } else if ("deldata".equals(action)) {
                req.setAttribute("p_class", "3");
                req.setAttribute("title", "回收站");
            } else {
                req.setAttribute("p_class", "1");
                req.setAttribute("title", "博客");

            }
        }



        req.getRequestDispatcher("/blog_box.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        doGet(req,resp);
    }
}
