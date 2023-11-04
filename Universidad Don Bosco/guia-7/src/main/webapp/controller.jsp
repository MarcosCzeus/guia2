<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page import="sv.edu.udb.guia7.AuthUtil" %>
<!DOCTYPE html>
<html>
<head>
    <title>Controlador</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #3498db;
            color: #ffffff;
        }

        .btn-regresar {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .container {
            max-width: 100%;
            padding: 20px;
            background-color: #3498db;
            text-align: center;
        }

        .success-message {
            background-color: #2e86de;
            border: 1px solid #1864ab;
            padding: 20px;
            margin: 20px 0;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .success-message h2 {
            margin: 0 0 20px;
            color: #ffffff;
        }

        .success-message ul {
            list-style: none;
            padding: 0;
        }

        .success-message li {
            margin-bottom: 10px;
        }

        .success-icon {
            color: #28a745;
            font-size: 48px;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<body>
<c:if test="${param.operacion == 'eliminar'}">
    <sql:update var="eliminar" dataSource="jdbc/mysql">
        DELETE FROM personas1 WHERE id_persona = ?
        <sql:param value="${param.id}"/>
    </sql:update>


    <%
        String rol = AuthUtil.obtenerRolDelUsuario();
        if (rol.equals("Administrador")) {
            response.sendRedirect("admin.jsp");
        } else if (rol.equals("Profesor")) {
            response.sendRedirect("profesor.jsp");
        } else if (rol.equals("Estudiante")) {
            response.sendRedirect("estudiante.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    %>
</c:if>

<c:if test="${param.operacion == 'editar'}">
    <c:if test="${not empty param.id and not empty param.nombre}">
        <sql:update dataSource="jdbc/mysql">
            UPDATE personas1 SET
            nombre_persona = ?,
            edad_persona = ?,
            sexo_persona = ?,
            id_ocupacion = ?,
            fecha_nac = ?
            WHERE id_persona = ?
            <sql:param value="${param.nombre}"/>
            <sql:param value="${param.edad}"/>
            <sql:param value="${param.sexo}"/>
            <sql:param value="${param.idocupacion}"/>
            <sql:param value="${param.fecha}"/>
            <sql:param value="${param.id}"/>
        </sql:update>
    </c:if>
    <c:redirect url="formulario.jsp">
        <c:param name="mensaje" value="Cambios guardados exitosamente"/>
    </c:redirect>
</c:if>



<c:if test="${param.operacion == 'insertar'}">
    <c:redirect url="formulario.jsp">
        <c:param name="cabecera" value="Insertar persona"/>
        <c:param name="operacion" value="insertarinf"/>
    </c:redirect>
</c:if>
<c:if test="${param.operacion == 'insertarinf'}">
    <sql:update var="insertar" dataSource="jdbc/mysql">
        INSERT INTO personas1(nombre_persona, edad_persona, sexo_persona, id_ocupacion, fecha_nac) VALUES (?, ? , ?, ? , ?)
        <sql:param value="${param.nombre}"/>
        <sql:param value="${param.edad}"/>
        <sql:param value="${param.sexo}"/>
        <sql:param value="${param.idocupacion}"/>
        <sql:param value="${param.fecha}"/>
    </sql:update>

    <div class="container">
        <div class="success-message">
            <span class="success-icon"><i class="far fa-check-circle"></i></span>
            <h2>Información ingresada exitosamente:</h2>
            <ul>
                <li><strong>Nombre:</strong> ${param.nombre}</li>
                <li><strong>Edad:</strong> ${param.edad}</li>
                <li><strong>Sexo:</strong> ${param.sexo}</li>
                <li><strong>Ocupación:</strong> ${param.idocupacion}</li>
                <li><strong>Fecha de nacimiento:</strong> ${param.fecha}</li>
            </ul>
        </div>
        <!-- Botón para regresar a admin.jsp -->
        <a class="btn btn-regresar" href="admin.jsp">Regresar</a>
    </div>
</c:if>
</body>
</html>
