package dao;

import bean.Category;
import bean.Reply;
import util.DBUtil_d;
import util.Data_Util;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
    public List<Reply> getAll(int post_id){
        Connection conn= DBUtil_d.getConnection();
        List<Reply> replies=new ArrayList<Reply>();
        try {
            PreparedStatement prep=conn.prepareStatement("select * from reply where post_id=? order by" +
                    "    created_at DESC;");
            prep.setInt(1,post_id);
            ResultSet rst=prep.executeQuery();
            while (rst.next()){

                Reply reply=new Reply();
                reply.setId(rst.getInt("id"));
//                System.out.println(rst.getInt("id"));
                reply.setPost_id(rst.getInt("post_id"));
                reply.setContent(rst.getString("content"));
                reply.setUsername(rst.getString("username"));
                reply.setCreated_at(rst.getString("created_at"));

                replies.add(reply);
            }
            DBUtil_d.close(conn);
            return replies;

        } catch (SQLException throwables) {
            throwables.printStackTrace();
            System.out.println(throwables.getErrorCode());
            DBUtil_d.close(conn);
            return replies;
        }
    }
    public boolean add(String content,String username,int post_id){
        Connection conn=DBUtil_d.getConnection();


        try {
            Data_Util data_util=new Data_Util();
            Timestamp timestamp=data_util.data_timestamp();
            PreparedStatement prep = conn.prepareStatement("INSERT INTO " +
                    "kcsj_blog.reply (content, created_at, username, post_id) " +
                    "VALUES (?, ?, ?, ?);");
            prep.setString(1,content);
            prep.setString(2, String.valueOf(timestamp));
            prep.setString(3,username);
            prep.setInt(4,post_id);
            prep.executeUpdate();

            DBUtil_d.close(conn);
            return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            DBUtil_d.close(conn);
            return false;
        }
    }
    public int getLen(){
        Connection conn = DBUtil_d.getConnection();

        PreparedStatement prep = null;
        try {
            prep = conn.prepareStatement("select * from reply ;");

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
