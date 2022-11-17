<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
        Velkommen til Olsker Cupcakes!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Index
    </jsp:attribute>

    <jsp:body>

        <p>Tjek vores hjemmeside for vores Lækre vare!</p>

        <c:if test="${sessionScope.user != null}">
            <p>Du er logget ind med: "${sessionScope.user.role}".</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>Du er ikke logget ind. Log ind for at bestille din første Ordre.<a href="login.jsp">Login</a></p>
        </c:if>

        <c:if test="${sessionScope.newuser != null}">
            <p>Welcome new User, take a peak at our services: <a href="login.jsp"></a></p>
        </c:if>

    </jsp:body>

</t:pagetemplate>