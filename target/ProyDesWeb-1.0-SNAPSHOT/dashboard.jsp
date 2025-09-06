<%-- 
    Document   : dashboard
    Created on : 19 ago. 2025, mejorado con layout modular
    Author     : LAB-USR-LNORTE
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar sesión ANTES del header
    HttpSession sesionDashboard = request.getSession(false);
    if (sesionDashboard == null || sesionDashboard.getAttribute("user") == null){
        response.sendRedirect("index.jsp");
        return;
    }
    
    // Configurar variables para el layout
    request.setAttribute("pageTitle", "Dashboard - Sistema Web");
    request.setAttribute("currentPage", "dashboard");
    request.setAttribute("showBreadcrumb", true);
    request.setAttribute("breadcrumbContent", 
        "<a href='index.jsp'>Inicio</a> > <span class='current'>Dashboard</span>");
%>

<%-- Incluir header ---%>
<%@include file="includes/header.jsp" %>

<div class="welcome-header">
    <h1>Dashboard Principal</h1>
    <p>Bienvenido al panel de control del sistema, <%= sesionDashboard.getAttribute("user") %></p>
    <div class="session-info">
        <span class="session-time">Sesión iniciada: <%= new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm").format(new java.util.Date()) %></span>
    </div>
</div>

<div class="chapter-info">
    <div class="chapter-icon">📚</div>
    <div class="chapter-content">
        <h3>Capítulo 2: Funcionalidades del Sistema</h3>
        <p>Acceso completo a todas las funcionalidades implementadas según los requerimientos funcionales y no funcionales establecidos.</p>
    </div>
</div>

<div class="system-overview">
    <div class="overview-grid">
        <div class="overview-card">
            <div class="overview-icon">🎯</div>
            <div class="overview-content">
                <h4>Layout y Navegación</h4>
                <p>Sistema de menú de navegación consistente implementado en toda la estructura del sitio.</p>
                <span class="status-badge status-active">Activo</span>
            </div>
        </div>
        
        <div class="overview-card">
            <div class="overview-icon">📊</div>
            <div class="overview-content">
                <h4>Estado del Sistema</h4>
                <p>2 de 3 funcionalidades principales completadas (66.7%)</p>
                <span class="status-badge status-progress">En Progreso</span>
            </div>
        </div>
        
        <div class="overview-card">
            <div class="overview-icon">🔒</div>
            <div class="overview-content">
                <h4>Seguridad</h4>
                <p>Autenticación por sesión y validaciones implementadas</p>
                <span class="status-badge status-secure">Seguro</span>
            </div>
        </div>
    </div>
</div>

<div class="functionality-grid">
    <div class="function-section">
        <h2>Funcionalidades Implementadas</h2>
        
        <div class="function-card implemented">
            <div class="function-header">
                <span class="function-icon">❓</span>
                <div class="function-title">
                    <h3>Preguntas Frecuentes</h3>
                    <p class="function-subtitle">Sistema de FAQ con búsqueda</p>
                </div>
                <div class="function-status">
                    <span class="status-badge status-completed">✅ Completado</span>
                </div>
            </div>
            
            <div class="function-description">
                <p>Sección completa de preguntas frecuentes con:</p>
                <ul>
                    <li>Función de búsqueda en tiempo real</li>
                    <li>Interfaz accordion interactiva</li>
                    <li>8 preguntas categorizadas</li>
                    <li>Enlaces de ayuda adicional</li>
                </ul>
            </div>
            
            <div class="function-actions">
                <a href="preguntas-frecuentes.jsp" class="btn btn-primary">Acceder</a>
                <button class="btn btn-secondary" onclick="mostrarDetalles('faq')">Ver Detalles</button>
            </div>
        </div>
        
        <div class="function-card implemented">
            <div class="function-header">
                <span class="function-icon">📍</span>
                <div class="function-title">
                    <h3>Contáctenos / Ubícanos</h3>
                    <p class="function-subtitle">Portal de contacto completo</p>
                </div>
                <div class="function-status">
                    <span class="status-badge status-completed">✅ Completado</span>
                </div>
            </div>
            
            <div class="function-description">
                <p>Sistema integral de contacto que incluye:</p>
                <ul>
                    <li>Formulario con validaciones robustas</li>
                    <li>Información de contacto completa</li>
                    <li>Mapa de ubicación placeholder</li>
                    <li>Generación automática de tickets</li>
                </ul>
            </div>
            
            <div class="function-actions">
                <a href="contactenos.jsp" class="btn btn-primary">Acceder</a>
                <button class="btn btn-secondary" onclick="mostrarDetalles('contacto')">Ver Detalles</button>
            </div>
        </div>
    </div>
    
    <div class="function-section">
        <h2>Funcionalidades Pendientes</h2>
        
        <div class="function-card pending">
            <div class="function-header">
                <span class="function-icon">📋</span>
                <div class="function-title">
                    <h3>Libro de Reclamaciones</h3>
                    <p class="function-subtitle">Sistema de gestión de reclamos</p>
                </div>
                <div class="function-status">
                    <span class="status-badge status-pending">⏳ Pendiente</span>
                </div>
            </div>
            
            <div class="function-description">
                <p>Sistema planificado para registro y gestión de reclamos:</p>
                <ul>
                    <li>Formulario según normativas legales</li>
                    <li>Seguimiento de estado de reclamos</li>
                    <li>Notificaciones automáticas</li>
                    <li>Reportes para administradores</li>
                </ul>
            </div>
            
            <div class="function-actions">
                <button class="btn btn-secondary" disabled>En Desarrollo</button>
                <button class="btn btn-secondary" onclick="mostrarAlerta('Esta funcionalidad será implementada en la próxima versión del sistema.', 'info')">
                    Más Info
                </button>
            </div>
        </div>
    </div>
</div>

<div class="dashboard-stats">
    <h2>Estadísticas del Sistema</h2>
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-number">3</div>
            <div class="stat-label">Páginas Principales</div>
            <div class="stat-detail">index, dashboard, FAQ, contacto</div>
        </div>
        
        <div class="stat-card">
            <div class="stat-number">4</div>
            <div class="stat-label">Servlets Activos</div>
            <div class="stat-detail">Login, Logout, Contacto, Principal</div>
        </div>
        
        <div class="stat-card">
            <div class="stat-number">8</div>
            <div class="stat-label">Preguntas FAQ</div>
            <div class="stat-detail">Con función de búsqueda</div>
        </div>
        
        <div class="stat-card">
            <div class="stat-number">100%</div>
            <div class="stat-label">Layout Modular</div>
            <div class="stat-detail">Header/Footer compartidos</div>
        </div>
    </div>
</div>

<div class="quick-actions">
    <h2>Acciones Rápidas</h2>
    <div class="actions-grid">
        <button class="action-btn" onclick="window.open('preguntas-frecuentes.jsp', '_blank')">
            <span class="action-icon">❓</span>
            Abrir FAQ
        </button>
        
        <button class="action-btn" onclick="window.open('contactenos.jsp', '_blank')">
            <span class="action-icon">📧</span>
            Nuevo Contacto
        </button>
        
        <button class="action-btn" onclick="mostrarInfoSistema()">
            <span class="action-icon">ℹ️</span>
            Info Sistema
        </button>
        
        <button class="action-btn" onclick="confirmarLogout()">
            <span class="action-icon">🚪</span>
            Cerrar Sesión
        </button>
    </div>
</div>

<style>
    /* Estilos específicos del dashboard */
    .welcome-header {
        background: linear-gradient(135deg, #007bff, #0056b3);
        color: white;
        padding: 30px;
        border-radius: 12px;
        margin-bottom: 30px;
        text-align: center;
        position: relative;
        overflow: hidden;
    }
    
    .welcome-header::before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="white" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="white" opacity="0.1"/></pattern></defs><rect width="100%" height="100%" fill="url(%23grain)"/></svg>');
        pointer-events: none;
    }
    
    .welcome-header h1 {
        font-size: 2.5rem;
        margin-bottom: 10px;
        position: relative;
    }
    
    .welcome-header p {
        font-size: 1.2rem;
        opacity: 0.9;
        margin-bottom: 15px;
        position: relative;
    }
    
    .session-info {
        position: relative;
    }
    
    .session-time {
        background: rgba(255,255,255,0.2);
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 0.9rem;
        backdrop-filter: blur(5px);
    }
    
    .chapter-info {
        display: flex;
        align-items: center;
        background: linear-gradient(135deg, #d1ecf1, #b8e6f0);
        border: 2px solid #bee5eb;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 30px;
    }
    
    .chapter-icon {
        font-size: 3rem;
        margin-right: 20px;
    }
    
    .chapter-content h3 {
        color: #0c5460;
        margin-bottom: 8px;
        font-size: 1.3rem;
    }
    
    .chapter-content p {
        color: #0c5460;
        margin: 0;
        line-height: 1.5;
    }
    
    .system-overview {
        margin-bottom: 40px;
    }
    
    .overview-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 20px;
    }
    
    .overview-card {
        background: white;
        border: 2px solid #f8f9fa;
        border-radius: 10px;
        padding: 25px;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
    }
    
    .overview-card:hover {
        border-color: #007bff;
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(0,0,0,0.1);
    }
    
    .overview-icon {
        font-size: 2.5rem;
        margin-right: 15px;
    }
    
    .overview-content h4 {
        margin: 0 0 5px 0;
        color: #2c3e50;
    }
    
    .overview-content p {
        margin: 0 0 10px 0;
        color: #6c757d;
        font-size: 0.9rem;
    }
    
    .functionality-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 30px;
        margin-bottom: 40px;
    }
    
    .function-section h2 {
        color: #2c3e50;
        margin-bottom: 20px;
        padding-bottom: 10px;
        border-bottom: 3px solid #007bff;
    }
    
    .function-card {
        background: white;
        border-radius: 12px;
        padding: 25px;
        margin-bottom: 20px;
        border: 2px solid #f8f9fa;
        transition: all 0.3s ease;
    }
    
    .function-card.implemented {
        border-left-color: #28a745;
        border-left-width: 6px;
    }
    
    .function-card.implemented:hover {
        border-color: #28a745;
        box-shadow: 0 6px 20px rgba(40,167,69,0.15);
    }
    
    .function-card.pending {
        border-left-color: #ffc107;
        border-left-width: 6px;
        opacity: 0.8;
    }
    
    .function-card.pending:hover {
        border-color: #ffc107;
        box-shadow: 0 6px 20px rgba(255,193,7,0.15);
    }
    
    .function-header {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }
    
    .function-icon {
        font-size: 2rem;
        margin-right: 15px;
    }
    
    .function-title {
        flex: 1;
    }
    
    .function-title h3 {
        margin: 0 0 5px 0;
        color: #2c3e50;
    }
    
    .function-subtitle {
        margin: 0;
        color: #6c757d;
        font-size: 0.9rem;
    }
    
    .function-description {
        margin-bottom: 20px;
    }
    
    .function-description ul {
        margin: 10px 0;
        padding-left: 20px;
        color: #495057;
    }
    
    .function-description li {
        margin-bottom: 5px;
        font-size: 0.9rem;
    }
    
    .function-actions {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }
    
    .status-badge {
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }
    
    .status-completed {
        background: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    
    .status-pending {
        background: #fff3cd;
        color: #856404;
        border: 1px solid #ffeaa7;
    }
    
    .status-active {
        background: #cce7ff;
        color: #004085;
        border: 1px solid #b3d7ff;
    }
    
    .status-progress {
        background: #e2e3e5;
        color: #383d41;
        border: 1px solid #d1d1d1;
    }
    
    .status-secure {
        background: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    
    .dashboard-stats {
        margin-bottom: 40px;
    }
    
    .dashboard-stats h2 {
        color: #2c3e50;
        margin-bottom: 25px;
        text-align: center;
    }
    
    .stats-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        gap: 20px;
    }
    
    .stat-card {
        background: linear-gradient(135deg, #f8f9fa, #e9ecef);
        border: 2px solid #dee2e6;
        border-radius: 12px;
        padding: 25px;
        text-align: center;
        transition: all 0.3s ease;
    }
    
    .stat-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        border-color: #007bff;
    }
    
    .stat-number {
        font-size: 2.5rem;
        font-weight: bold;
        color: #007bff;
        margin-bottom: 10px;
    }
    
    .stat-label {
        font-size: 1rem;
        font-weight: 600;
        color: #2c3e50;
        margin-bottom: 5px;
    }
    
    .stat-detail {
        font-size: 0.85rem;
        color: #6c757d;
        font-style: italic;
    }
    
    .quick-actions h2 {
        color: #2c3e50;
        margin-bottom: 20px;
        text-align: center;
    }
    
    .actions-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 15px;
    }
    
    .action-btn {
        background: linear-gradient(135deg, #007bff, #0056b3);
        color: white;
        border: none;
        border-radius: 10px;
        padding: 20px;
        cursor: pointer;
        transition: all 0.3s ease;
        text-align: center;
        text-decoration: none;
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 8px;
        font-size: 0.9rem;
        font-weight: 500;
    }
    
    .action-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(0,123,255,0.3);
        background: linear-gradient(135deg, #0056b3, #004494);
    }
    
    .action-icon {
        font-size: 1.5rem;
    }
    
    /* Responsive */
    @media (max-width: 768px) {
        .functionality-grid {
            grid-template-columns: 1fr;
            gap: 20px;
        }
        
        .welcome-header h1 {
            font-size: 2rem;
        }
        
        .chapter-info {
            flex-direction: column;
            text-align: center;
        }
        
        .chapter-icon {
            margin-right: 0;
            margin-bottom: 15px;
        }
        
        .function-header {
            flex-direction: column;
            align-items: flex-start;
        }
        
        .function-status {
            margin-top: 10px;
        }
    }
</style>

<script>
    function mostrarDetalles(tipo) {
        const detalles = {
            faq: {
                titulo: 'Detalles: Preguntas Frecuentes',
                contenido: `
                    <strong>Funcionalidades implementadas:</strong><br>
                    • Sistema de búsqueda en tiempo real<br>
                    • 8 preguntas categorizadas<br>
                    • Interfaz accordion interactiva<br>
                    • Navegación integrada<br>
                    • Enlaces de ayuda adicional<br><br>
                    <strong>Archivos:</strong> preguntas-frecuentes.jsp<br>
                    <strong>Estado:</strong> Completamente funcional
                `
            },
            contacto: {
                titulo: 'Detalles: Sistema de Contacto',
                contenido: `
                    <strong>Funcionalidades implementadas:</strong><br>
                    • Formulario con validaciones robustas<br>
                    • Generación automática de tickets<br>
                    • Información completa de contacto<br>
                    • Manejo de errores y confirmaciones<br>
                    • Integración con servlet ContactoServlet<br><br>
                    <strong>Archivos:</strong> contactenos.jsp, ContactoServlet.java, Contacto.java<br>
                    <strong>Estado:</strong> Completamente funcional
                `
            }
        };
        
        const info = detalles[tipo];
        if (info) {
            const modal = `
                <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
                           background: rgba(0,0,0,0.7); z-index: 10000; display: flex; 
                           align-items: center; justify-content: center; padding: 20px;">
                    <div style="background: white; border-radius: 12px; padding: 30px; 
                               max-width: 500px; width: 100%; box-shadow: 0 10px 30px rgba(0,0,0,0.3);">
                        <h3 style="color: #2c3e50; margin-bottom: 20px;">${info.titulo}</h3>
                        <div style="line-height: 1.6; color: #495057; margin-bottom: 25px;">
                            ${info.contenido}
                        </div>
                        <button onclick="this.closest('div[style*=\"position: fixed\"]').remove()" 
                                style="background: #007bff; color: white; border: none; 
                                       padding: 10px 20px; border-radius: 6px; cursor: pointer;">
                            Cerrar
                        </button>
                    </div>
                </div>
            `;
            document.body.insertAdjacentHTML('beforeend', modal);
        }
    }
    
    function mostrarInfoSistema() {
        const info = `
            <div style="text-align: left;">
                <strong>Sistema Web - Dashboard</strong><br><br>
                <strong>Tecnologías:</strong><br>
                • JSP (JavaServer Pages)<br>
                • Servlets Java<br>
                • Apache Tomcat<br>
                • NetBeans IDE<br><br>
                
                <strong>Arquitectura:</strong><br>
                • Patrón MVC (Model-View-Controller)<br>
                • Layout modular con includes<br>
                • Gestión de sesiones<br>
                • Validaciones del lado del servidor<br><br>
                
                <strong>Funcionalidades:</strong><br>
                • Sistema de autenticación<br>
                • Dashboard administrativo<br>
                • FAQ con búsqueda<br>
                • Portal de contacto<br><br>
                
                <strong>Usuario de prueba:</strong><br>
                Usuario: Chicana | Contraseña: 123
            </div>
        `;
        
        const modal = `
            <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
                       background: rgba(0,0,0,0.8); z-index: 10000; display: flex; 
                       align-items: center; justify-content: center; padding: 20px;">
                <div style="background: white; border-radius: 12px; padding: 30px; 
                           max-width: 600px; width: 100%; box-shadow: 0 15px 40px rgba(0,0,0,0.4);">
                    <h3 style="color: #2c3e50; margin-bottom: 20px; text-align: center;">
                        🔧 Información del Sistema
                    </h3>
                    <div style="line-height: 1.8; color: #495057; margin-bottom: 25px;">
                        ${info}
                    </div>
                    <div style="text-align: center;">
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
    
    function confirmarLogout() {
        const confirmModal = `
            <div style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; 
                       background: rgba(0,0,0,0.7); z-index: 10000; display: flex; 
                       align-items: center; justify-content: center; padding: 20px;">
                <div style="background: white; border-radius: 12px; padding: 30px; 
                           max-width: 400px; width: 100%; box-shadow: 0 10px 30px rgba(0,0,0,0.3); 
                           text-align: center;">
                    <div style="font-size: 3rem; margin-bottom: 15px;">🚪</div>
                    <h3 style="color: #2c3e50; margin-bottom: 15px;">Cerrar Sesión</h3>
                    <p style="color: #6c757d; margin-bottom: 25px;">
                        ¿Estás seguro de que quieres cerrar tu sesión?
                    </p>
                    <div style="display: flex; gap: 10px; justify-content: center;">
                        <button onclick="window.location.href='LogoutServlet'" 
                                style="background: #dc3545; color: white; border: none; 
                                       padding: 10px 20px; border-radius: 6px; cursor: pointer; 
                                       font-weight: 500;">
                            Sí, Cerrar Sesión
                        </button>
                        <button onclick="this.closest('div[style*=\"position: fixed\"]').remove()" 
                                style="background: #6c757d; color: white; border: none; 
                                       padding: 10px 20px; border-radius: 6px; cursor: pointer;">
                            Cancelar
                        </button>
                    </div>
                </div>
            </div>
        `;
        
        document.body.insertAdjacentHTML('beforeend', confirmModal);
    }
    
    // Animación de entrada para las tarjetas
    document.addEventListener('DOMContentLoaded', function() {
        const cards = document.querySelectorAll('.function-card, .overview-card, .stat-card');
        
        cards.forEach((card, index) => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            
            setTimeout(() => {
                card.style.transition = 'all 0.6s ease';
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 100);
        });
    });
</script>

<%-- Incluir footer --%>
<%@include file="includes/footer.jsp" %>