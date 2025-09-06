/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LAB-USR-LNORTE
 */
@WebServlet(name = "ContactoServlet", urlPatterns = {"/ContactoServlet"})
public class ContactoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ContactoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactoServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirigir al formulario de contacto
        response.sendRedirect("contactenos.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Configurar encoding para caracteres especiales
        request.setCharacterEncoding("UTF-8");
        
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("mensaje");
        String acepto = request.getParameter("acepto");
        
        // Validaciones básicas
        if (nombre == null || nombre.trim().isEmpty()) {
            request.setAttribute("error", "El nombre es obligatorio.");
            request.getRequestDispatcher("contactenos.jsp").forward(request, response);
            return;
        }
        
        if (email == null || email.trim().isEmpty() || !isValidEmail(email)) {
            request.setAttribute("error", "Ingrese un email válido.");
            request.getRequestDispatcher("contactenos.jsp").forward(request, response);
            return;
        }
        
        if (asunto == null || asunto.trim().isEmpty()) {
            request.setAttribute("error", "Seleccione un asunto.");
            request.getRequestDispatcher("contactenos.jsp").forward(request, response);
            return;
        }
        
        if (mensaje == null || mensaje.trim().isEmpty()) {
            request.setAttribute("error", "El mensaje es obligatorio.");
            request.getRequestDispatcher("contactenos.jsp").forward(request, response);
            return;
        }
        
        if (mensaje.length() < 10) {
            request.setAttribute("error", "El mensaje debe tener al menos 10 caracteres.");
            request.getRequestDispatcher("contactenos.jsp").forward(request, response);
            return;
        }
        
        if (acepto == null) {
            request.setAttribute("error", "Debe aceptar el tratamiento de datos personales.");
            request.getRequestDispatcher("contactenos.jsp").forward(request, response);
            return;
        }
        
        // Procesar el mensaje (aquí normalmente se guardaría en BD o se enviaría por email)
        String fechaHora = LocalDateTime.now().format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"));
        
        // Simular procesamiento exitoso
        // En un caso real aquí enviarías email, guardarías en BD, etc.
        
        // Log del mensaje recibido (para pruebas)
        System.out.println("=== NUEVO MENSAJE DE CONTACTO ===");
        System.out.println("Fecha: " + fechaHora);
        System.out.println("Nombre: " + nombre);
        System.out.println("Email: " + email);
        System.out.println("Teléfono: " + (telefono != null ? telefono : "No proporcionado"));
        System.out.println("Asunto: " + asunto);
        System.out.println("Mensaje: " + mensaje);
        System.out.println("================================");
        
        // Generar número de ticket aleatorio
        int numeroTicket = (int) (Math.random() * 900000) + 100000;
        
        // Mensaje de éxito
        String mensajeExito = "¡Mensaje enviado exitosamente! " +
                "Hemos recibido su consulta sobre '" + getAsuntoDescripcion(asunto) + "'. " +
                "Su número de ticket es: #" + numeroTicket + ". " +
                "Le responderemos a la brevedad en el email: " + email;
        
        request.setAttribute("success", mensajeExito);
        request.getRequestDispatcher("contactenos.jsp").forward(request, response);
    }
    
    /**
     * Valida el formato de email
     */
    private boolean isValidEmail(String email) {
        return email.contains("@") && email.contains(".") && email.length() > 5;
    }
    
    /**
     * Obtiene la descripción del asunto
     */
    private String getAsuntoDescripcion(String asunto) {
        switch (asunto) {
            case "soporte_tecnico":
                return "Soporte Técnico";
            case "informacion_general":
                return "Información General";
            case "sugerencias":
                return "Sugerencias";
            case "reclamos":
                return "Reclamos";
            case "otros":
                return "Otros";
            default:
                return asunto;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet para manejar mensajes de contacto";
    }// </editor-fold>

}