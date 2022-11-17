<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Velkommen ${sessionScope.user.username} du har rolen ${sessionScope.user.role}
    </jsp:attribute>

    <jsp:attribute name="footer">
        Admin Page
    </jsp:attribute>

    <jsp:body>

        <h3>Her kan du administrere for hele Olsker Cupcakes</h3>
        <p>Indsæt penge, slet ordre og mere</p>
    </jsp:body>

</t:pagetemplate>