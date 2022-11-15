package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.Cart;
import dat.backend.model.entities.User;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.CupcakeFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet(name = "order", value = "/order")
public class Order extends HttpServlet
{
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");

        int orderId = CupcakeFacade.createOrder(user, connectionPool);

        try {
            CupcakeFacade.addToOrderLine(orderId, cart, connectionPool);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        cart.resetCart();
        session.setAttribute("cart",cart);

        request.getRequestDispatcher("WEB-INF/confirmation.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {







    }
}
