package controller;

import bean.Category;
import dao.CategoryDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.util.List;

public class ControllerCategory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        CategoryDao dao=new CategoryDao();
        List<Category> categories=dao.get_categorys();
        req.setAttribute("categories",categories);
        req.getRequestDispatcher("/faq.jsp").forward(req,resp);


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req. setCharacterEncoding("UTF-8");
        String action=req.getParameter("action");
        String title=req.getParameter("title");
        System.out.println("选择"+action);

        if ("add".equals(action)){
            if(title==null || "".equals(title)){
                req.setAttribute("error","分类名称不能为空");
                doGet(req,resp);
                return;
            }
            else {
                CategoryDao categoryDao= new CategoryDao();
                String error=categoryDao.add(title);
                req.setAttribute("error",error);
            }

        }
        else if("del".equals(action)){
            String idString=req.getParameter("id");
            int id= Integer.parseInt(idString);
            CategoryDao categoryDao=new CategoryDao();
            String del_title=categoryDao.get_Category(id).getTitle();
            if (categoryDao.del(id)){
                req.setAttribute("error",del_title+"已删除");
                doGet(req,resp);
                return;
            }
            else {
                req.setAttribute("error","删除失败,存在博客标记有该分类");
                doGet(req,resp);
                return;
            }
        }
        else if ("updata".equals(action)){
            String idString=req.getParameter("id");

            int id= Integer.parseInt(idString);
            System.out.println(id);
            CategoryDao categoryDao=new CategoryDao();

            Category category=new Category();

            category=categoryDao.get_Category(id);
            System.out.println(category.getId());
            req.setAttribute("category",category);

            req.getRequestDispatcher("/faq_updata.jsp").forward(req,resp);
            return;

        }
        else if("updata_emp".equals(action)){
            if (title==null||"".equals(title)){
                req.setAttribute("error","！！类型是不为空，请重新修改");
                doGet(req,resp);
                return;
            }
            String idString=req.getParameter("id");
            int id= Integer.parseInt(idString);
            CategoryDao categoryDao=new CategoryDao();
            categoryDao.updata(id,title);
            req.setAttribute("error",title+"类型修改成功");
            doGet(req,resp);
            return;

        }


        doGet(req,resp);
    }
}
