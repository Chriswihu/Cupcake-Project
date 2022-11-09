<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page errorPage="../error.jsp" isErrorPage="false" %>--%>

<t:pagetemplate>
    <jsp:attribute name="header">
         Køb Cupcakes!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Logged in area
    </jsp:attribute>

    <jsp:body>

        <h3>Køb cupcakes!</h3>

        <form action="addtocart" method="post">
            <select name="bottom">
                <option value="1">Chocolate (5kr)</option>
                <option value="2">Vanilla (6kr)</option>
            </select>
            <select name="top">
                <option value="1">Chocolate (5kr)</option>
                <option value="2">Vanilla (6kr)</option>
            </select>
            <select name="quantity">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
            </select>
            <button name="addToCart">Tilføj til Kurv</button>
        </form>

        <h2>Antal linier i kurven: ${requestScope.cartsize}</h2>

        <h2>Indhold i kurven:</h2>

        <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">
            TopId: ${item.topId} BottomId: ${item.bottomId} Antal: ${item.quantity} <br/>
        </c:forEach>

    </jsp:body>

</t:pagetemplate>