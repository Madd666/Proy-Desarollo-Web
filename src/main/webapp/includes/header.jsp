<%-- 
    Document   : header.jsp
    Created on : Componente modular de encabezado
    Author     : LAB-USR-LNORTE
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle != null ? pageTitle : 'Sistema Web'}</title>
    
    <!-- CSS Global del Sistema -->
    <style>
        /* Reset y estilos base */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body { 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }
        
        /* Header principal */
        .main-header {
            background: linear-gradient(135deg, #007bff, #0056b3);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        
        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo-section h1 {
            font-size: 1.8rem;
            font-weight: bold;
        }
        
        .logo-section p {
            font-size: 0.9rem;
            opacity: 0.9;
            margin-top: 2px;
        }
        
        /* Navegación principal */
        .main-navigation {
            background-color: rgba(255,255,255,0.1);
            backdrop-filter: blur(10px);
        }
        
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
        }
        
        .nav-menu li {
            margin-right: 2px;
        }
        
        .nav-menu a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border-radius: 4px 4px 0 0;
        }
        
        .nav-menu a:hover, .nav-menu a.active {
            background-color: rgba(255,255,255,0.2);
            transform: translateY(-1px);
        }
        
        /* Información de usuario */
        .user-info {
            display: flex;
            align-items: center;
            gap: 15px;
        }
        
        .user-welcome {
            font-size: 0.9rem;
            opacity: 0.9;
        }
        
        .user-actions a {
            background-color: rgba(255,255,255,0.2);
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.3s ease;
        }
        
        .user-actions a:hover {
            background-color: rgba(255,255,255,0.3);
            transform: translateY(-1px);
        }
        
        /* Container principal */
        .main-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            min-height: calc(100vh - 200px);
        }
        
        .content-wrapper {
            padding: 30px;
        }
        
        /* Breadcrumb */
        .breadcrumb {
            background-color: #e9ecef;
            padding: 10px 30px;
            border-radius: 8px 8px 0 0;
            border-bottom: 1px solid #dee2e6;
        }
        
        .breadcrumb a {
            color: #6c757d;
            text-decoration: none;
            margin-right: 5px;
        }
        
        .breadcrumb a:hover {
            color: #007bff;
        }
        
        .breadcrumb .current {
            color: #007bff;
            font-weight: 500;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 10px;
            }
            
            .nav-menu {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .nav-menu a {
                padding: 10px 15px;
                font-size: 0.9rem;
            }
            
            .main-container {
                margin: 10px;
                border-radius: 0;
            }
            
            .content-wrapper {
                padding: 20px;
            }
        }
        
        /* Estilos para formularios */
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #495057;
        }
        
        .form-group input, 
        .form-group select, 
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 2px solid #e9ecef;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus, 
        .form-group select:focus, 
        .form-group textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 3px rgba(0,123,255,0.1);
            outline: none;
        }
        
        /* Botones */
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s ease;
            text-align: center;
        }
        
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        
        .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        
        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }
        
        .btn-secondary:hover {
            background-color: #545b62;
        }
        
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        
        .btn-danger:hover {
            background-color: #c82333;
        }
        
        /* Alertas */
        .alert {
            padding: 15px;
            margin: 20px 0;
            border-radius: 6px;
            font-weight: 500;
        }
        
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .alert-info {
            background-color: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }
    </style>
</head>
<body>
    <header class="main-header">
        <div class="header-container">
            <div class="logo-section">
                <h1>Sistema Web</h1>
                <p>Gestión integral de procesos</p>
            </div>
            
            <div class="user-info">
                <% 
                HttpSession sesion = request.getSession(false);
                String usuario = (sesion != null) ? (String) sesion.getAttribute("user") : null;
                
                if (usuario != null) { %>
                    <span class="user-welcome">Bienvenido, <strong><%= usuario %></strong></span>
                    <div class="user-actions">
                        <a href="LogoutServlet">Cerrar Sesión</a>
                    </div>
                <% } else { %>
                    <div class="user-actions">
                        <a href="index.jsp">Iniciar Sesión</a>
                    </div>
                <% } %>
            </div>
        </div>
        
        <nav class="main-navigation">
            <div class="nav-container">
                <ul class="nav-menu">
                    <li><a href="index.jsp" class="${currentPage == 'index' ? 'active' : ''}">Inicio</a></li>
                    <% if (usuario != null) { %>
                        <li><a href="dashboard.jsp" class="${currentPage == 'dashboard' ? 'active' : ''}">Dashboard</a></li>
                    <% } %>
                    <li><a href="preguntas-frecuentes.jsp" class="${currentPage == 'faq' ? 'active' : ''}">Preguntas Frecuentes</a></li>
                    <li><a href="contactenos.jsp" class="${currentPage == 'contacto' ? 'active' : ''}">Contáctenos</a></li>
                </ul>
            </div>
        </nav>
    </header>
    
    <main class="main-container">
        <% if (request.getAttribute("showBreadcrumb") != null && (Boolean) request.getAttribute("showBreadcrumb")) { %>
            <div class="breadcrumb">
                <%= request.getAttribute("breadcrumbContent") != null ? request.getAttribute("breadcrumbContent") : "" %>
            </div>
        <% } %>
        
        <div class="content-wrapper">
            <!-- El contenido de cada página va aquí -->