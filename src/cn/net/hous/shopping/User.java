package cn.net.hous.shopping;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by ˧ on 2015/6/4.
 */
public class User {
    private int id;
    private String username = "";
    private String password = "";
    private String phone = "";
    private String addr = "";
    private Date rdate;
    private Map<String, String> errors = new HashMap<>();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }

    public void sava()
    {
        Connection conn = DB.getConn();
        PreparedStatement pstm = DB.getPstm(conn, "insert into user values(null, ?, ?, ?, ?, ?)");
        try {
            pstm.setString(1, username);
            pstm.setString(2, password);
            pstm.setString(3, phone);
            pstm.setString(4, addr);
            pstm.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closePstm(pstm);
            DB.closeConn(conn);
            }

    }

    public void putErr(String key, String value)
    {
        errors.put(key, value);
    }

    public String getErr(String key){

        if(errors.get(key)==null)
        {
            return "";
        }
        else
            return errors.get(key);
    }

    public static boolean check(User user)
    {

        boolean flag = true;

        if (! user.getUsername().matches("\\w{6,12}")) {
            user.putErr("usmErr", "please input 6~12 words.");
            flag = false;
            user.setUsername("");
        }

        if (! user.getPassword().matches("\\w{6,12}")){
            user.putErr("pswErr", "please input 6~12 words.");
            flag = false;
            user.setPassword("");
        }

       return flag;
    }

    public boolean update()
    {
        boolean flag = false;
        Connection conn = DB.getConn();
        PreparedStatement pstm = DB.getPstm(conn, "update user set password=?, phone=?, addr=? where id=?;");
        try {
            pstm.setString(1, password);
            pstm.setString(2, phone);
            pstm.setString(3, addr);
            pstm.setInt(4, id);
            pstm.executeUpdate();
            flag = true;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closePstm(pstm);
            DB.closeConn(conn);
        }

        return flag;
    }

}
