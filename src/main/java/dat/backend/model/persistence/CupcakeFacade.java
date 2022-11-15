package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Cart;
import dat.backend.model.entities.Top;
import dat.backend.model.entities.User;

import java.sql.SQLException;
import java.util.List;

public class CupcakeFacade
{
    public static Top getTopById(int topid, ConnectionPool connectionPool)
    {
        return CupcakeMapper.getTopById(topid, connectionPool);
    }

    public static Bottom getBottomById(int bottomid, ConnectionPool connectionPool)
    {
        return CupcakeMapper.getBottomById(bottomid, connectionPool);
    }

    public static List<Top> getTops(ConnectionPool connectionPool) throws SQLException {
        return CupcakeMapper.getTops(connectionPool);
    }

    public static List<Bottom> getBottoms(ConnectionPool connectionPool) throws SQLException {
        return CupcakeMapper.getBottoms(connectionPool);
    }

    public static int createOrder(User user, ConnectionPool connectionPool) {
        return CupcakeMapper.createrOrder(user, connectionPool);
    }

    public static void addToOrderLine(int orderId, Cart cart, ConnectionPool connectionPool) throws SQLException {
        CupcakeMapper.addToOrderLine(orderId, cart, connectionPool);
    }
}
