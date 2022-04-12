package dao;



import bean.Category;
import util.DBUtil_d;
import util.Data_Util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class UserDao {

    public boolean isValid(String email,String password){
        Connection conn= DBUtil_d.getConnection();
        PreparedStatement prep =
                null;
        try {
            prep = conn.prepareStatement("select * from user where email=? and password=?;");
            prep.setString(1,email);
            prep.setString(2,password);
            ResultSet rst = prep.executeQuery();

            if (rst.next()){
                return true;
            }
            else {
                return false;
            }


        } catch (SQLException throwables) {
            System.out.println("sqlcuowu");
        }
        DBUtil_d.close(conn);
        return false;
    }
    public boolean register(String username,String email,String password){
        Connection conn=DBUtil_d.getConnection();
        try {
            Data_Util data_util=new Data_Util();
            Timestamp timestamp=data_util.data_timestamp();
            PreparedStatement prep1=conn.prepareStatement("SELECT * FROM user WHERE username=? or email=?");
            prep1.setString(1,username);
            prep1.setString(2,email);
            ResultSet res=prep1.executeQuery();

            if (!res.next()){

            PreparedStatement prep=conn.prepareStatement("INSERT INTO kcsj_blog.user (username, email, password, created_at) VALUES (?, ?, ?, ?)");
            prep.setString(1,username);
            prep.setString(2,email);
            prep.setString(3,password);
            prep.setString(4, String.valueOf(timestamp));

            prep.executeUpdate();
            System.out.println("注册成功");

            return true;
            }
            else
                return false;

        } catch (SQLException throwables) {

            throwables.printStackTrace();
            System.out.println("注册错误");
        }
        return false;
    }
    public int getLen(){
        Connection conn = DBUtil_d.getConnection();

        PreparedStatement prep = null;
        try {
            prep = conn.prepareStatement("select * from user ;");

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
