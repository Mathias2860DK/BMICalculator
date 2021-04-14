<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:genericpage>
    <jsp:attribute name="header">
         Demo Page for Customer Roles
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>

    <jsp:body>
        <h1>Hej ${sessionScope.email} </h1>
        You are now logged in as a Customer of our wonderful site.

        <p>Er du klar til at beregne dit BMI?</p>
        <p>Hop ud på <a href="${pageContext.request.contextPath}">Forsiden</a> og gå i gang </p>
        <h3>Vil du se alle dine gamle registreringer</h3>
        <p><a href="${pageContext.request.contextPath}/fc/mybmientries">Se liste ed gamle BMI målinger</a> </p>
    </jsp:body>

</t:genericpage>

