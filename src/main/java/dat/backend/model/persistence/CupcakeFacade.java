package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Top;

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
}
