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
    <h1 class="text-center">Bienvenido a Bubba Gump Shrimp</h1>
    <h2 class="text-center">
      Bienvenido: (<%=usuario%>) <%=nombres%><br>
    </h2>


    <img src="instituto.jpg" alt="instituto"><br><br><br>
    <h5 class="text-center">Informacion de la Institucion</h5>
    <h5>MISION:</h5>
    <p>Somos una institucion de Educacion Superior con carisma salesiano dedicada a la formacion integral de la persona humana, por medio de la investigacion, la ciencia, la cultura, la tecnologia, la innovacion y el compromiso con la comunidad para la construccion de una sociedad libre, justa y solidaria.</p>

    <h5>VISION:</h5>
    <p>Una universidad salesiana, lider a nivel nacional y referente a nivel regional por su modelo educativo; reconocida por la innovacion curricular; por el desarrollo profesional y la internacionalizacion de sus estudiantes, educadores y personal de gestion; por la ejecucion de proyectos de investigacion, desarrollo e innovacion.</p>

    <h5>MODELO EDUCATIVO</h5>
    <p>El Modelo Educativo es un referente que reune la experiencia educativa, la naturaleza y las tendencias de la Educacion Superior; asi como las opciones de la Iglesia y el contexto con el fin de guiar el hecho educativo.</p>
    <p>La Institucion Bubba Gump Shrimp, capitalizando su experiencia y con base en la vision salesiana de la educacion superior, ha consolidado una identidad diferenciadora al ajustar las funciones de investigacion, docencia y proyeccion social; asi como la gestion, la vinculacion empresarial y otros aspectos, a amplios estandares de calidad que son requeridos no solo por el sector empresarial, sino por la sociedad en su conjunto.</p>
    <p>Aprobado en 2005 reconoce que, partiendo de una Comunidad Educativa Universitaria integrada por todos los que intervienen en el hecho educativo y por medio de fundamentos pedagogicos, modelicos y educativos; tienen lugar las opciones institucionales orientadas a una educacion participativa que articula teoria y practica, que es critica y propositiva, orientada a la busqueda de la verdad y en autoevaluacion permanente para responder al desarrollo humano y social.</p>
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
