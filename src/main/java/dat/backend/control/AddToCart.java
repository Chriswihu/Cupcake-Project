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
public class AddToCart extends HttpServlet {
    private static ConnectionPool connectionPool = ApplicationStart.getConnectionPool();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession session = request.getSession();

        User user =(User) session.getAttribute("user");

        int topId = Integer.parseInt(request.getParameter("top"));
        int bottomId = Integer.parseInt(request.getParameter("bottom"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {

            Top top = CupcakeFacade.getTopById(topId, connectionPool);
            Bottom bottom = CupcakeFacade.getBottomById(bottomId, connectionPool);
            session = request.getSession();


            Cart cart = new Cart();
            Cupcake cupcake = new Cupcake(top, bottom, quantity);
            cart.add(cupcake);
            session.setAttribute("cart", cart);
            request.setAttribute("cartsize", cart.getNumberOfCupcakes());

            List<Top> topList = CupcakeFacade.getTops(connectionPool);
            request.setAttribute("topList", topList);

            List<Bottom> bottomList = CupcakeFacade.getBottoms(connectionPool);
            request.setAttribute("bottomList", bottomList);

            request.getRequestDispatcher("order.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }


//        request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);
    }
}
