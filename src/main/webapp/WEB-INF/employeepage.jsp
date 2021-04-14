<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Demo Page for Employee Roles
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <h1>Hello ${sessionScope.email} </h1>
        <p>You are now logged in as a EMPLOYEE of our wonderful BMI site.</p>

        <p><a href="${pageContext.request.contextPath}/fc/bmientries">Gå til visning af alle BMI resultater</a></p>
        <p><a href="${pageContext.request.contextPath}/fc/managesports">Gå til visning af alle sportsgrene</a></p>
    </jsp:body>
</t:genericpage>
