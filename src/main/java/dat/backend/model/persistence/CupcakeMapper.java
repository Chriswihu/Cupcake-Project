package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Top;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CupcakeMapper 
{

    public static Top getTopById(int topid, ConnectionPool connectionPool)
    {
        String sql = "SELECT * FROM top WHERE topid = ?";

        try(Connection connection = connectionPool.getConnection())
        {
            try(PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, topid);
                ResultSet rs = ps.executeQuery();
                if(rs.next())
                {
                    int id = rs.getInt("topid");
                    String name = rs.getString("type");
                    int price = rs.getInt("price");

                    Top newTop = new Top(id, name, price);
                    return newTop;
                }
            }
            catch (SQLException e)
            {
                e.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static Bottom getBottomById(int bottomid, ConnectionPool connectionPool)
    {
        String sql = "SELECT * FROM bottom WHERE bottomid = ?";

        try(Connection connection = connectionPool.getConnection())
        {
            try(PreparedStatement ps = connection.prepareStatement(sql))
            {
                ps.setInt(1, bottomid);
                ResultSet rs =ps.executeQuery();
                if(rs.next())
                {
                    int id = rs.getInt("bottomid");
                    String name = rs.getString("type");
                    int price = rs.getInt("price");

                    Bottom newBottom = new Bottom(id, name, price);
                    return newBottom;
                }

            }
            catch (SQLException e)
                {
                    e.printStackTrace();
                }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    static List<Top> getTops(ConnectionPool connectionPool) throws SQLException {
        String sql = "SELECT * FROM top ORDER BY topid";

        List<Top> topList = new ArrayList<>();

        try(Connection connection = connectionPool.getConnection())
        {
            try(PreparedStatement ps = connection.prepareStatement(sql))
            {
                ResultSet result = ps.executeQuery();

                while (result.next())
                {
                    int id = result.getInt("topid");
                    String name = result.getString("type");
                    int price = result.getInt("price");

                    Top top = new Top(id, name, price);

                    topList.add(top);
                }
            }
            catch (SQLException ex) {
                ex.printStackTrace();
                throw ex;
            }
        }
        return topList;
    }

    static List<Bottom> getBottoms(ConnectionPool connectionPool) throws SQLException {
        String sql = "SELECT * FROM bottom ORDER BY bottomid";

        List<Bottom> bottomList = new ArrayList<>();

        try(Connection connection = connectionPool.getConnection())
        {
            try(PreparedStatement ps = connection.prepareStatement(sql))
            {
                ResultSet result = ps.executeQuery();

                while (result.next())
                {
                    int id = result.getInt("bottomid");
                    String name = result.getString("type");
                    int price = result.getInt("price");

                    Bottom bottom = new Bottom(id, name, price);

                    bottomList.add(bottom);
                }
            }
            catch (SQLException ex) {
                ex.printStackTrace();
                throw ex;
            }
        }
        return bottomList;
    }
}
