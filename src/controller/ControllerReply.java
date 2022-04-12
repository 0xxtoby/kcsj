package controller;

import dao.ReplyDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerReply extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String username=req.getParameter("username");
        String content=req.getParameter("content");
        String post_id_Str=req.getParameter("post_id");
        String action=req.getParameter("action");

        System.out.println("评论选择："+action);
        if ("add".equals(action)){
            ReplyDao replyDao=new ReplyDao();
            if (replyDao.add(content,username, Integer.parseInt(post_id_Str))){
                resp.sendRedirect("read?id="+post_id_Str);

            }
            else {
                System.out.println("添加失败");
            }
        }
    }
}
