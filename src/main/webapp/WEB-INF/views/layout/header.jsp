<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Gerenciador de Veterinaria</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">Animais<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href='<spring:url value="/animais/listar"/>'>Listar</a></li>
                        <li><a href='<spring:url value="/animais/cadastrar"/>'>Cadastrar</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">Médicos<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href='<spring:url value="/medicos/listar"/>'>Listar</a></li>
                        <li><a href='<spring:url value="/medicos/cadastrar"/>'>Cadastrar</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">Prontuarios<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href='<spring:url value="/prontuarios/listar"/>'>Listar</a></li>
                        <li><a href='<spring:url value="/prontuarios/cadastrar"/>'>Cadastrar</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>