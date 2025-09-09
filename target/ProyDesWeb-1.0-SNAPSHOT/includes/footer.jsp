<%-- 
    Document   : footer.jsp
    Created on : Componente modular de pie de página
    Author     : LAB-USR-LNORTE
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        </div> <!-- Cierra content-wrapper -->
    </main> <!-- Cierra main-container -->
    
    <footer class="main-footer">
    <div class="footer-container">
        <div class="footer-grid">
            <!-- Sección de información de la empresa -->
            <div class="footer-section">
                <h4>Sistema Web</h4>
                <p>Plataforma integral para gestión de procesos empresariales con tecnología moderna y segura.</p>
                <div class="footer-social">
                    <a href="#" title="Facebook">📘</a>
                    <a href="#" title="Twitter">🐦</a>
                    <a href="#" title="LinkedIn">💼</a>
                    <a href="#" title="Email">📧</a>
                </div>
            </div>
            
            <!-- Sección de enlaces rápidos -->
            <div class="footer-section">
                <h4>Enlaces Rápidos</h4>
                <ul class="footer-links">
                    <li><a href="index.jsp">Inicio</a></li>
                    <% if (usuario != null) { %>
                        <li><a href="dashboard.jsp">Dashboard</a></li>
                    <% } %>
                    <li><a href="preguntas-frecuentes.jsp">Preguntas Frecuentes</a></li>
                    <li><a href="contactenos.jsp">Contáctenos</a></li>
                    <li><a href="formulario-sugerencias.jsp">Enviar Sugerencias</a></li> 
                    <li><a href="formulario-libreclamaciones.jsp">Libro de reclamaciones</a></li>  
                </ul>
            </div>
            
            <!-- Sección de contacto -->
            <div class="footer-section">
                <h4>Información de Contacto</h4>
                <div class="footer-contact">
                    <p><strong>Dirección:</strong><br>
                    Av. Universitaria 1801<br>
                    San Miguel, Lima - Perú</p>
                    
                    <p><strong>Teléfono:</strong><br>
                    (01) 626-2000</p>
                    
                    <p><strong>Email:</strong><br>
                    info@empresa.com</p>
                </div>
            </div>
            
            <!-- Sección de horarios -->
            <div class="footer-section">
                <h4>Horario de Atención</h4>
                <div class="footer-schedule">
                    <p><strong>Lunes a Viernes:</strong><br>
                    8:00 AM - 6:00 PM</p>
                    
                    <p><strong>Sábados:</strong><br>
                    9:00 AM - 1:00 PM</p>
                    
                    <p><strong>Domingos:</strong><br>
                    Cerrado</p>
                </div>
            </div>
        </div>
        
        <!-- Línea de separación -->
        <div class="footer-divider"></div>
        
        <!-- Copyright y información legal -->
        <div class="footer-bottom">
            <div class="footer-copyright">
                <p>&copy; <%= java.time.Year.now().getValue() %> Sistema Web. Todos los derechos reservados.</p>
                <p>Desarrollado con tecnología Java - JSP | Versión 1.0</p>
            </div>
            
            <div class="footer-legal">
                <a href="#" onclick="alert('Política de Privacidad - Próximamente')">Política de Privacidad</a>
                <span class="separator">|</span>
                <a href="#" onclick="alert('Términos y Condiciones - Próximamente')">Términos y Condiciones</a>
                <span class="separator">|</span>
                <a href="contactenos.jsp">Soporte</a>
            </div>
        </div>
    </div>
    </footer>
    
    <style>
        /* Estilos específicos del footer */
        .main-footer {
            background: linear-gradient(135deg, #2c3e50, #34495e);
            color: #ecf0f1;
            margin-top: 40px;
            padding: 40px 0 20px 0;
        }
        
        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        .footer-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            margin-bottom: 30px;
        }
        
        .footer-section h4 {
            color: #3498db;
            margin-bottom: 15px;
            font-size: 1.1rem;
            font-weight: 600;
        }
        
        .footer-section p {
            line-height: 1.6;
            margin-bottom: 10px;
            color: #bdc3c7;
        }
        
        .footer-social {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        .footer-social a {
            display: inline-block;
            width: 35px;
            height: 35px;
            text-align: center;
            line-height: 35px;
            background-color: rgba(52, 152, 219, 0.2);
            border-radius: 50%;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .footer-social a:hover {
            background-color: #3498db;
            transform: translateY(-2px);
        }
        
        .footer-links {
            list-style: none;
            padding: 0;
        }
        
        .footer-links li {
            margin-bottom: 8px;
        }
        
        .footer-links a {
            color: #bdc3c7;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .footer-links a:hover {
            color: #3498db;
        }
        
        .footer-contact p,
        .footer-schedule p {
            margin-bottom: 12px;
            font-size: 0.9rem;
        }
        
        .footer-divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #34495e, transparent);
            margin: 20px 0;
        }
        
        .footer-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .footer-copyright p {
            margin: 0;
            font-size: 0.85rem;
            color: #95a5a6;
        }
        
        .footer-legal {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .footer-legal a {
            color: #95a5a6;
            text-decoration: none;
            font-size: 0.85rem;
            transition: color 0.3s ease;
        }
        
        .footer-legal a:hover {
            color: #3498db;
        }
        
        .footer-legal .separator {
            color: #7f8c8d;
            margin: 0 5px;
        }
        
        /* Responsive para footer */
        @media (max-width: 768px) {
            .footer-grid {
                grid-template-columns: 1fr;
                gap: 25px;
            }
            
            .footer-bottom {
                flex-direction: column;
                text-align: center;
            }
            
            .footer-legal {
                flex-wrap: wrap;
                justify-content: center;
            }
        }
        
        /* Asegurar que el footer esté al final */
        html, body {
            height: 100%;
        }
        
        body {
            display: flex;
            flex-direction: column;
        }
        
        .main-container {
            flex: 1;
        }
    </style>
    
    <!-- Scripts globales del sistema -->
    <script>
        // Función para mostrar alertas personalizadas
        function mostrarAlerta(mensaje, tipo = 'info') {
            const alerta = document.createElement('div');
            alerta.className = `alert alert-${tipo}`;
            alerta.textContent = mensaje;
            alerta.style.position = 'fixed';
            alerta.style.top = '20px';
            alerta.style.right = '20px';
            alerta.style.zIndex = '9999';
            alerta.style.maxWidth = '400px';
            alerta.style.boxShadow = '0 4px 12px rgba(0,0,0,0.2)';
            
            document.body.appendChild(alerta);
            
            // Auto-remover después de 5 segundos
            setTimeout(() => {
                if (alerta.parentNode) {
                    alerta.parentNode.removeChild(alerta);
                }
            }, 5000);
        }
        
        // Confirmar navegación si hay cambios sin guardar
        let hayFormularioModificado = false;
        
        function marcarFormularioModificado() {
            hayFormularioModificado = true;
        }
        
        function confirmarSalida(event) {
            if (hayFormularioModificado) {
                event.returnValue = '¿Estás seguro de que quieres salir? Los cambios no guardados se perderán.';
                return event.returnValue;
            }
        }
        
        window.addEventListener('beforeunload', confirmarSalida);
        
        // Función para validar formularios
        function validarFormulario(formulario) {
            const campos = formulario.querySelectorAll('input[required], select[required], textarea[required]');
            let esValido = true;
            
            campos.forEach(campo => {
                if (!campo.value.trim()) {
                    campo.style.borderColor = '#dc3545';
                    esValido = false;
                } else {
                    campo.style.borderColor = '#e9ecef';
                }
            });
            
            return esValido;
        }
        
        // Actualizar el año en el copyright automáticamente
        document.addEventListener('DOMContentLoaded', function() {
            const elementos = document.querySelectorAll('.footer-copyright p:first-child');
            elementos.forEach(elemento => {
                if (elemento.textContent.includes('©')) {
                    elemento.innerHTML = elemento.innerHTML.replace(/© \d{4}/, '© ' + new Date().getFullYear());
                }
            });
        });
    </script>
</body>
</html>
