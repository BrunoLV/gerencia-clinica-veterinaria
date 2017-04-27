<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<html lang="pt">
<head>
    <spring:url value="/resources/js/jquery.min.js" var="jqueryJS"/>
    <spring:url value="/resources/css/bootstrap.min.css" var="bootstrapCSS"/>
    <spring:url value="/resources/js/bootstrap.min.js" var="bootstrapJS"/>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title><tiles:insertAttribute name="title" ignore="true"/></title>

    <script type="text/javascript" src="${jqueryJS}"></script>
    <script type="text/javascript" src="${jQueryDate}"></script>
    <script type="text/javascript" src="${jDateFormat}"></script>
    <link href="${bootstrapCSS}" rel="stylesheet"/>
    <script type="text/javascript" src="${bootstrapJS}"></script>
</head>
<body>

    <div style="width: 100%">
        <tiles:insertAttribute name="header" ignore="false"/>
    </div>
    <div class="container">
    <div style="width: 100%;">
        <tiles:insertAttribute name="body" ignore="false"/>
    </div>
    </div>
    <div id="footer" class="footer" style="width: 100%">
        <tiles:insertAttribute name="footer" ignore="false"/>
    </div>
</body>
</html>