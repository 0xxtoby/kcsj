package controller;

import bean.Category;
import bean.Post;
import dao.CategoryDao;
import dao.PostDao;
import util.Data_Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;

public class ContrillerPostUpdata extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String category_id=req.getParameter("category_id");
        String post_id=req.getParameter("post_id");

        PostDao postDao=new PostDao();
        Post post=postDao.getPost(Integer.parseInt(post_id));
        CategoryDao categoryDao=new CategoryDao();

        System.out.println("选择类型ID："+category_id);

        if(category_id==null||"".equals(category_id)) {

        }
        else {
            post.setCategry_id(Integer.parseInt(category_id));
        }

        req.setAttribute("post",post);


        req.getRequestDispatcher("/blog_updata.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String title=req.getParameter("title");
        String content=req.getParameter("content");
        String cat_idString=req.getParameter("category_id");
        int cat_id = Integer.parseInt(cat_idString);

        String idString=req.getParameter("id");
        int id = Integer.parseInt(idString);
        String action=req.getParameter("action");



        Data_Util data_util=new Data_Util();
        String time= String.valueOf(data_util.data_timestamp());

        System.out.println("选择psot："+action);


        if ("send".equals(action)){
            PostDao postDao=new PostDao();
            if (postDao.updata(title,content,time,cat_id,1,id)){
                req.setAttribute("error",title+"博客已修改");
                resp.sendRedirect("blog");
                return;
            }
            else {
                req.setAttribute("error","修改失败");
                System.out.println("修改失败");
                return;
//                doGet(req,resp);

            }
        }
        else if ("post_del".equals(action)){
            PostDao postDao=new PostDao();
            if (postDao.updata(title,content,time,cat_id,3,id)){
                req.setAttribute("error",title+"博客已修改");
                resp.sendRedirect("blog");
                return;
            }
            else {
                req.setAttribute("error","修改失败");
                doGet(req,resp);

            }
        }
        else if ("folder".equals(action)){
            PostDao postDao=new PostDao();
            if (postDao.updata(title,content,time,cat_id,2,id)){
                req.setAttribute("error",title+"博客已修改");
                resp.sendRedirect("blog");
                return;
            }
            else {
                req.setAttribute("error","修改失败");
                doGet(req,resp);
            }
        }





        doGet(req,resp);
    }
}
