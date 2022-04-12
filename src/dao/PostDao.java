package dao;

import bean.Category;
import bean.Post;
import util.DBUtil_d;
import util.Data_Util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    public List<Post> getAll(int p_class) {
        Connection conn = DBUtil_d.getConnection();
        List<Post> posts = new ArrayList<Post>();

        try {
            PreparedStatement prep = conn.prepareStatement("select * from pos" +
                    "t where p_class =? order by created_at  DESC;");
            prep.setInt(1, p_class);
            ResultSet rst = prep.executeQuery();

            int len = 0;
            while (rst.next()) {
                len++;
                Post post = new Post();
                post.setCategry_id(rst.getInt("categry_id"));
                post.setContent(rst.getString("content"));
                post.setId(rst.getInt("id"));
                post.setP_class(rst.getInt("p_class"));
                post.setTitle(rst.getString("title"));
                post.setCreated_ar(rst.getString("created_at"));
                post.setLen(len);

                posts.add(post);
            }
            return posts;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return posts;
        }
    }
    public Post getPost(int id) {
        Connection conn = DBUtil_d.getConnection();

        Post post = new Post();
        try {
            PreparedStatement prep = conn.prepareStatement("select * from pos" +
                    "t where id =?;");
            prep.setInt(1, id);
            ResultSet rst = prep.executeQuery();


            while (rst.next()) {


                post.setCategry_id(rst.getInt("categry_id"));
                post.setContent(rst.getString("content"));
                post.setId(rst.getInt("id"));
                post.setP_class(rst.getInt("p_class"));
                post.setTitle(rst.getString("title"));
                post.setCreated_ar(rst.getString("created_at"));

                return post;


            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();

        }
        return post;
    }


    public int getLen(int p_class){
        Connection conn = DBUtil_d.getConnection();

        PreparedStatement prep = null;
        try {
            prep = conn.prepareStatement("select * from post where p_class =?;");
            prep.setInt(1, p_class);
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
    public int getLen(){
        Connection conn = DBUtil_d.getConnection();

        PreparedStatement prep = null;
        try {
            prep = conn.prepareStatement("select * from post ;");

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

    public boolean del(String[] id){
        Connection conn=DBUtil_d.getConnection();
        try {

            for (int i=0;i<id.length;i++) {
                System.out.println(id[i]);

                PreparedStatement prep1=conn.prepareStatement("select * from post where id=?;");
                prep1.setString(1, id[i]);
                ResultSet rst=prep1.executeQuery();
                if(rst.next()) {

                    PreparedStatement prep = conn.prepareStatement("delete from post where id=?;");
                    prep.setString(1, id[i]);
                    prep.executeUpdate();
                }

            }
            DBUtil_d.close(conn);
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
    public boolean add(String title,String content,String created_ar,int categry_id,int p_class){
        Connection conn=DBUtil_d.getConnection();

        try {
            PreparedStatement prse=conn.prepareStatement("" +
                    "INSERT INTO post (title, content, categry_id, created_at, p_class) " +
                    "VALUES (?, ?, ?, ?, ?)");

            Data_Util data_util=new Data_Util();
            prse.setString(1,title);
            prse.setString(2,content);
            prse.setInt(3,categry_id);
            prse.setString(4, String.valueOf(data_util.data_timestamp()));
            prse.setInt(5,p_class);
            prse.executeUpdate();
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }
    public boolean updata(String title,String content,String created_ar,int categry_id,int p_class,int id){
        Connection conn=DBUtil_d.getConnection();

        try {
            PreparedStatement prse=conn.prepareStatement("" +
                    "UPDATE post  SET " +
                    "title=?, content=?, categry_id=?, created_at=?, p_class=?" +
                    " WHERE id = ?;" );



            System.out.println("=====");
            System.out.println(title);
            System.out.println(content);

            System.out.println(categry_id);

            System.out.println(id);

            Data_Util data_util=new Data_Util();
            prse.setString(1,title);
            prse.setString(2,content);
            prse.setInt(3,categry_id);
            prse.setString(4, String.valueOf(data_util.data_timestamp()));
            prse.setInt(5,p_class);
            prse.setInt(6,id);

            prse.executeUpdate();

            DBUtil_d.close(conn);
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

    public List<Post> getAll(int p_class,int categry_id) {
        Connection conn = DBUtil_d.getConnection();
        List<Post> posts = new ArrayList<Post>();

        try {
            PreparedStatement prep = conn.prepareStatement("select * from pos" +
                    "t where p_class =? and categry_id=?;");
            prep.setInt(1, p_class);
            prep.setInt(2,categry_id);
            ResultSet rst = prep.executeQuery();

            int len = 0;
            while (rst.next()) {
                len++;
                Post post = new Post();
                post.setCategry_id(rst.getInt("categry_id"));
                post.setContent(rst.getString("content"));
                post.setId(rst.getInt("id"));
                post.setP_class(rst.getInt("p_class"));
                post.setTitle(rst.getString("title"));
                post.setCreated_ar(rst.getString("created_at"));
                post.setLen(len);

                posts.add(post);
            }
            return posts;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return posts;
        }
    }





}
