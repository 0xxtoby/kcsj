package dao;

import bean.Category;
import util.DBUtil_d;
import util.Data_Util;

import java.security.PublicKey;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class CategoryDao {
    public List<Category> get_categorys(){

        Connection conn= DBUtil_d.getConnection();
        List<Category> categories=new ArrayList<Category>();
        try {
            Statement stat =conn.createStatement();
            ResultSet rst = stat.executeQuery("select * from category order by created_ar DESC;");

            while (rst.next()){

                Category category=new Category();
                category.setId(rst.getInt("id"));
//                System.out.println(rst.getInt("id"));
                category.setTitle(rst.getString("title"));
                category.setCreated_ar(rst.getString("created_ar"));

                categories.add(category);

            }

            DBUtil_d.close(conn);
            return categories;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println(throwables.getErrorCode());
            DBUtil_d.close(conn);
            return categories;
        }
    }

    public String add(String title){
        Connection conn=DBUtil_d.getConnection();
        System.out.println(title);

        try {
            Statement stat =conn.createStatement();
            PreparedStatement prep1=conn.prepareStatement("select * from category where title =?;");
            prep1.setString(1,title);
            ResultSet rst = prep1.executeQuery();
            if (!rst.next()) {


                Data_Util data_util=new Data_Util();
                Timestamp timestamp=data_util.data_timestamp();
                PreparedStatement prep = conn.prepareStatement("INSERT INTO category (title, created_ar) VALUES (?, ?)");
                prep.setString(1, title);
                prep.setString(2,String.valueOf(timestamp));
                prep.executeUpdate();

                DBUtil_d.close(conn);
                return title+"添加成功";
            }
            else
                DBUtil_d.close(conn);
                return "该分类已存在";

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            DBUtil_d.close(conn);
            return "添加sql错误";
        }
    }
    public boolean del(int id){

        Connection conn=DBUtil_d.getConnection();

        try {
            PreparedStatement prep22=conn.prepareCall("select * from post where categry_id=?");
            prep22.setInt(1,id);
            ResultSet rst22=prep22.executeQuery();
            if (rst22.next()){
                return false;
            }

            PreparedStatement prep=conn.prepareStatement("delete from category where id=?");
            prep.setInt(1,id);
            prep.executeUpdate();

            DBUtil_d.close(conn);
            return true;



        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }


        return false;
    }
    public void updata(int id,String title){
        Connection conn=DBUtil_d.getConnection();

        try {
            PreparedStatement prep=conn.prepareStatement("UPDATE category  SET title = ? , created_ar =? WHERE id = ?");
            Data_Util data_util=new Data_Util();
            Timestamp timestamp=data_util.data_timestamp();
            prep.setString(1,title);
            prep.setString(2, String.valueOf(timestamp));
            prep.setInt(3,id);
            prep.executeUpdate();
            DBUtil_d.close(conn);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
    public Category get_Category(int id){
        Connection conn=DBUtil_d.getConnection();

        try {
            PreparedStatement prep=conn.prepareStatement("select * from category WHERE id = ?");
            prep.setInt(1,id);
            ResultSet rst=prep.executeQuery();
                rst.next();
                Category category=new Category();
                category.setId(rst.getInt("id"));
//                System.out.println(rst.getInt("id"));
                category.setTitle(rst.getString("title"));
                category.setCreated_ar(rst.getString("created_ar"));
                return category;


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
    public int getLen(){
        Connection conn = DBUtil_d.getConnection();

        PreparedStatement prep = null;
        try {
            prep = conn.prepareStatement("select * from category ;");

            ResultSet rst = prep.executeQuery();
            int len=0;
            while (rst.next()){
                len++;
            }
            return len;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return -1;
        }
    }
}
