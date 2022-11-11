package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Top;

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
}
