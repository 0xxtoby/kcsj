package controller;

import dao.PostDao;
import util.Data_Util;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;

public class ContrillerPostCompose extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String category_id=req.getParameter("category_id");


        System.out.println("选择类型ID："+category_id);




        if(category_id==null||"".equals(category_id)) {
            req.setAttribute("category_boo", "22");
        }
        else {
            req.setAttribute("category_id", category_id);
        }


        req.getRequestDispatcher("/blog_compose.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String title=req.getParameter("title");
        String content=req.getParameter("content");
        String idString=req.getParameter("category_id");
        int id = Integer.parseInt(idString);
        String action=req.getParameter("action");

        Data_Util data_util=new Data_Util();
        String time= String.valueOf(data_util.data_timestamp());

        System.out.println("选择psot："+action);

        if ("send".equals(action)){
            PostDao postDao=new PostDao();
            if (postDao.add(title,content,time,id,1)){
                req.setAttribute("error",title+"博客已添加");
                resp.sendRedirect("blog");
                return;
            }
            else {
                req.setAttribute("error","添加失败");
                doGet(req,resp);

            }
        }
        else if ("post_del".equals(action)){
            PostDao postDao=new PostDao();
            if (postDao.add(title,content,time,id,3)){
                req.setAttribute("error",title+"博客已添加");
                resp.sendRedirect("blog");
                return;
            }
            else {
                req.setAttribute("error","添加失败");
                doGet(req,resp);

            }
        }
        else if ("folder".equals(action)){
            PostDao postDao=new PostDao();
            if (postDao.add(title,content,time,id,2)){
                req.setAttribute("error",title+"博客已添加");
                resp.sendRedirect("blog");
                return;
            }
            else {
                req.setAttribute("error","添加失败");
                doGet(req,resp);
            }
        }





        doGet(req,resp);
    }
}
