package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.*;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.CupcakeFacade;
import dat.backend.model.persistence.CupcakeMapper;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "addtocart", value = "/addtocart")
public class AddToCart extends HttpServlet
{
    private static ConnectionPool connectionPool;

    @Override
    public  void init() throws ServletException
    {
        connectionPool = ApplicationStart.getConnectionPool();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();

        List<Top> topList;
        List<Bottom> bottomList;
        try {
            topList = CupcakeFacade.getTops(connectionPool);
            bottomList = CupcakeFacade.getBottoms(connectionPool);

            session.setAttribute("topList", topList);
            session.setAttribute("bottomList", bottomList);

            request.getRequestDispatcher("cupcakes.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
//    public static void listMaker(HttpServletRequest request, HttpServletResponse response, ConnectionPool connectionPool) throws ServletException, IOException {
//        try {
//            List<Top> topList = CupcakeFacade.getTops(connectionPool);
//            request.setAttribute("topList", topList);
//
//            List<Bottom> bottomList = CupcakeFacade.getBottoms(connectionPool);
//            request.setAttribute("bottomList", bottomList);
//
//
//            request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new ServletException(e);
//        }
//    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        int topId = Integer.parseInt(request.getParameter("top"));
        int bottomId = Integer.parseInt(request.getParameter("bottom"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Top top = CupcakeFacade.getTopById(topId, connectionPool);
        Bottom bottom = CupcakeFacade.getBottomById(bottomId, connectionPool);

        Cupcake cupcake = new Cupcake(top, bottom, quantity);
        cart.add(cupcake);
        int Sum = 0;

        session.setAttribute("Sum", Sum);
        session.setAttribute("cart", cart);
        session.setAttribute("cartsize", cart.getNumberOfCupcakes());

//        try {
//            session = request.getSession();
//            List<Top> topList = CupcakeFacade.getTops(connectionPool);
//            List<Bottom> bottomList = CupcakeFacade.getBottoms(connectionPool);
//
//            session.setAttribute("topList", topList);
//            session.setAttribute("bottomList", bottomList);
//
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

        request.getRequestDispatcher("order.jsp").forward(request, response);
    }
}
