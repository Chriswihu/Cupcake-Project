<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Du er logget ind!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Logged in area
    </jsp:attribute>

    <jsp:body>

        <h2>Welcome ${sessionScope.user.username}, your role is ${sessionScope.user.role}</h2>
        <h3>Køb cupcakes!</h3>

<%--        <form method="post">--%>
<%--            <form action="addtocart" method="post">--%>
<%--                <select name="bottom">--%>
<%--                    <c:forEach var="bottom" items="${requestScope.bottomList}">--%>
<%--                        <option value="${bottom.id}">${bottom.name} (${bottom.price},-)</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--                <select name="top">--%>
<%--                    <c:forEach var="top" items="${requestScope.topList}">--%>
<%--                        <option value="${top.id}">${top.name} (${top.price},-)</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--                <select name="quantity">--%>
<%--                    <option value="1">1</option>--%>
<%--                    <option value="2">2</option>--%>
<%--                    <option value="3">3</option>--%>
<%--                    <option value="4">4</option>--%>
<%--                    <option value="5">5</option>--%>
<%--                    <option value="6">10</option>--%>
<%--                </select>--%>
<%--                <button name="addToCart">Tilføj til Kurv</button>--%>
<%--            </form>--%>

<%--            <h2>Antal linier i kurven: ${requestScope.cartsize}</h2>--%>

<%--            <h2>Indhold i kurven:</h2>--%>
<%--        </form>--%>
        <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">
            TopId: ${item.topId.name} BottomId: ${item.bottomId.name} Antal: ${item.quantity} <br/>
        </c:forEach>

    </jsp:body>

</t:pagetemplate>