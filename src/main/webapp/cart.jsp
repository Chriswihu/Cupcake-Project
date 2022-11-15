<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Din nuværende indkøbskurv!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Indkøbskurv
    </jsp:attribute>

    <jsp:body>

        <h3>Her kan du se din indkøbskurv!</h3>

        <form method="get"></form>

    </jsp:body>

</t:pagetemplate>