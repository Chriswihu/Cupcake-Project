<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Bestil Cupcakes!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Bestil Cupcakes
    </jsp:attribute>

    <jsp:body>

        <h3>Køb cupcakes!</h3>

            <form action="addtocart" method="post">
                <select name="bottom">Vælg en Bund
                    <c:forEach var="bottomItem" items="${sessionScope.bottomList}">
                        <option value="${bottomItem.id}">${bottomItem.name} (${bottomItem.price},-)</option>
                    </c:forEach>
<%--                    <option value="1">Chocolate</option>--%>
<%--                    <option value="2">Vanilla</option>--%>
<%--                    <option value="3">Nutmeg</option>--%>
<%--                    <option value="4">Pistacio</option>--%>
<%--                    <option value="5">Almond</option>--%>
                </select>
                <select name="top">Vælg en Top
                    <c:forEach var="topItem" items="${sessionScope.topList}">
                        <option value="${topItem.id}">${topItem.name} (${topItem.price},-)</option>
                    </c:forEach>
<%--                    <option value="1">Chocolate</option>--%>
<%--                    <option value="2">Blueberry</option>--%>
<%--                    <option value="3">Rasberry</option>--%>
<%--                    <option value="4">Crispy</option>--%>
<%--                    <option value="5">Strawberry</option>--%>
<%--                    <option value="6">Rum/raisin</option>--%>
<%--                    <option value="7">Orange</option>--%>
<%--                    <option value="8">Lemon</option>--%>
<%--                    <option value="9">Blue Cheese</option>--%>
                </select>
                <select name="quantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">10</option>
                </select>
                <button class="btn btn-primary" name="addToCart">Tilføj til Kurv</button>
            </form>

            <h2>Antal linier i kurven: ${requestScope.cartsize}</h2>

            <h2>Indhold i kurven:</h2>

            <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">
                Bund: ${item.topId.name}, Top: ${item.bottomId.name}, Antal: ${item.quantity}<br/>
            </c:forEach>
                <%--        <table class="table table-striped" style="width:100%">--%>
                <%--        <thead>--%>
                <%--        <tr>--%>
                <%--            <th>Top</th>--%>
                <%--            <th>Bund</th>--%>
                <%--            <th>Antal</th>--%>
                <%--            <th>Pris</th>--%>
                <%--        </tr>--%>
                <%--        </thead>--%>

                <%--        <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">--%>
                <%--            <tr>--%>
                <%--                <td>--%>
                <%--                        ${item.topId.name}--%>
                <%--                </td>--%>
                <%--                <td>--%>
                <%--                        ${item.bottomId.name}--%>
                <%--                </td>--%>
                <%--                <td>--%>
                <%--                        ${item.quantity}--%>
                <%--                </td>--%>
                <%--                <td>--%>
                <%--                        ${(item.bottomId.price + item.topId.price) * item.quantity}--%>
                <%--                </td>--%>

                <%--            </tr>--%>
                <%--            <br/>--%>
                <%--        </c:forEach>--%>

            <p class="mt-4"><a class="btn btn-primary" href="order">Bestil</a></p>



    </jsp:body>

</t:pagetemplate>