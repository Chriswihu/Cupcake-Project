package dat.backend.model.persistence;

import dat.backend.model.entities.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CupcakeMapper {

    public static Top getTopById(int topid, ConnectionPool connectionPool) {
        String sql = "SELECT * FROM top WHERE topid = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, topid);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("topid");
                    String name = rs.getString("type");
                    int price = rs.getInt("price");

                    Top newTop = new Top(id, name, price);
                    return newTop;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static Bottom getBottomById(int bottomid, ConnectionPool connectionPool) {
        String sql = "SELECT * FROM bottom WHERE bottomid = ?";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, bottomid);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("bottomid");
                    String name = rs.getString("type");
                    int price = rs.getInt("price");

                    Bottom newBottom = new Bottom(id, name, price);
                    return newBottom;
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    public static List<Top> getTops(ConnectionPool connectionPool) throws SQLException {
        List<Top> topList = new ArrayList<>();
        String sql = "SELECT * FROM top";

        try (Connection connection = connectionPool.getConnection()) {
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("topid");
                    String name = rs.getString("type");
                    int price = rs.getInt("price");

                    Top newTop = new Top(id, name, price);

                    topList.add(newTop);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return topList;
    }

    public static List<Bottom> getBottoms(ConnectionPool connectionPool) throws SQLException
    {
        List<Bottom> bottomList = new ArrayList<>();
        String sql = "SELECT * FROM bottom";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql))
            {
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("bottomid");
                    String name = rs.getString("type");
                    double price = rs.getDouble("price");

                    Bottom bottom = new Bottom(id, name, price);

                    bottomList.add(bottom);
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return bottomList;
    }

    public static int createrOrder(User user, ConnectionPool connectionPool)
    {
        String sql = "INSERT INTO orders (username) VALUES (?)";

        try (Connection connection = connectionPool.getConnection())
        {
            try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS))
            {
                ps.setString(1, user.getUsername());
                ps.executeUpdate();
                ResultSet rs = ps.getGeneratedKeys();
                rs.next();
                return rs.getInt(1);

            } catch (SQLException ex) {
                ex.printStackTrace();

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return 0;
    }


    public static void addToOrderLine(int orderId, Cart cart, ConnectionPool connectionPool) throws SQLException
    {
        String sql = "INSERT INTO orderline (idorder, topid, bottomid, topprice, bottomprice, quantity) VALUES (?,?,?,?,?,?)";

        try (Connection connection = connectionPool.getConnection())
        {
            for (Cupcake cupcake : cart.getCupcakeList()) {
                try (PreparedStatement ps = connection.prepareStatement(sql)) {

                    ps.setInt(1, orderId);
                    ps.setInt(2, cupcake.getTopId().getId());
                    ps.setInt(3, cupcake.getBottomId().getId());
                    ps.setDouble(4, cupcake.getTopId().getPrice());
                    ps.setDouble(5, cupcake.getBottomId().getPrice());
                    ps.setInt(6, cupcake.getQuantity());
                    ps.executeUpdate();
                }
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
