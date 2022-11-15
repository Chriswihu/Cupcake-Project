<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>
        <jsp:invoke fragment="header"/>
    </title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<header>
    <div class="navbar-header">
        <a class="navbar-brand" href="index.jsp">
            <img src="${pageContext.request.contextPath}/images/olskercupcakes.png" width="100%" class="img-fluid"/></a>
    </div>
    <div class="topnav">
        <a class="active" href="${pageContext.request.contextPath}/index.jsp">Hjem</a>
        <a class="nav-item nav-link topnav" href="${pageContext.request.contextPath}/WEB-INF/cupcakes.jsp">Cupcakes</a>
        <a class="nav-item nav-link topnav" href="${pageContext.request.contextPath}/about.jsp">Om os</a>
        <a class="nav-item nav-link topnav" href="${pageContext.request.contextPath}/order.jsp">Bestil Cupcakes!</a>

        <div class="topnav-right">
            <c:if test="${sessionScope.user == null }">

                <a class="nav-item nav-link" style="float: left" href="${pageContext.request.contextPath}/login.jsp">Login</a>
            </c:if>
            <c:if test="${sessionScope.user != null }">
                <a class="nav-item nav-link" href="${pageContext.request.contextPath}/kunde.jsp">Kunde</a>
                <a class="nav-item nav-link" href="${pageContext.request.contextPath}/history.jsp">Ordrer</a>
                <a class="nav-item nav-link" href="${pageContext.request.contextPath}/cart.jsp">Indkøbskurv</a>
                <%--                <button type="button" class="ui-icon-cart" style="float:right">--%>
                <%--                    <span class="glyphicon glyphicon-shopping-cart"></span>Indkøbskurv--%>
                <%--                </button>--%>
                <c:if test="${sessionScope.user.role == 'admin' }">
                    <a class="nav-item nav-link topnav-right" href="${pageContext.request.contextPath}/">Admin</a>
                </c:if>
                <a class="nav-item nav-link topnav-right" href="${pageContext.request.contextPath}/logout">Logout ${sessionScope.user.username}@mail.com</a>


                <%--                <a class="nav-item dropdown topnav-right">--%>
                <%--                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"--%>
                <%--                            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">--%>
                <%--                        Dropdown--%>

                <%--                    </button>--%>

                <%--                    <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">--%>
                <%--                        <a href="#">Link 1</a>--%>
                <%--                        <a href="#">Link 2</a>--%>
                <%--                        <a href="#">Link 3</a>--%>
                <%--                    </div>--%>
                <%--                </a>--%>
            </c:if>
            <%--        </div>--%>
            <%--        <div class="container-fluid">--%>
            <%--            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"--%>
            <%--                    data-bs-target="#navbarNavAltMarkup"--%>
            <%--                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">--%>
            <%--                <span class="navbar-toggler-icon"></span>--%>
            <%--            </button>--%>
            <%--            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">--%>
            <%--                <ul class="navbar-nav ml-auto">--%>
            <%--                    <li class="nav-item">--%>
            <%--                        <a class="nav-link" href="#">Link</a>--%>
            <%--                    </li>--%>
            <%--                    <li class="nav-item dropdown">--%>
            <%--                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button"--%>
            <%--                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
            <%--                            Dropdown--%>
            <%--                        </a>--%>
            <%--                        <div class="dropdown-menu" aria-labelledby="navbarDropdown2">--%>
            <%--                            <a class="dropdown-item" href="#">Action</a>--%>
            <%--                            <a class="dropdown-item" href="#">Another action</a>--%>
            <%--                            <div class="dropdown-divider"></div>--%>
            <%--                            <a class="dropdown-item" href="#">Something else here</a>--%>
            <%--                        </div>--%>
            <%--                    </li>--%>
            <%--                    <li class="nav-item">--%>
            <%--                        <a class="nav-link" href="#">Link</a>--%>
            <%--                    </li>--%>
            <%--                </ul>--%>
            <%--            </div>--%>
            <%--        </div>--%>
            <%--        <div class="collapse navbar-collapse justify-content-between" id="navbarNavAltMarkup">--%>
            <%--        </div>--%>
        </div>
    </div>
</header>

<div id="body" class="container mt-4" style="min-height: 400px;">
    <h1>
        <jsp:invoke fragment="header"/>
    </h1>
    <jsp:doBody/>
</div>

<!-- Footer -->
<div class="container mt-3">
    <hr/>
    <div class="row mt-4">
        <div class="col">
            Nørgaardsvej 30<br/>
            2800 Lyngby
        </div>
        <div class="col">
            <jsp:invoke fragment="footer"/>
            <br/>
            <p>&copy; 2022 Cphbusiness</p>
        </div>
        <div class="col">
            Datamatikeruddannelsen<br/>
            2. semester efterår 2022
        </div>
    </div>

</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>