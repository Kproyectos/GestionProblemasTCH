<%-- 
    Document   : listaProblemas
    Created on : Feb 6, 2017, 9:41:06 AM
    Author     : k.zambrano.torres
--%>

<%@page import="core.Problema"%>
<%@page import="dao.DaoProblema"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>GestionProblemas</title>
        <%
            DaoProblema daoProblema = new DaoProblema();
        %>
        <link rel="stylesheet" href="../css/bootstrap.css">
    </head>
    <body>
        
        <nav class="navbar navbar-default" role="navigation">
            <!-- El logotipo y el icono que despliega el menú se agrupan
                 para mostrarlos mejor en los dispositivos móviles -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Desplegar navegación</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="../index.html">Inicio</a>
            </div>

            <!-- Agrupar los enlaces de navegación, los formularios y cualquier
                 otro elemento que se pueda ocultar al minimizar la barra -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="agregarProblema.jsp">AgregarProblema</a></li>
                    <li><a href="listaProblemas.jsp">Ver Problemas</a></li>
                    <!-- <li class="dropdown">
                         <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                             Menú #1 <b class="caret"></b>
                         </a>
                         <ul class="dropdown-menu">
                             <li><a href="#">Acción #1</a></li>
                             <li><a href="#">Acción #2</a></li>
                             <li><a href="#">Acción #3</a></li>
                             <li class="divider"></li>
                             <li><a href="#">Acción #4</a></li>
                             <li class="divider"></li>
                             <li><a href="#">Acción #5</a></li>
                         </ul>
                     </li>-->
                </ul>

                <form class="navbar-form navbar-left" role="search" action="../ServletBuscarProblema" method="get">
                    <div class="form-group">
                        <input type="text" name="buscarPorID" class="form-control" placeholder="Ingresar ID problema...">
                    </div>
                    <button type="submit" class="btn btn-default">Buscar</button>
                </form>

                <!--<ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Enlace #3</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Menú #2 <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Acción #1</a></li>
                            <li><a href="#">Acción #2</a></li>
                            <li><a href="#">Acción #3</a></li>
                            <li class="divider"></li>
                            <li><a href="#">Acción #4</a></li>
                        </ul>
                -->
                </li>
                </ul>
            </div>
        </nav>
        <br>
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="../index.html">Inicio</a></li>
                <li class="active">Lista de problemas</li>
            </ol>
        </div>
        <br>
        <div class="col-md-12">
            <h4>Cantidad de problemas bajo investigacion: <%=daoProblema.problemasBajoInvestigacion()%></h4>
            <h4>Cantidad de problemas en revisión: <%=daoProblema.problemasEnRevision()%></h4>
            <h4>Total de problemas: <%=daoProblema.totalProblemas()%></h4>
            
        </div>
        <br>
        <div class="table-responsive col-md-12 col-xs-12">
            <table class="table table-hover">
                <thead>
                <th>ID Problema</th>
                <th>Estado</th>
                <th>Rsumen</th>
                <th>Grupo Asignado</th>
                <th>Usuario Asignado</th>
                <th>Fecha de Envio</th>
                <th>Fecha deseada</th>
                <th>Prioridad</th>
                <th>Fecha Ultima Modificacion</th>
                <th>Opciones</th>
                </thead>
                <tbody>
                    <%
                        for (Problema elem : daoProblema.lista()) {
                    %>
                    <tr>
                        <td><a href="detallePBI.jsp?id=<%=elem.getIdProblema()%>">PBI0000000<%=elem.getIdProblema()%></a></td>
                        <td><%=elem.getEstado()%></td>
                        <td><%=elem.getResumen()%></td>
                        <td><%=elem.getGrupoAsignado()%></td>
                        <td><%=elem.getUsuarioAsignado()%></td>
                        <td><%=elem.getFechaEnvio()%></td>
                        <td><%=elem.getFechaDeseada()%></td>
                        <td><%=elem.getPrioridad()%></td>
                        <td><%=elem.getFechaUltimaModificacion()%></td>
                        <td><button class="btn btn-danger" onclick="location = '../ServletEliminarProblema?id=<%=elem.getIdProblema()%>'" value="Eliminar">Eliminar</button>
                            <button class="btn btn-success" onclick="location = 'modificarProblema.jsp?id=<%=elem.getIdProblema()%>'" value="Modificar">Modificar </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>
