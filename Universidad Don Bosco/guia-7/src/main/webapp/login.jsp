<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <title>login</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/estilo.css">
    <script src="js/bootstrap.min.js" ></script>
  </head>
  <body class="container" >
  <img style="width: 70%" src="">
    <div id="login">
      <h1 class="text-center text-white pt-5">Portal UDB</h1>
      <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
          <div id="login-column" class="col-md-6">
            <div id="login-box" class="col-md-12">
              <form id="login-form" class="form" action="GeneraSession" method="post">
                <h3 class="text-center text-info">Login</h3>
                <div class="form-group">
                  <label for="username" class="text-info">Usuario:</label><br>
                  <input type="text" name="usuario" id="username" class="form-control">
                </div>
                <div class="form-group">
                  <label for="password" class="text-info">Password:</label><br>
                  <input type="password" name="password" id="password" class="form-control">
                </div>
                <div class="form-group">
                  <input type="submit" name="operacion" class="btn btn-info btn-md" value="logueo">
                  <input type="hidden" name="operacion"  value="logueo">
                </div>
                <br>
                <div id="register-link" class="text-right">
                  <a style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#exampleModal" class="text-info">Registrese aquí</a>
                </div>
              </form>

              <!-- Button trigger modal -->

              <!-- Modal -->
              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Registro personas</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">X</button>
                    </div>
                    <div class="modal-body">
                      <form id="save-form" class="form" action="RegistrarPersona" method="post">
                        <h3 class="text-center text-info">Registro</h3>
                        <div class="form-group">
                          <label for="nombre" class="text-info">Nombre persona:</label><br>
                          <input type="text" name="nombre" id="nombre" class="form-control" maxlength="60">
                        </div>
                        <div class="form-group">
                          <label for="edad" class="text-info">Edad persona:</label><br>
                          <input type="number" name="edad" id="edad" class="form-control" >
                        </div>
                        <div class="form-group">
                          <label for="sexo" class="text-info">Sexo persona:</label><br>
                          <select class="form-control" name="sexo" id="sexo">
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Femenino">39 tipos de gay</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="ocupacion" class="text-info">Ocupacion persona:</label><br>
                          <select class="form-control" name="ocupacion" id="ocupacion" maxlength="60">
                            <option value="1">Estudiante</option>
                            <option value="2">Profesor</option>
                            <option value="3">Administrador</option>
                          </select>
                        </div>
                        <div class="form-group">
                          <label for="fecha" class="text-info">Fecha nacimiento persona:</label><br>
                          <input type="date" name="fecha" id="fecha" class="form-control">
                        </div>
                        <div class="form-group">
                          <label for="usuario" class="text-info">Usuario:</label><br>
                          <input type="text" name="usuario" id="usuario" class="form-control" maxlength="20">
                        </div>
                        <div class="form-group">
                          <label for="password" class="text-info">Password:</label><br>
                          <input type="password" name="password" id="password" class="form-control" maxlength="20">
                        </div>
                        <div class="form-group">

                        </div>
                        <br>

                      </form>
                    </div>

                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <input type="submit" name="submit" class="btn btn-info btn-md" form="save-form" value="Enviar">
                    </div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

