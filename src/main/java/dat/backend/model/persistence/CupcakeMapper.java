package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Top;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
}
