<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<spring:url value="/medicos/cadastrar" var="urlCadastrar" />
<form:form action="${urlCadastrar}" modelAttribute="medico" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Cadastro de Médicos</h3>
        </div>
        <div class="panel-body">
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
                        <form:label path="especialidade" class="form-label">Especialidade: </form:label>
                        <form:input path="especialidade" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="numeroConselhoRegionalVeterinaria" class="form-label">Nº Conselho Regional Veterinaria: </form:label>
                        <form:input path="numeroConselhoRegionalVeterinaria" cssClass="form-control"/>
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