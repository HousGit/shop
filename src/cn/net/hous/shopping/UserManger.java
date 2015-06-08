package cn.net.hous.shopping;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ˧ on 2015/6/5.
 */
public class UserManger {

    public static List<User> getUser()
    {
        List<User> list = new ArrayList<>();
        Connection conn = DB.getConn();
        Statement stm = DB.getStm(conn);
        ResultSet rs = DB.getRs(stm,"select * from user");
        try {
            while (rs.next())
            {
                User u = new User();
                u.setId(rs.getInt(1));
                u.setUsername(rs.getString(2));
                u.setPassword(rs.getString(3));
                u.setPhone(rs.getString(4));
                u.setAddr(rs.getString(5));
                u.setRdate(rs.getTimestamp(6));
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closeRs(rs);
            DB.closeStm(stm);
            DB.closeConn(conn);
        }

        return list;
    }

    public static void deleteUser(int id)
    {
        Connection conn = DB.getConn();
        PreparedStatement pstm = DB.getPstm(conn, "delete from user where id=?");
        try {
            pstm.setInt(1, id);
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static boolean hasUser(String username)
    {
        boolean flag = false;
        Connection conn = DB.getConn();
        Statement stm = DB.getStm(conn);
        ResultSet rs = DB.getRs(stm,  "select * from user where username='"+username+"';");
        try {
            if (rs.next())
            {
                flag=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DB.closeRs(rs);
            DB.closeStm(stm);
            DB.closeConn(conn);
        }
        return flag;
    }

    public  static User login(String username, String password)
    {
        User u =null;
        Connection conn = DB.getConn();
        PreparedStatement pstm = DB.getPstm(conn, "select * from user where username = ?");
        ResultSet rs=null;
        try {

            pstm.setString(1, username);

            rs = pstm.executeQuery();
            while (rs.next())
            {
                if (rs.getString("password").equals(password)) {
                    u = new User();
                    u.setId(rs.getInt(1));
                    u.setUsername(rs.getString(2));
                    u.setPassword(rs.getString(3));
                    u.setPhone(rs.getString(4));
                    u.setAddr(rs.getString(5));
                    u.setRdate(rs.getTimestamp(6));
                }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                DB.closeRs(rs);
                DB.closeStm(pstm);
                DB.closeConn(conn);
            }
        return u;
    }

//    public static boolean uinfoModify(int id, String phone, String addr){
//        boolean flag = false;
//        Connection conn = DB.getConn();
//        PreparedStatement pstm = DB.getPstm(conn, "update user set phone=?, addr=? where id=?");
//        try {
//            pstm.setString(1,phone);
//            pstm.setString(2, addr);
//            pstm.setInt(3, id);
//            pstm.executeUpdate();
//            flag = true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DB.closePstm(pstm);
//            DB.closeConn(conn);
//        }
//        return flag;
//    }
//
//    public static boolean upsdModify(int id, String password){
//        boolean flag = false;
//        Connection conn = DB.getConn();
//        PreparedStatement pstm = DB.getPstm(conn, "update user set password=? where id=?");
//        try {
//            pstm.setString(1,password);
//            pstm.setInt(2, id);
//            pstm.executeUpdate();
//            flag = true;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            DB.closePstm(pstm);
//            DB.closeConn(conn);
//        }
//        return flag;
//    }

}
