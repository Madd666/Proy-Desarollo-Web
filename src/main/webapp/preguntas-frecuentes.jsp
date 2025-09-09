<%-- 
    Document   : contactenos
    Created on : 4 sep. 2025, mejorado con layout modular
    Author     : LAB-USR-LNORTE
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Configurar variables para el layout
    request.setAttribute("pageTitle", "Contáctenos - Sistema Web");
    request.setAttribute("currentPage", "contacto");
    request.setAttribute("showBreadcrumb", true);
    request.setAttribute("breadcrumbContent", 
        "<a href='index.jsp'>Inicio</a> > <span class='current'>Contáctenos</span>");
%>

<%-- Incluir header ---%>
<%@include file="includes/header.jsp" %>

<div class="contact-hero">
    <div class="hero-content">
        <h1>Contáctenos / Ubícanos</h1>
        <p class="hero-subtitle">Estamos aquí para ayudarte. Completa nuestro formulario o utiliza nuestros datos de contacto directo.</p>
    </div>
</div>

<!-- Mostrar mensajes de estado -->
<% if (request.getAttribute("error") != null) { %>
    <div class="alert alert-error">
        <strong>Error:</strong> <%= request.getAttribute("error") %>
    </div>
<% } %>

<% if (request.getAttribute("success") != null) { %>
    <div class="alert alert-success">
        <strong>¡Éxito!</strong> <%= request.getAttribute("success") %>
    </div>
<% } %>

<div class="contact-main">
    <!-- Formulario de Contacto -->
    <div class="contact-form-section">
        <div class="section-header">
            <h2>Envíanos un Mensaje</h2>
            <p>Completa el formulario y nos pondremos en contacto contigo a la brevedad.</p>
        </div>
        
        <form action="ContactoServlet" method="POST" class="contact-form" onsubmit="return validarFormularioContacto(this)">
            <div class="form-row">
                <div class="form-group">
                    <label for="nombre">
                        <span class="label-text">Nombre Completo</span>
                        <span class="required">*</span>
                    </label>
                    <input type="text" id="nombre" name="nombre" required 
                           placeholder="Ingrese su nombre completo"
                           value="<%= request.getParameter("nombre") != null ? request.getParameter("nombre") : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="email">
                        <span class="label-text">Correo Electrónico</span>
                        <span class="required">*</span>
                    </label>
                    <input type="email" id="email" name="email" required 
                           placeholder="ejemplo@correo.com"
                           value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="telefono">
                        <span class="label-text">Teléfono</span>
                        <span class="optional">(opcional)</span>
                    </label>
                    <input type="tel" id="telefono" name="telefono" 
                           placeholder="+51 999 888 777"
                           value="<%= request.getParameter("telefono") != null ? request.getParameter("telefono") : "" %>">
                </div>
                
                <div class="form-group">
                    <label for="asunto">
                        <span class="label-text">Asunto</span>
                        <span class="required">*</span>
                    </label>
                    <select id="asunto" name="asunto" required>
                        <option value="">Seleccione un asunto</option>
                        <option value="soporte_tecnico" <%= "soporte_tecnico".equals(request.getParameter("asunto")) ? "selected" : "" %>>
                            🔧 Soporte Técnico
                        </option>
                        <option value="informacion_general" <%= "informacion_general".equals(request.getParameter("asunto")) ? "selected" : "" %>>
                            ℹ️ Información General
                        </option>
                        <option value="sugerencias" <%= "sugerencias".equals(request.getParameter("asunto")) ? "selected" : "" %>>
                            💡 Sugerencias
                        </option>
                        <option value="reclamos" <%= "reclamos".equals(request.getParameter("asunto")) ? "selected" : "" %>>
                            ⚠️ Reclamos
                        </option>
                        <option value="otros" <%= "otros".equals(request.getParameter("asunto")) ? "selected" : "" %>>
                            📋 Otros
                        </option>
                    </select>
                </div>
            </div>
            
            <div class="form-group">
                <label for="mensaje">
                    <span class="label-text">Mensaje</span>
                    <span class="required">*</span>
                </label>
                <textarea id="mensaje" name="mensaje" required 
                          placeholder="Describe tu consulta o mensaje con el mayor detalle posible..."
                          rows="5"><%= request.getParameter("mensaje") != null ? request.getParameter("mensaje") : "" %></textarea>
                <div class="character-counter">
                    <span id="charCount">0</span>/500 caracteres
                </div>
            </div>
            
            <div class="form-group checkbox-group">
                <label class="checkbox-label">
                    <input type="checkbox" id="acepto" name="acepto" required>
                    <span class="checkmark"></span>
                    <span class="checkbox-text">
                        Acepto el <a href="#" onclick="mostrarPoliticaPrivacidad()">tratamiento de mis datos personales</a> 
                        de acuerdo con la Ley de Protección de Datos Personales.
                        <span class="required">*</span>
                    </span>
                </label>
            </div>
            
            <div class="form-actions">
                <button type="submit" class="btn btn-primary btn-large">
                    <span class="btn-icon">📧</span>
                    Enviar Mensaje
                </button>
                <button type="reset" class="btn btn-secondary" onclick="limpiarFormulario()">
                    <span class="btn-icon">🔄</span>
                    Limpiar
                </button>
            </div>
        </form>
    </div>
    
    <!-- Información de Contacto -->
    <div class="contact-info-section">
        <div class="section-header">
            <h2>Información de Contacto</h2>
            <p>También puedes contactarnos directamente a través de estos medios:</p>
        </div>
        
        <div class="contact-info-grid">
            <div class="contact-item">
                <div class="contact-icon">📍</div>
                <div class="contact-content">
                    <h4>Dirección</h4>
                    <p>
                        Av. Universitaria 1801<br>
                        San Miguel, Lima - Perú<br>
                        Código Postal: 15088
                    </p>
                    <small class="reference">
                        <strong>Referencia:</strong> A una cuadra del Óvalo Gutierrez, frente al Banco de la Nación
                    </small>
                </div>
            </div>
            
            <div class="contact-item">
                <div class="contact-icon">📞</div>
                <div class="contact-content">
                    <h4>Teléfonos</h4>
                    <div class="contact-detail">
                        <strong>Principal:</strong> 
                        <a href="tel:+51016262000">(01) 626-2000</a>
                    </div>
                    <div class="contact-detail">
                        <strong>Soporte:</strong> 
                        <a href="tel:+51016262001">(01) 626-2001</a>
                    </div>
                    <div class="contact-detail">
                        <strong>WhatsApp:</strong> 
                        <a href="https://wa.me/51999888777" target="_blank">+51 999 888 777</a>
                    </div>
                </div>
            </div>
            
            <div class="contact-item">
                <div class="contact-icon">📧</div>
                <div class="contact-content">
                    <h4>Correos Electrónicos</h4>
                    <div class="contact-detail">
                        <strong>General:</strong> 
                        <a href="mailto:info@empresa.com">info@empresa.com</a>
                    </div>
                    <div class="contact-detail">
                        <strong>Soporte:</strong> 
                        <a href="mailto:soporte@empresa.com">soporte@empresa.com</a>
                    </div>
                    <div class="contact-detail">
                        <strong>Comercial:</strong> 
                        <a href="mailto:ventas@empresa.com">ventas@empresa.com</a>
                    </div>
                </div>
            </div>
            
            <div class="contact-item">
                <div class="contact-icon">🕒</div>
                <div class="contact-content">
                    <h4>Horario de Atención</h4>
                    <div class="schedule-item">
                        <strong>Lunes a Viernes:</strong><br>
                        8:00 AM - 6:00 PM
                    </div>
                    <div class="schedule-item">
                        <strong>Sábados:</strong><br>
                        9:00 AM - 1:00 PM
                    </div>
                    <div class="schedule-item">
                        <strong>Domingos:</strong><br>
                        <span class="closed">Cerrado</span>
                    </div>
                </div>
            </div>
            
            <div class="contact-item">
                <div class="contact-icon">🌐</div>
                <div class="contact-content">
                    <h4>Redes Sociales</h4>
                    <div class="social-links">
                        <a href="#" class="social-link facebook" onclick="mostrarAlerta('Enlace a Facebook próximamente disponible.', 'info')">
                            <span class="social-icon">📘</span>
                            Facebook
                        </a>
                        <a href="#" class="social-link twitter" onclick="mostrarAlerta('Enlace a Twitter próximamente disponible.', 'info')">
                            <span class="social-icon">🐦</span>
                            Twitter
                        </a>
                        <a href="#" class="social-link linkedin" onclick="mostrarAlerta('Enlace a LinkedIn próximamente disponible.', 'info')">
                            <span class="social-icon">💼</span>
                            LinkedIn
                        </a>
                    </div>
                </div>
            </div>
            
            <div class="contact-item emergency">
                <div class="contact-icon">🚨</div>
                <div class="contact-content">
                    <h4>Emergencias</h4>
                    <p>Para reportes urgentes o problemas críticos del sistema:</p>
                    <div class="contact-detail emergency-contact">
                        <strong>Línea 24/7:</strong> 
                        <a href="tel:+51016262999">(01) 626-2999</a>
                    </div>
                    <small>Solo para incidencias críticas del sistema</small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Mapa de Ubicación -->
<div class="location-section">
    <div class="section-header">
        <h2>Nuestra Ubicación</h2>
        <p>Nos encontramos en una zona céntrica y de fácil acceso.</p>
        <h3>Mapa Interactivo</h3>
    </div>
    
    <div class="map-container">
        <div class="map-placeholder">
            <div class="map-content">
                <div class="map-icon">🗺️</div>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.5727547656816!2d-77.0827753!3d-12.072890099999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c96c5c0e9eef%3A0xd6ea12ae5cd09c1c!2sAv.%20Universitaria%201801%2C%20San%20Miguel%2015088!5e0!3m2!1ses-419!2spe!4v1757362267658!5m2!1ses-419!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
    
    <div class="location-details">
        <div class="transport-options">
            <h4>Cómo Llegar</h4>
            <div class="transport-grid">
                <div class="transport-item">
                    <span class="transport-icon">🚌</span>
                    <div class="transport-info">
                        <strong>Transporte Público</strong>
                        <p>Líneas 201, 301, 405 - Paradero "Óvalo Gutierrez"</p>
                    </div>
                </div>
                
                <div class="transport-item">
                    <span class="transport-icon">🚗</span>
                    <div class="transport-info">
                        <strong>En Auto</strong>
                        <p>Estacionamiento disponible en la Av. Universitaria</p>
                    </div>
                </div>
                
                <div class="transport-item">
                    <span class="transport-icon">🚇</span>
                    <div class="transport-info">
                        <strong>Metropolitano</strong>
                        <p>Estación "Naranjal" - 15 minutos caminando</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    /* Estilos específicos para la página de contacto */
    .contact-hero {
        background: linear-gradient(135deg, rgba(0,123,255,0.1), rgba(0,86,179,0.05));
        border-radius: 12px;
        padding: 40px;
        margin-bottom: 40px;
        text-align: center;
    }
    
    .contact-hero h1 {
        font-size: 2.5rem;
        color: #2c3e50;
        margin-bottom: 15px;
    }
    
    .hero-subtitle {
        font-size: 1.2rem;
        color: #6c757d;
        max-width: 800px;
        margin: 0 auto;
    }
    
    .contact-main {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 40px;
        margin-bottom: 50px;
    }
    
    .section-header {
        margin-bottom: 30px;
        text-align: center;
    }
    
    .section-header h2 {
        color: #2c3e50;
        margin-bottom: 10px;
        font-size: 1.8rem;
    }
    
    .section-header p {
        color: #6c757d;
        font-size: 1rem;
    }
    
    .contact-form-section,
    .contact-info-section {
        background: white;
        padding: 35px;
        border-radius: 12px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        border: 2px solid #f8f9fa;
    }
    
    .form-row {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        margin-bottom: 20px;
    }
    
    .form-group label {
        display: flex;
        align-items: center;
        gap: 5px;
        margin-bottom: 8px;
        font-weight: 600;
        color: #495057;
    }
    
    .required {
        color: #dc3545;
        font-weight: bold;
    }
    
    .optional {
        color: #6c757d;
        font-size: 0.9rem;
        font-weight: normal;
    }
    
    .contact-form input,
    .contact-form select,
    .contact-form textarea {
        transition: all 0.3s ease;
        border: 2px solid #e9ecef;
    }
    
    .contact-form input:focus,
    .contact-form select:focus,
    .contact-form textarea:focus {
        border-color: #007bff;
        box-shadow: 0 0 0 3px rgba(0,123,255,0.1);
        transform: translateY(-1px);
    }
    
    .character-counter {
        text-align: right;
        margin-top: 5px;
        font-size: 0.85rem;
        color: #6c757d;
    }
    
    .checkbox-group {
        margin: 30px 0;
    }
    
    .checkbox-label {
        display: flex;
        align-items: flex-start;
        cursor: pointer;
        line-height: 1.5;
    }
    
    .checkbox-label input[type="checkbox"] {
        margin-right: 10px;
        margin-top: 2px;
        width: auto;
        transform: scale(1.2);
    }
    
    .checkbox-text {
        font-size: 0.95rem;
        color: #495057;
    }
    
    .checkbox-text a {
        color: #007bff;
        text-decoration: underline;
    }
    
    .form-actions {
        display: flex;
        gap: 15px;
        justify-content: center;
        margin-top: 30px;
    }
    
    .btn-icon {
        margin-right: 8px;
    }
    
    .contact-info-grid {
        display: grid;
        gap: 25px;
    }
    
    .contact-item {
        display: flex;
        padding: 25px;
        background: linear-gradient(135deg, #f8f9fa, #ffffff);
        border-radius: 10px;
        border: 2px solid #e9ecef;
        transition: all 0.3s ease;
    }
    
    .contact-item:hover {
        border-color: #007bff;
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    }
    
    .contact-item.emergency {
        border-left: 6px solid #dc3545;
        background: linear-gradient(135deg, #fff5f5, #ffffff);
    }
    
    .contact-icon {
        font-size: 2rem;
        margin-right: 20px;
        flex-shrink: 0;
    }
    
    .contact-content h4 {
        color: #2c3e50;
        margin-bottom: 15px;
        font-size: 1.1rem;
    }
    
    .contact-content p {
        color: #495057;
        line-height: 1.6;
        margin-bottom: 10px;
    }
    
    .contact-detail {
        margin-bottom: 8px;
        font-size: 0.95rem;
    }
    
    .contact-detail a {
        color: #007bff;
        text-decoration: none;
        font-weight: 500;
    }
    
    .contact-detail a:hover {
        text-decoration: underline;
    }
    
    .reference {
        font-style: italic;
        color: #6c757d;
        margin-top: 10px;
        display: block;
    }
    
    .schedule-item {
        margin-bottom: 12px;
        font-size: 0.95rem;
    }
    
    .closed {
        color: #dc3545;
        font-weight: 500;
    }
    
    .social-links {
        display: flex;
        flex-direction: column;
        gap: 8px;
    }
    
    .social-link {
        display: flex;
        align-items: center;
        gap: 8px;
        color: #495057;
        text-decoration: none;
        padding: 5px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }
    
    .social-link:hover {
        background-color: #f8f9fa;
        color: #007bff;
        transform: translateX(5px);
    }
    
    .emergency-contact {
        background: #fff0f0;
        padding: 10px;
        border-radius: 6px;
        border-left: 4px solid #dc3545;
        margin: 10px 0;
    }
    
    .location-section {
        margin-top: 50px;
    }
    
    .map-container {
        margin-bottom: 30px;
    }
    
    .map-placeholder {
        width: 100%;
        height: 350px;
        background: linear-gradient(135deg, #e9ecef, #f8f9fa);
        border: 3px dashed #adb5bd;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        position: relative;
        overflow: hidden;
    }
    
    .map-placeholder::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="%23dee2e6" stroke-width="0.5"/></pattern></defs><rect width="100%" height="100%" fill="url(%23grid)"/></svg>');
        opacity: 0.3;
    }
    
    .map-content {
        text-align: center;
        position: relative;
        z-index: 2;
    }
    
    .map-icon {
        font-size: 4rem;
        margin-bottom: 15px;
        display: block;
    }
    
    .map-content h3 {
        color: #495057;
        margin-bottom: 10px;
    }
    
    .map-content p {
        color: #6c757d;
        margin-bottom: 20px;
    }
    
    .location-details {
        background: white;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    
    .transport-options h4 {
        color: #2c3e50;
        margin-bottom: 20px;
        text-align: center;
    }
    
    .transport-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 20px;
    }
    
    .transport-item {
        display: flex;
        align-items: center;
        padding: 20px;
        background: linear-gradient(135deg, #f8f9fa, #ffffff);
        border-radius: 10px;
        border: 2px solid #e9ecef;
        transition: all 0.3s ease;
    }
    
    .transport-item:hover {
        border-color: #007bff;
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    }
    
    .transport-icon {
        font-size: 2rem;
        margin-right: 15px;
        flex-shrink: 0;
    }
    
    .transport-info strong {
        color: #2c3e50;
        display: block;
        margin-bottom: 5px;
    }
    
    .transport-info p {
        color: #6c757d;
        font-size: 0.9rem;
        margin: 0;
    }
    
    /* Responsive */
    @media (max-width: 768px) {
        .contact-hero h1 {
            font-size: 2rem;
        }
        
        .contact-main {
            grid-template-columns: 1fr;
            gap: 30px;
        }
        
        .form-row {
            grid-template-columns: 1fr;
            gap: 15px;
        }
        
        .contact-form-section,
        .contact-info-section,
        .location-details {
            padding: 25px;
        }
        
        .contact-item {
            flex-direction: column;
            text-align: center;
        }
        
        .contact-icon {
            margin-right: 0;
            margin-bottom: 15px;
        }
        
        .form-actions {
            flex-direction: column;
        }
        
        .transport-grid {
            grid-template-columns: 1fr;
        }
    }
</style>

<script>
    // Validación del formulario de contacto
    function validarFormularioContacto(form) {
        let esValido = true;
        
        // Validar nombre
        const nombre = form.nombre.value.trim();
        if (nombre.length < 2) {
            mostrarAlerta('El nombre debe tener al menos 2 caracteres.', 'error');
            form.nombre.focus();
            return false;
        }
        
        // Validar email
        const email = form.email.value.trim();
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            mostrarAlerta('Por favor ingrese un email válido.', 'error');
            form.email.focus();
            return false;
        }
        
        // Validar teléfono si está presente
        const telefono = form.telefono.value.trim();
        if (telefono && telefono.length < 7) {
            mostrarAlerta('Ingrese un número de teléfono válido.', 'error');
            form.telefono.focus();
            return false;
        }
        
        // Validar mensaje
        const mensaje = form.mensaje.value.trim();
        if (mensaje.length < 10) {
            mostrarAlerta('El mensaje debe tener al menos 10 caracteres.', 'error');
            form.mensaje.focus();
            return false;
        }
        
        if (mensaje.length > 500) {
            mostrarAlerta('El mensaje no puede exceder 500 caracteres.', 'error');
            form.mensaje.focus();
            return false;
        }
        
        // Validar checkbox de aceptación
        if (!form.acepto.checked) {
            mostrarAlerta('Debe aceptar el tratamiento de datos personales.', 'error');
            return false;
        }
        
        // Mostrar indicador de envío
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalHTML = submitBtn.innerHTML;
        submitBtn.innerHTML = '<span class="btn-icon">⏳</span>Enviando...';
        submitBtn.disabled = true;
        
        // Restaurar botón después de un tiempo (por si hay error)
        setTimeout(() => {
            submitBtn.innerHTML = originalHTML;
            submitBtn.disabled = false;
        }, 10000);
        
        return true;
    }
    
    // Limpiar formulario
    function limpiarFormulario() {
        const form = document.querySelector('.contact-form');
        form.reset();
        document.getElementById('charCount').textContent = '0';
        mostrarAlerta('Formulario limpiado correctamente.', 'info');
    }
    
    // Contador de caracteres para el mensaje
    document.addEventListener('DOMContentLoaded', function() {
        const mensajeTextarea = document.getElementById('mensaje');
        const charCounter = document.getElementById('charCount');
        
        if (mensajeTextarea && charCounter) {
            // Contar caracteres iniciales
            charCounter.textContent = mensajeTextarea.value.length;
            
            mensajeTextarea.addEventListener('input', function() {
                const count = this.value.length;
                charCounter.textContent = count;
                
                // Cambiar color según la cantidad de caracteres
                if (count > 450) {
                    charCounter.style.color = '#dc3545';
                } else if (count > 300) {
                    charCounter.style.color = '#ffc107';
                } else {
                    charCounter.style.color = '#6c757d';
                }
                
                // Limitar a 500 caracteres
                if (count > 500) {
                    this.value = this.value.substring(0, 500);
                    charCounter.textContent = '500';
                }
            });
        }
        
        // Animación de entrada para las tarjetas
        const items = document.querySelectorAll('.contact-item, .transport-item');
        items.forEach((item, index) => {
            item.style.opacity = '0';
            item.style.transform = 'translateY(20px)';
            
            setTimeout(() => {
                item.style.transition = 'all 0.6s ease';
                item.style.opacity = '1';
                item.style.transform = 'translateY(0)';
            }, index * 100);
        });
    });
    
    // Mostrar política de privacidad
    function mostrarPoliticaPrivacidad() {
        const contenido = `
            <div style="text-align: left; line-height: 1.6;">
                <h4 style="color: #2c3e50; margin-bottom: 15px;">Política de Tratamiento de Datos Personales</h4>
                
                <p><strong>1. Responsable del tratamiento:</strong><br>
                Sistema Web - Empresa S.A.C.</p>
                
                <p><strong>2. Finalidad del tratamiento:</strong><br>
                Sus datos personales serán utilizados para:</p>
                <ul style="margin: 10px 0; padding-left: 20px;">
                    <li>Responder a su consulta o solicitud</li>
                    <li>Brindar soporte técnico</li>
                    <li>Mejorar nuestros servicios</li>
                    <li>Cumplir con obligaciones legales</li>
                </ul>
                
                <p><strong>3. Derechos del titular:</strong><br>
                Usted tiene derecho a acceder, rectificar, cancelar y oponerse al tratamiento de sus datos personales.</p>
                
                <p><strong>4. Seguridad:</strong><br>
                Implementamos medidas técnicas y organizativas para proteger sus datos.</p>
                
                <p><strong>5. Contacto:</strong><br>
                Para ejercer sus derechos: <a href="mailto:privacidad@empresa.com">privacidad@empresa.com</a></p>
                
                <small style="color: #6c757d; font-style: italic;">
                    De acuerdo con la Ley N° 29733 - Ley de Protección de Datos Personales
                </small>
            </div>
        `;
        
        const modal = `
            <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
                       background: rgba(0,0,0,0.8); z-index: 10000; display: flex; 
                       align-items: center; justify-content: center; padding: 20px; overflow-y: auto;">
                <div style="background: white; border-radius: 12px; padding: 30px; 
                           max-width: 600px; width: 100%; box-shadow: 0 15px 40px rgba(0,0,0,0.4);
                           max-height: 90vh; overflow-y: auto;">
                    ${contenido}
                    <div style="text-align: center; margin-top: 25px;">
                        <button onclick="this.closest('div[style*=\"position: fixed\"]').remove()" 
                                style="background: #007bff; color: white; border: none; 
                                       padding: 12px 25px; border-radius: 6px; cursor: pointer; 
                                       font-weight: 500;">
                            Entendido
                        </button>
                    </div>
                </div>
            </div>
        `;
        
        document.body.insertAdjacentHTML('beforeend', modal);
    }
    
    // Instrucciones de ubicación
    function mostrarInstruccionesUbicacion() {
        const instrucciones = `
            <div style="text-align: left; line-height: 1.6;">
                <h4 style="color: #2c3e50; margin-bottom: 15px;">🗺️ Cómo llegar a nuestras oficinas</h4>
                
                <div style="margin-bottom: 20px; padding: 15px; background: #f8f9fa; border-radius: 8px;">
                    <strong style="color: #007bff;">📍 Dirección exacta:</strong><br>
                    Av. Universitaria 1801, San Miguel, Lima - Perú
                </div>
                
                <h5 style="color: #495057; margin: 15px 0 10px 0;">🚌 En transporte público:</h5>
                <ul style="margin: 0 0 15px 20px;">
                    <li>Tomar líneas 201, 301, 405 hasta "Óvalo Gutierrez"</li>
                    <li>Caminar 2 cuadras por Av. Universitaria</li>
                    <li>El edificio está frente al Banco de la Nación</li>
                </ul>
                
                <h5 style="color: #495057; margin: 15px 0 10px 0;">🚗 En auto particular:</h5>
                <ul style="margin: 0 0 15px 20px;">
                    <li>Desde el centro: tomar Av. Brasil hacia San Miguel</li>
                    <li>Continuar por Av. Universitaria</li>
                    <li>Estacionamiento disponible en la calle</li>
                </ul>
                
                <h5 style="color: #495057; margin: 15px 0 10px 0;">🚇 En Metropolitano:</h5>
                <ul style="margin: 0 0 15px 20px;">
                    <li>Estación "Naranjal"</li>
                    <li>15 minutos caminando por Av. Universitaria</li>
                    <li>También disponible transporte local desde la estación</li>
                </ul>
                
                <div style="margin-top: 20px; padding: 15px; background: #fff3cd; border-radius: 8px; border-left: 4px solid #ffc107;">
                    <strong>💡 Tip:</strong> Si tienes dudas sobre la ubicación, llámanos al (01) 626-2000 
                    y te proporcionaremos referencias adicionales.
                </div>
            </div>
        `;
        
        const modal = `
            <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
                       background: rgba(0,0,0,0.8); z-index: 10000; display: flex; 
                       align-items: center; justify-content: center; padding: 20px; overflow-y: auto;">
                <div style="background: white; border-radius: 12px; padding: 30px; 
                           max-width: 600px; width: 100%; box-shadow: 0 15px 40px rgba(0,0,0,0.4);
                           max-height: 90vh; overflow-y: auto;">
                    ${instrucciones}
                    <div style="text-align: center; margin-top: 25px;">
                        <button onclick="this.closest('div[style*=\"position: fixed\"]').remove()" 
                                style="background: #007bff; color: white; border: none; 
                                       padding: 12px 25px; border-radius: 6px; cursor: pointer; 
                                       font-weight: 500;">
                            Cerrar
                        </button>
                    </div>
                </div>
            </div>
        `;
        
        document.body.insertAdjacentHTML('beforeend', modal);
    }
</script>

<%-- Incluir footer --%>
<%@include file="includes/footer.jsp" %>