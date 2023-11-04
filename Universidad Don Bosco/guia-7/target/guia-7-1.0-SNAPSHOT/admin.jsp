<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <title>Principal</title>
</head>
<body>
<div class="container">
    <h1 class="text-center"> Institución Educativa “Bubba Gump Shrimp - Acceso actual: Administrador</h1>
    <sql:query var="q1" dataSource="jdbc/mysql">
        SELECT * FROM personas1 p INNER JOIN ocupaciones o on p.id_ocupacion = o.id_ocupacion
    </sql:query>
    <a class="btn btn-info" href="controller.jsp?operacion=insertar">Insertar persona</a>
    <br>
    <br>
    <table class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nombres</th>
            <th>Edad</th>
            <th>Sexo</th>
            <th>Ocupacion</th>
            <th>Fecha de nacimiento</th>
            <th>Eliminar</th>
            <th>Modificar</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="personas1" items="${q1.rows}">
            <tr>
                <td>${personas1.id_persona}</td>
                <td>${personas1.nombre_persona}
                </td>
                <td>${personas1.edad_persona}
                </td>
                <td>${personas1.sexo_persona}
                </td>
                <td>${personas1.ocupacion}
                <td>${personas1.fecha_nac}
                </td>
                <td>
                    <button class="btn btn-danger"
                            onclick="alerta('${personas1.id_persona}')">Eliminar</button>
                </td>
                <td>
                    <a class="btn btn-primary text-white" href="controller.jsp?operacion=editar&id=${personas1.id_persona}">Modificar</a>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${not empty param.mensaje}">
        <div class="alert alert-success">
            <strong>Correcto! </strong><c:out value="${param.mensaje}"/>
            <br>
        </div>
    </c:if>
    <script>
        function alerta(id)
        {
            var mensaje;
            var opcion = confirm("Esta seguro de eliminar este registro");
            if (opcion == true) {
                location.href ="controller.jsp?operacion=eliminar&id="+id;
            }
        }
    </script>
</div>
</body>
</html>