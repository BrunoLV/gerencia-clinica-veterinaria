<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<h1>Listagem de Prontuarios</h1>

<div class="row">
    <div class="col-md-10">
        <div class="form-group">
            <label>Prontuario a ser pesquisado: </label>
            <input type="text" id="txt-pesquisa" class="form-control">
        </div>
        <button class="btn btn-default" id="btn-pesquisa">Pesquisar</button>
    </div>
</div>

<hr/>

<div class="panel panel-default">
    <div class="panel-heading">
       <h3 class="panel-title">Prontuarios Cadastrados</h3>
    </div>
    <div class="panel-body">
        <table id="tbl-prontuarios" class="table table-hovered table-responsive">
            <thead>
            <th style="text-align: center">Id</th>
            <th style="text-align: center">Data atendimento</th>
            <th style="text-align: center">Animal</th>
            <th style="text-align: center">Médico</th>
            <th style="text-align: center">Ações</th>
            </thead>
            <tbody>
            <c:forEach items="${prontuarios}" var="prontuario">
                <tr>
                    <td style="text-align: center"><c:out value="${prontuario.id}"/></td>
                    <td>
                        <fmt:formatDate value="${prontuario.dataAtendimento}" pattern="dd/MM/yyyy" var="data"/>
                        ${data}
                    </td>
                    <td>${prontuario.animal.nome}</td>
                    <td>${prontuario.medico.nome}</td>
                    <td style="text-align: center">
                        <spring:url value="/prontuarios/editar/{id}" var="urlEditar">
                            <spring:param name="id" value="${prontuario.id}" />
                        </spring:url>
                        <spring:url value="/prontuarios/excluir/{id}" var="urlExcluir">
                            <spring:param name="id" value="${prontuario.id}" />
                        </spring:url>
                        <a href="${urlEditar}" class="btn btn-default">
                            <span class="glyphicon glyphicon-pencil" />
                        </a>
                        <a href="${urlExcluir}" class="btn btn-danger">
                            <span class="glyphicon glyphicon-trash" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5">
                        <b>Observação: </b>${prontuario.observacao}
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <spring:url value="/prontuarios/cadastrar" var="urlCadastrar" />
        <a href="${urlCadastrar}">
            <span class="glyphicon glyphicon-plus" />
        </a>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn-pesquisa').click(function () {
            var observacaoProntuario = $('#txt-pesquisa').val();
            $.ajax({
                method: 'GET',
                url: '/GerenciaClinicaVeterinaria/prontuarios/porObservacao?observacao=' + observacaoProntuario,
                success: function (data) {
                    $('#tbl-prontuarios tbody > tr').remove();
                    $.each(data, function (index, prontuario) {
                        $('#tbl-prontuarios tbody').append(
                            '<tr>' +
                            '   <td style="text-align: center">' + prontuario.id + '</td>' +
                            '   <td>' + prontuario.dataAtendimento + '</td>' +
                            '   <td>' + prontuario.animal.nome + '</td>' +
                            '   <td>' + prontuario.medico.nome + '</td>' +
                            '   <td style="text-align: center">' +
                            '       <a class="btn btn-default" href="/GerenciaClinicaVeterinaria/prontuarios/alterar/' + prontuario.id + '"><span class="glyphicon glyphicon-pencil" /></a>' +
                            '       <a class="btn btn-danger" href="/GerenciaClinicaVeterinaria/prontuarios/excluir/' + prontuario.id + '"><span class="glyphicon glyphicon-trash" /></a>' +
                            '   </td>' +
                            '</tr>' +
                            '<tr>' +
                            '   <td colspan="5">' +
                            '       <b>Observação: </b>' + prontuario.observacao +
                            '   </td>' +
                            '</tr>'
                        );
                    });
                },
                error: function () {
                    alert("Houve um erro na requisição.");
                }
            });
        });
    });
</script>