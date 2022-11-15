<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@page errorPage="../error.jsp" isErrorPage="false" %>--%>

<t:pagetemplate>
    <jsp:attribute name="header">
         Se vores muligheder!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Welcome to the frontpage
    </jsp:attribute>

    <jsp:body>

        <h3>Se vores Toppe.</h3>
        <form method="post">
            <table class="table table-striped">
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
                                ${topItem.id}
                        </td>
                        <td>
                                ${topItem.name}
                        </td>
                        <td>
                                ${topItem.price}
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <h3>Se vores bunde.</h3>
            <table class="table table-striped">
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
                                ${bottomItem.id}
                        </td>
                        <td>
                                ${bottomItem.name}
                        </td>
                        <td>
                                ${bottomItem.price}
                        </td>
                    </tr>
                </c:forEach>
            </table>

        </form>
        <p>Der et mange af dem!</p>

    </jsp:body>

</t:pagetemplate>