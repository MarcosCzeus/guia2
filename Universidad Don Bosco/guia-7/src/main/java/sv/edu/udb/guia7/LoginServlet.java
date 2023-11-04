package sv.edu.udb.guia7;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        // Verificar la autenticación del usuario
        boolean usuarioAutenticado = validarAutenticacion(usuario, contrasena);

        if (usuarioAutenticado) {
            String ocupacion = obtenerOcupacionDelUsuario(usuario);

            if ("Administrador".equals(ocupacion)) {
                // Redirigir a la página de administrador
                response.sendRedirect("admin.jsp");
            } else if ("Profesor".equals(ocupacion)) {
                // Redirigir a la página de profesor
                response.sendRedirect("profesor.jsp");
            } else if ("Estudiante".equals(ocupacion)) {
                // Redirigir a la página de estudiante
                response.sendRedirect("estudiante.jsp");
            } else {
                // Otra ocupación o error; redirigir a la página de error
                response.sendRedirect("error.jsp");
            }
        } else {
            // Autenticación fallida; redirigir a la página de error
            response.sendRedirect("error.jsp");
        }
    }

    // Función para verificar la autenticación
    private boolean validarAutenticacion(String usuario, String contrasena) {
        DataSource dataSource = getDataSource();
        if (dataSource == null) {
            return false;
        }

        try (Connection conexion = dataSource.getConnection()) {
            String sql = "SELECT * FROM persona WHERE usuario = ? AND contrasenia = ?";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setString(1, usuario);
                statement.setString(2, contrasena);
                try (ResultSet resultSet = statement.executeQuery()) {
                    return resultSet.next();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Función para obtener la ocupación del usuario
    private String obtenerOcupacionDelUsuario(String usuario) {
        DataSource dataSource = getDataSource();
        if (dataSource == null) {
            return "Desconocido";
        }

        try (Connection conexion = dataSource.getConnection()) {
            String sql = "SELECT ocupaciones.ocupacion FROM persona " +
                    "INNER JOIN ocupaciones ON persona.id_ocupacion = ocupaciones.id_ocupacion " +
                    "WHERE persona.usuario = ?";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setString(1, usuario);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        return resultSet.getString("ocupacion");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return "Desconocido";
    }

    private DataSource getDataSource() {
        try {
            InitialContext context = new InitialContext();
            return (DataSource) context.lookup("java:comp/env/jdbc/base_gump_shrimp");
        } catch (NamingException e) {
            e.printStackTrace();
            return null;
        }
    }
}
