<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Din personlige side
    </jsp:attribute>

    <jsp:attribute name="footer">
        User page
    </jsp:attribute>

    <jsp:body>

        <h3>Her kan du se dine informationer!</h3>

    </jsp:body>

</t:pagetemplate>