<%-- 
    Document   : index
    Created on : 18 ago. 2025, mejorado con layout modular
    Author     : LAB-USR-LNORTE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Configurar variables para el layout
    request.setAttribute("pageTitle", "Inicio - Sistema Web");
    request.setAttribute("currentPage", "index");
    request.setAttribute("showBreadcrumb", false);
%>

<%-- Incluir header ---%>
<%@include file="includes/header.jsp" %>

<!-- Sección Hero -->
<div class="hero-section">
    <div class="hero-content">
        <h1>Bienvenido al Sistema Web</h1>
        <p class="hero-subtitle">Plataforma integral de gestión con tecnología moderna y segura</p>
        
        <!-- Verificar si ya está logueado -->
        <% 
        // Usar las variables ya declaradas en header.jsp
        if (usuario != null) { %>
            <div class="welcome-back">
                <h2>¡Hola de nuevo, <%= usuario %>!</h2>
                <p>Tu sesión está activa. Accede a tu dashboard para continuar.</p>
                <a href="dashboard.jsp" class="btn btn-primary btn-large">
                    Ir al Dashboard
                </a>
            </div>
        <% } else { %>
            <!-- Formulario de login -->
            <div class="login-container">
                <div class="login-form">
                    <h2>Iniciar Sesión</h2>
                    <p class="login-subtitle">Accede a tu cuenta para comenzar</p>
                    
                    <form action="LoginServlet" method="POST" onsubmit="return validarLogin(this)">
                        <div class="form-group">
                            <label for="username">Usuario:</label>
                            <input type="text" id="username" name="username" required 
                                   placeholder="Ingrese su nombre de usuario"
                                   autocomplete="username">
                        </div>
                        
                        <div class="form-group">
                            <label for="password">Contraseña:</label>
                            <input type="password" id="password" name="password" required 
                                   placeholder="Ingrese su contraseña"
                                   autocomplete="current-password">
                        </div>
                        
                        <div class="form-group form-options">
                            <label class="checkbox-label">
                                <input type="checkbox" id="remember" name="remember">
                                <span class="checkmark"></span>
                                Recordar credenciales
                            </label>
                        </div>
                        
                        <button type="submit" class="btn btn-primary btn-large">
                            Ingresar al Sistema
                        </button>
                        
                        <!-- Mostrar errores si los hay -->
                        <% if (request.getAttribute("error") != null) { %>
                            <div class="alert alert-error">
                                <strong>Error:</strong> <%= request.getAttribute("error") %>
                            </div>
                        <% } %>
                    </form>
                    
                    <!-- Información de ayuda -->
                    <div class="login-help">
                        <h4>¿Necesitas ayuda?</h4>
                        <p>Si tienes problemas para acceder:</p>
                        <ul>
                            <li><a href="contactenos.jsp">Contacta al soporte técnico</a></li>
                            <li><a href="preguntas-frecuentes.jsp">Revisa las preguntas frecuentes</a></li>
                            <li>Llama al (01) 626-2000</li>
                        </ul>
                    </div>
                </div>
                
                <!-- Panel informativo -->
                <div class="info-panel">
                    <h3>Credenciales de Prueba</h3>
                    <div class="test-credentials">
                        <p><strong>Usuario:</strong> Chicana</p>
                        <p><strong>Contraseña:</strong> 123</p>
                        <small>Utiliza estas credenciales para probar el sistema</small>
                    </div>
                    
                    <div class="system-features">
                        <h4>Características del Sistema</h4>
                        <ul>
                            <li>✅ Dashboard personalizado</li>
                            <li>✅ Sistema de preguntas frecuentes</li>
                            <li>✅ Formulario de contacto</li>
                            <li>🔄 Libro de reclamaciones (próximamente)</li>
                        </ul>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

<!-- Sección de características públicas -->
<div class="public-features">
    <h2>Funcionalidades Disponibles</h2>
    <div class="features-grid">
        <div class="feature-card">
            <div class="feature-icon">❓</div>
            <h3>Preguntas Frecuentes</h3>
            <p>Encuentra respuestas rápidas a las consultas más comunes sobre nuestro sistema.</p>
            <a href="preguntas-frecuentes.jsp" class="btn btn-secondary">Ver FAQ</a>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">📍</div>
            <h3>Contáctenos</h3>
            <p>Ponte en contacto con nuestro equipo de soporte para cualquier consulta o asistencia.</p>
            <a href="contactenos.jsp" class="btn btn-secondary">Contactar</a>
        </div>
        
        <div class="feature-card">
            <div class="feature-icon">🔐</div>
            <h3>Acceso Seguro</h3>
            <p>Nuestro sistema utiliza protocolos de seguridad modernos para proteger tu información.</p>
            <button class="btn btn-secondary" onclick="mostrarAlerta('Sistema protegido con autenticación por sesión y validaciones de seguridad.', 'info')">
                Más Info
            </button>
        </div>
    </div>
</div>

<style>
    /* Estilos específicos para la página de inicio */
    .hero-section {
        background: linear-gradient(135deg, rgba(0,123,255,0.1), rgba(0,86,179,0.05));
        border-radius: 12px;
        padding: 40px;
        margin-bottom: 40px;
        text-align: center;
    }
    
    .hero-content h1 {
        font-size: 2.5rem;
        color: #2c3e50;
        margin-bottom: 10px;
    }
    
    .hero-subtitle {
        font-size: 1.2rem;
        color: #6c757d;
        margin-bottom: 30px;
    }
    
    .welcome-back {
        background: linear-gradient(135deg, #28a745, #20c997);
        color: white;
        padding: 30px;
        border-radius: 12px;
        margin: 20px auto;
        max-width: 600px;
    }
    
    .welcome-back h2 {
        margin-bottom: 10px;
    }
    
    .login-container {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 40px;
        margin-top: 30px;
        align-items: start;
    }
    
    .login-form {
        background: white;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        border: 2px solid #e9ecef;
    }
    
    .login-form h2 {
        color: #2c3e50;
        margin-bottom: 8px;
        text-align: center;
    }
    
    .login-subtitle {
        text-align: center;
        color: #6c757d;
        margin-bottom: 30px;
    }
    
    .form-options {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin: 20px 0;
    }
    
    .checkbox-label {
        display: flex;
        align-items: center;
        cursor: pointer;
        font-size: 0.9rem;
    }
    
    .checkbox-label input[type="checkbox"] {
        margin-right: 8px;
        width: auto;
    }
    
    .btn-large {
        width: 100%;
        padding: 15px;
        font-size: 1.1rem;
        margin-top: 10px;
    }
    
    .login-help {
        margin-top: 30px;
        padding: 20px;
        background-color: #f8f9fa;
        border-radius: 8px;
        border-left: 4px solid #17a2b8;
    }
    
    .login-help h4 {
        color: #17a2b8;
        margin-bottom: 10px;
    }
    
    .login-help ul {
        margin: 10px 0;
        padding-left: 20px;
    }
    
    .login-help li {
        margin-bottom: 5px;
    }
    
    .info-panel {
        background: linear-gradient(135deg, #f8f9fa, #e9ecef);
        padding: 30px;
        border-radius: 12px;
        border: 2px solid #dee2e6;
    }
    
    .info-panel h3 {
        color: #495057;
        margin-bottom: 20px;
        text-align: center;
    }
    
    .test-credentials {
        background: #fff3cd;
        padding: 20px;
        border-radius: 8px;
        margin-bottom: 25px;
        border: 1px solid #ffeaa7;
        text-align: center;
    }
    
    .test-credentials p {
        margin: 5px 0;
        font-size: 1.1rem;
    }
    
    .test-credentials small {
        color: #856404;
        font-style: italic;
    }
    
    .system-features {
        background: white;
        padding: 20px;
        border-radius: 8px;
        border: 2px solid #dee2e6;
    }
    
    .system-features h4 {
        color: #495057;
        margin-bottom: 15px;
    }
    
    .system-features ul {
        list-style: none;
        padding: 0;
    }
    
    .system-features li {
        padding: 8px 0;
        border-bottom: 1px solid #f8f9fa;
    }
    
    .public-features {
        margin-top: 50px;
        text-align: center;
    }
    
    .public-features h2 {
        color: #2c3e50;
        margin-bottom: 30px;
        font-size: 2rem;
    }
    
    .features-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 30px;
        margin-top: 40px;
    }
    
    .feature-card {
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        border: 2px solid #f8f9fa;
        transition: all 0.3s ease;
        text-align: center;
    }
    
    .feature-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        border-color: #007bff;
    }
    
    .feature-icon {
        font-size: 3rem;
        margin-bottom: 20px;
        display: block;
    }
    
    .feature-card h3 {
        color: #2c3e50;
        margin-bottom: 15px;
    }
    
    .feature-card p {
        color: #6c757d;
        line-height: 1.6;
        margin-bottom: 20px;
    }
    
    /* Responsive */
    @media (max-width: 768px) {
        .hero-content h1 {
            font-size: 2rem;
        }
        
        .login-container {
            grid-template-columns: 1fr;
            gap: 30px;
        }
        
        .login-form, .info-panel {
            padding: 25px;
        }
        
        .features-grid {
            grid-template-columns: 1fr;
            gap: 20px;
        }
        
        .feature-card {
            padding: 25px;
        }
    }
</style>

<script>
    // Validación del formulario de login
    function validarLogin(form) {
        const username = form.username.value.trim();
        const password = form.password.value.trim();
        
        if (!username) {
            mostrarAlerta('Por favor, ingrese su nombre de usuario.', 'error');
            form.username.focus();
            return false;
        }
        
        if (!password) {
            mostrarAlerta('Por favor, ingrese su contraseña.', 'error');
            form.password.focus();
            return false;
        }
        
        // Mostrar indicador de carga
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.textContent;
        submitBtn.textContent = 'Iniciando sesión...';
        submitBtn.disabled = true;
        
        // Restaurar botón si hay error (esto se hace en caso de redirect fallido)
        setTimeout(() => {
            submitBtn.textContent = originalText;
            submitBtn.disabled = false;
        }, 5000);
        
        return true;
    }
    
    // Auto-completar credenciales de prueba al hacer doble click
    document.addEventListener('DOMContentLoaded', function() {
        const testCredentials = document.querySelector('.test-credentials');
        if (testCredentials) {
            testCredentials.addEventListener('dblclick', function() {
                const usernameField = document.getElementById('username');
                const passwordField = document.getElementById('password');
                
                if (usernameField && passwordField) {
                    usernameField.value = 'Chicana';
                    passwordField.value = '123';
                    mostrarAlerta('Credenciales de prueba completadas automáticamente.', 'info');
                }
            });
            
            // Agregar tooltip
            testCredentials.title = 'Haz doble click para completar automáticamente el formulario';
            testCredentials.style.cursor = 'pointer';
        }
    });
</script>

<%-- Incluir footer --%>
<%@include file="includes/footer.jsp" %>