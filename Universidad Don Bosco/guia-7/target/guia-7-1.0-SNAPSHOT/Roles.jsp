<!DOCTYPE html>
<html>
<head>
    <title>Seleccione su Rol:</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            font-size: 28px;
            margin-top: 40px;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 80vh;
        }
        .button {
            margin: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            font-size: 18px;
            transition: background-color 0.3s;
            width: 200px;
        }
        #adminButton {
            background-color: #ff0000;
        }
        #adminButton:hover {
            background-color: #cc0000;
        }
        #profesorButton {
            background-color: #00ff00;
        }
        #profesorButton:hover {
            background-color: #00cc00;
        }
        #estudianteButton {
            background-color: #0000ff;
        }
        #estudianteButton:hover {
            background-color: #0000cc;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Que tipo de Rol eres</h1>
    <button class="button" id="adminButton">Administrador</button>
    <button class="button" id="profesorButton">Profesor</button>
    <button class="button" id="estudianteButton">Estudiante</button>
</div>

<script>
    document.getElementById("adminButton").addEventListener("click", function () {
        window.location.href = "admin.jsp";
    });

    document.getElementById("profesorButton").addEventListener("click", function () {
        window.location.href = "profesor.jsp";
    });

    document.getElementById("estudianteButton").addEventListener("click", function () {
        window.location.href = "estudiante.jsp";
    });
</script>
</body>
</html>
