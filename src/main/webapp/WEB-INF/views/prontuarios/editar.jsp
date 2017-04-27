<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<spring:url value="/prontuarios/editar" var="urlEditar" />
<form:form action="${urlEditar}" modelAttribute="prontuario" method="post">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Edição de Prontuarios</h3>
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
                        <form:label path="dataAtendimento" class="form-label">Data Atendimento: </form:label>
                        <form:input path="dataAtendimento" cssClass="form-control"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Animal: </label>
                        <form:select path="animal.id" cssClass="form-control">
                            <form:options items="${animais}" itemLabel="nome" itemValue="id"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Médico: </label>
                        <form:select path="medico.id" cssClass="form-control">
                            <form:options items="${medicos}" itemLabel="nome" itemValue="id"/>
                        </form:select>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <form:label path="observacao" class="form-label">Observação: </form:label>
                        <form:textarea path="observacao" cssClass="form-control" />
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