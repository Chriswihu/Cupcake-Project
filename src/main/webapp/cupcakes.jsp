<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page errorPage="../error.jsp" isErrorPage="false" %>--%>

<t:pagetemplate>
    <jsp:attribute name="header">
         Se vores muligheder:
    </jsp:attribute>

    <jsp:attribute name="footer">
        Mulige Toppe og Bunde
    </jsp:attribute>

    <jsp:body>

        <h3>Se vores Toppe.</h3>
        <form action="addtocart" method="get">
            <table style="width: 50%" class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Navn</th>
                    <th>Pris</th>
                </tr>
                </thead>
                <c:forEach var="topItem" items="${sessionScope.topList}">
                    <tr>
                        <td>
                            <c:out value="${topItem.id}"/>
                        </td>
                        <td>
                            <c:out value="${topItem.name}"/>
                        </td>
                        <td>
                            <c:out value="${topItem.price},-"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <h3>Se vores bunde.</h3>
            <table style="width: 50%" class="table table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Navn</th>
                    <th>Pris</th>
                </tr>
                </thead>
                <c:forEach var="bottomItem" items="${sessionScope.bottomList}">
                    <tr>
                        <td>
                            <c:out value="${bottomItem.id}"/>
                        </td>
                        <td>
                            <c:out value="${bottomItem.name}"/>
                        </td>
                        <td>
                            <c:out value="${bottomItem.price},-"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </form>
        <p>Der et mange af dem!</p>

    </jsp:body>

</t:pagetemplate>