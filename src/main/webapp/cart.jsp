<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Din nuværende indkøbskurv
    </jsp:attribute>

    <jsp:attribute name="footer">
        Cart
    </jsp:attribute>

    <jsp:body>

        <h3>Her kan du se din nuværende indkøbskurv</h3>

        <form method="post">
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
                    </tr>
                </c:forEach>
            </table>
        </form>

    </jsp:body>

</t:pagetemplate>