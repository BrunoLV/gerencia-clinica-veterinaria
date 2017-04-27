<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>Listagem de Animais</h1>

<div class="row">
    <div class="col-md-10">
        <div class="form-group">
            <label>Animal a ser pesquisada: </label>
            <input type="text" id="txt-pesquisa" class="form-control">
        </div>
        <button class="btn btn-default" id="btn-pesquisa">Pesquisar</button>
    </div>
</div>

<hr/>

<div class="panel panel-default">
    <div class="panel-heading">
       <h3 class="panel-title">Animais Cadastrados</h3>
    </div>
    <div class="panel-body">
        <table id="tbl-animais" class="table table-hovered table-responsive">
            <thead>
            <th style="text-align: center">Id</th>
            <th style="text-align: center">Nome</th>
            <th style="text-align: center">Idade</th>
            <th style="text-align: center">Raça</th>
            <th style="text-align: center">Dono</th>
            <th style="text-align: center">Ações</th>
            </thead>
            <tbody>
            <c:forEach items="${animais}" var="animal">
                <tr>
                    <td style="text-align: center"><c:out value="${animal.id}"/></td>
                    <td>${animal.nome}</td>
                    <td>${animal.idade}</td>
                    <td>${animal.raca}</td>
                    <td>${animal.nomeDono}</td>
                    <td style="text-align: center">
                        <spring:url value="/animais/editar/{id}" var="urlEditar">
                            <spring:param name="id" value="${animal.id}" />
                        </spring:url>
                        <spring:url value="/animais/excluir/{id}" var="urlExcluir">
                            <spring:param name="id" value="${animal.id}" />
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
        <spring:url value="/animais/cadastrar" var="urlCadastrar" />
        <a href="${urlCadastrar}">
            <span class="glyphicon glyphicon-plus" />
        </a>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#btn-pesquisa').click(function () {
            var nomeAnimal = $('#txt-pesquisa').val();
            $.ajax({
                method: 'GET',
                url: '/GerenciaClinicaVeterinaria/animais/porNome?nome=' + nomeAnimal,
                success: function (data) {
                    $('#tbl-animais tbody > tr').remove();
                    $.each(data, function (index, animal) {
                        $('#tbl-animais tbody').append(
                            '<tr>' +
                            '   <td style="text-align: center">' + animal.id + '</td>' +
                            '   <td>' + animal.nome + '</td>' +
                            '   <td>' + animal.idade + '</td>' +
                            '   <td>' + animal.raca + '</td>' +
                            '   <td>' + animal.nomeDono + '</td>' +
                            '   <td style="text-align: center">' +
                            '       <a class="btn btn-default" href="/GerenciaClinicaVeterinaria/animais/alterar/' + animal.id + '"><span class="glyphicon glyphicon-pencil" /></a>' +
                            '       <a class="btn btn-danger" href="/GerenciaClinicaVeterinaria/animais/excluir/' + animal.id + '"><span class="glyphicon glyphicon-trash" /></a>' +
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