<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Bestil Cupcakes:
    </jsp:attribute>

    <jsp:attribute name="footer">
        Bestil Cupcakes
    </jsp:attribute>

    <jsp:body>

        <h3>Vælg en Top og Bund, efter eget ønske</h3>

        <form action="addtocart" method="post">
            <label>Vælg en Top:
                <select class="dropdown" name="top">
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
            </label>
            <label>Vælg en Bund:
                <select name="bottom">
                    <c:forEach var="bottomItem" items="${sessionScope.bottomList}">
                        <option value="${bottomItem.id}">${bottomItem.name} (${bottomItem.price},-)</option>
                    </c:forEach>
                        <%--                    <option value="1">Chocolate</option>--%>
                        <%--                    <option value="2">Vanilla</option>--%>
                        <%--                    <option value="3">Nutmeg</option>--%>
                        <%--                    <option value="4">Pistacio</option>--%>
                        <%--                    <option value="5">Almond</option>--%>
                </select>
            </label>
            <label>Vælg antal:
                <select name="quantity">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">10</option>
                </select>
            </label>
            <button class="btn btn-primary" name="addToCart">Tilføj til Kurv
                <c:if test="${sessionScope.cart == null}">

                </c:if>
            </button>
        </form>

        <h2>Antal ordre i kurven: ${sessionScope.cart.numberOfCupcakes}</h2>

        <h2>Indhold i kurven:</h2>

        <%--        <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">--%>
        <%--            Top: ${item.topId.name}, Bund: ${item.bottomId.name}, Antal: ${item.quantity}, Pris: ${item.totalPrice}<br/>--%>
        <%--        </c:forEach>--%>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Top</th>
                <th>Bund</th>
                <th>Antal</th>
                <th>Pris</th>
                <th>Slet</th>
            </tr>
            </thead>
            <c:forEach var="item" items="${sessionScope.cart.cupcakeList}">
                <tr>
                    <td>
                        <c:out value="${item.topId.name}"/>
                    </td>
                    <td>
                        <c:out value="${item.bottomId.name}"/>
                    </td>
                    <td>
                        <c:out value="${item.quantity}"/>
                    </td>
                    <td>
                        <c:out value="${item.totalPrice},-"/>
                    </td>
                    <td>
                        <button class="btn btn-primary">Slet</button>
                    </td>
<%--                    <td>--%>
<%--                        <c:forEach var="sum" items="${item.totalPrice}">--%>
<%--                            <c:out value="${sessionScope.Sum.add(sum)}"/>--%>
<%--                        </c:forEach>--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>
        </table>

        <p class="mt-4"><a class="btn btn-primary" href="order">Bestil</a></p>
        <%--        <table class="table table-striped">--%>
        <%--            <thead>--%>
        <%--            <tr>--%>
        <%--                <th>Top</th>--%>
        <%--                <th>Bund</th>--%>
        <%--                <th>Antal</th>--%>
        <%--                <th>Pris</th>--%>
        <%--                <th>Valg</th>--%>
        <%--            </tr>--%>
        <%--            </thead>--%>
        <%--            <c:forEach var="cartItem" items="${sessionScope.cart}">--%>
        <%--                <tr>--%>
        <%--                    <td>--%>
        <%--                        <c:out value="${cartItem.top}"/>--%>
        <%--                    </td>--%>
        <%--                    <td>--%>
        <%--                        <c:out value="${cartItem.bottom}"/>--%>
        <%--                    </td>--%>
        <%--                    <td>--%>
        <%--                        <c:out value="${cartItem.quantity},-"/>--%>
        <%--                    </td>--%>
        <%--                    <td>--%>
        <%--                        <c:out value="${cartItem.price}"/>--%>
        <%--                    </td>--%>
        <%--                    <script>--%>
        <%--                        function deleteRow(r) {--%>
        <%--                        var i = r.parentNode.parentNode.rowIndex;--%>
        <%--                        document.getElementById("myTable").deleteRow(i);--%>
        <%--                    }</script>--%>
        <%--                    <td>--%>
        <%--                        <button class="btn btn-outline-secondary" value="Delete from cart"--%>
        <%--                                name="deleteFromList" onclick="deleteRow(this)">--%>
        <%--                            Delete--%>
        <%--                        </button>--%>
        <%--                    </td>--%>
        <%--                </tr>--%>
        <%--            </c:forEach>--%>
        <%--        </table>--%>

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


    </jsp:body>

</t:pagetemplate>