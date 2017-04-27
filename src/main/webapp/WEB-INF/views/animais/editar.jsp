<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<spring:url value="/animais/editar" var="urlEditar" />
<form:form action="${urlEditar}" modelAttribute="animal" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Edição de Animais</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="id" class="form-label">Id: </form:label>
                        <form:input path="id" cssClass="form-control" readonly="true" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="nome" class="form-label">Nome: </form:label>
                        <form:input path="nome" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="idade" class="form-label">Idade: </form:label>
                        <form:input path="idade" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="raca" class="form-label">Raça: </form:label>
                        <form:input path="raca" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="nomeDono" class="form-label">Nome do dono: </form:label>
                        <form:input path="nomeDono" cssClass="form-control"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <button type="submit" class="btn btn-default">
                <span class="glyphicon glyphicon-floppy-disk" />
            </button>
        </div>
    </div>
</form:form>