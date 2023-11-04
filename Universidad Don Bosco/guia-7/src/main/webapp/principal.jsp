<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
  HttpSession session_actual= request.getSession(false);
  String usuario =(String) session_actual.getAttribute("USER");
  String nombres =(String) session_actual.getAttribute("NAME");

  if (usuario==null){
    response.sendRedirect("login.jsp");
  }
%>
<html lang="es">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Bienvenido <%=nombres%></title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilo.css">
    <link rel="stylesheet" href="css/Style.css">
    <script src="js/bootstrap.min.js" ></script>

    <style>
      img {
        display: block;
        margin: 0 auto;
      }
    </style>
  </head>
  <body class="container">
    <h1 class="text-center">Bienvenido a Universidad Don Bosco</h1>
    <h2 class="text-center">
      Bienvenido: (<%=usuario%>) <%=nombres%><br>
    </h2>


    <img src="instituto.jpg" alt="instituto"><br><br><br>
    <h5 class="text-center">Informacion de la Institucion</h5>
    <h5>MISION:</h5>
    <p>"Nuestra misión es proporcionar una educación de calidad y accesible que empodere a los estudiantes para alcanzar su máximo potencial académico, personal y profesional. Estamos comprometidos a fomentar el aprendizaje a lo largo de toda la vida, la innovación y la inclusión, preparando a los estudiantes para ser ciudadanos globales que contribuyan positivamente a la sociedad."</p>

    <h5>VISION:</h5>
    <p>"Nuestra visión es ser una institución líder en la educación que inspire la excelencia, la creatividad y el pensamiento crítico. Buscamos ser reconocidos por nuestro compromiso con la innovación educativa, la diversidad y la sostenibilidad. Queremos ser un lugar donde los estudiantes encuentren un ambiente de apoyo, desafío y crecimiento, y donde los graduados sean líderes que marquen la diferencia en sus comunidades y en el mundo."</p>

    <h5>MODELO EDUCATIVO</h5>
    <p>Aprendizaje Centrado en el Estudiante: Ponemos al estudiante en el centro de su propio proceso de aprendizaje, adaptando la educación a sus necesidades, intereses y habilidades individuales.</p>
    <p>Enfoque Interdisciplinario: Fomentamos la interdisciplinariedad y la integración del conocimiento, permitiendo a los estudiantes abordar problemas complejos desde múltiples perspectivas.</p>
    <p>Innovación y Tecnología: Utilizamos tecnologías educativas avanzadas para enriquecer la enseñanza y el aprendizaje, promoviendo la creatividad y la resolución de problemas.</p>
    <br>
    <p>Entre los programas institucionales que materializan los planteamientos del modelo estan:</p>

    <ul>
      <li>Asesorias academicas.</li>
      <li>Programa de Tutoria Estudiantil.</li>
      <li>Seguimiento a graduados.</li>
      <li>Practicas profesionales.</li>
      <li>Servicio Social Estudiantil.</li>
      <li>Desarrollo profesional de docentes y administrativos</li>
      <li>Propuestas de programas de maestrias que responden a las necesidades del sector profesional pero tambien buscan el desarrollo cientifico, profesional y personal de docentes y administrativos, entre otros.</li>
    </ul>






    <form method="post" action="GeneraSession" style="text-align: center;">
      <input type="hidden" value="salir" name="operacion">
      <input type="submit" value="Cerrar session" class="btn btn-success">
    </form>

    <form method="post" action="Roles.jsp" style="text-align: center;">
      <input type="submit" value="Seleccione Rol" class="btn btn-success btn-grande">
    </form>







  </body>

  <footer class="mi-footer">
    <h5>Intregrantes del Trabajo:</h5>
    <ul>
      <li>Dania Gorety Campos Tejada</li>
      <li>Katherine Yamileth Flores Avila</li>
      <li>Rolando Ezequiel Sanchez Campos</li>
      <li>Cristian Ricardo Gonzalez Gonzalez</li>
    </ul>
  </footer>

</html>
