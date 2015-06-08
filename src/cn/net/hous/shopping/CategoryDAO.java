package cn.net.hous.shopping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 * Created by ˧ on 2015/6/7.
 */
public class CategoryDAO {

    public static void sava(Category ctg)
    {
        Connection conn = DB.getConn();
        PreparedStatement pstm = DB.getPstm(conn, "insert into category values(?, ?, ?, ?, ?, ?)");
        try {
            pstm.setInt(1,ctg.getId());
            pstm.setString(2, ctg.getName());
            pstm.setString(3, ctg.getDescr());
            pstm.setInt(4, ctg.getPid());
            pstm.setInt(5, ctg.isLeaf()?0:1);
            pstm.setInt(6, ctg.getGrade());
            pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DB.closePstm(pstm);
            DB.closeConn(conn);
        }

    }
}
