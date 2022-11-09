package dat.backend.control;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Cart;
import dat.backend.model.entities.Cupcake;
import dat.backend.model.entities.Top;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.CupcakeFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addtocart", value = "/addtocart")
public class AddToCart extends HttpServlet
{
    private ConnectionPool connectionPool;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        int topId = Integer.parseInt(request.getParameter("top"));
        int bottomId = Integer.parseInt(request.getParameter("bottom"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Top top = CupcakeFacade.getTopById(topId);
        Bottom bottom = CupcakeFacade.getBottomById(bottomId);

        Cupcake cupcake = new Cupcake(top, bottom, quantity);

        cart.add(cupcake);
        session.setAttribute("cart",cart);
        request.setAttribute("cartsize", cart.getNumberOfCupcakes());

        request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);
    }
}