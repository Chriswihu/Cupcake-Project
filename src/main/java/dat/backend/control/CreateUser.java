package dat.backend.control;

import dat.backend.model.config.ApplicationStart;
import dat.backend.model.entities.User;
import dat.backend.model.exceptions.DatabaseException;
import dat.backend.model.persistence.ConnectionPool;
import dat.backend.model.persistence.UserFacade;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "createuser", value = "/createuser")
public class CreateUser extends HttpServlet
{
    private ConnectionPool connectionPool = ApplicationStart.getConnectionPool();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        response.setContentType("text/html");
        HttpSession session = request.getSession();
        session.setAttribute("newuser", null); // invalidating user object in session scope
        String newusername = request.getParameter("newusername");
        String newpassword = request.getParameter("newpassword");


        try {
            User newUser = UserFacade.createUser(newusername, newpassword, "user", connectionPool);
            session = request.getSession();
            session.setAttribute("user", newUser);

            request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);

        }
        catch (DatabaseException e)
        {
            request.setAttribute("errormessage", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
