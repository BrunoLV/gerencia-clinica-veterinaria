<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>Listagem de Médicos</h1>

<div class="row">
    <div class="col-md-10">
        <div class="form-group">
            <label>Médico a ser pesquisado: </label>
            <input type="text" id="txt-pesquisa" class="form-control">
        </div>
        <button class="btn btn-default" id="btn-pesquisa">Pesquisar</button>
    </div>
</div>

<hr/>

<div class="panel panel-default">
    <div class="panel-heading">
       <h3 class="panel-title">Animais Médicos</h3>
    </div>
    <div class="panel-body">
        <table id="tbl-medicos" class="table table-hovered table-responsive">
            <thead>
            <th style="text-align: center">Id</th>
            <th style="text-align: center">Nome</th>
            <th style="text-align: center">Especialidade</th>
            <th style="text-align: center">Nº Conselho Reginal Veterinária</th>
            <th style="text-align: center">Ações</th>
            </thead>
            <tbody>
            <c:forEach items="${medicos}" var="medico">
                <tr>
                    <td style="text-align: center"><c:out value="${medico.id}"/></td>
                    <td>${medico.nome}</td>
                    <td>${medico.especialidade}</td>
                    <td>${medico.numeroConselhoRegionalVeterinaria}</td>
                    <td style="text-align: center">
                        <spring:url value="/medicos/editar/{id}" var="urlEditar">
                            <spring:param name="id" value="${medico.id}" />
                        </spring:url>
                        <spring:url value="/medicos/excluir/{id}" var="urlExcluir">
                            <spring:param name="id" value="${medico.id}" />
                        </spring:url>
                        <a href="${urlEditar}" class="btn btn-default">
                            <span class="glyphicon glyphicon-pencil" />
                        </a>
                        <a href="${urlExcluir}" class="btn btn-danger">
                            <span class="glyphicon glyphicon-trash" />
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="panel-footer">
        <spring:url value="/medicos/cadastrar" var="urlCadastrar" />
        <a href="${urlCadastrar}">
            <span class="glyphicon glyphicon-plus" />
        </a>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn-pesquisa').click(function () {
            var nomeMedico = $('#txt-pesquisa').val();
            $.ajax({
                method: 'GET',
                url: '/GerenciaClinicaVeterinaria/medicos/porNome?nome=' + nomeMedico,
                success: function (data) {
                    $('#tbl-medicos tbody > tr').remove();
                    $.each(data, function (index, medico) {
                        $('#tbl-medicos tbody').append(
                            '<tr>' +
                            '   <td style="text-align: center">' + medico.id + '</td>' +
                            '   <td>' + medico.nome + '</td>' +
                            '   <td>' + medico.especialidade + '</td>' +
                            '   <td>' + medico.numeroConselhoRegionalVeterinaria + '</td>' +
                            '   <td style="text-align: center">' +
                            '       <a class="btn btn-default" href="/GerenciaClinicaVeterinaria/medicos/alterar/' + medico.id + '"><span class="glyphicon glyphicon-pencil" /></a>' +
                            '       <a class="btn btn-danger" href="/GerenciaClinicaVeterinaria/medicos/excluir/' + medico.id + '"><span class="glyphicon glyphicon-trash" /></a>' +
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