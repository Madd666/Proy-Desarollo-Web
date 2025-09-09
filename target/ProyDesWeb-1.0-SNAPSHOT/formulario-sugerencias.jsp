<%--  
    Document   : formulario_sugerencias  
    Created on : 7 set. 2025, 11:24:14 p. m.  
    Author     : Moisés  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario de Sugerencias</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                background-color: #f5f7fa;
                margin: 0;
                padding: 0;
            }
            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 0 12px rgba(0,0,0,0.08);
                border-top: 5px solid #0056b3;
            }
            h2 {
                text-align: center;
                color: #0056b3;
                margin-bottom: 10px;
            }
            p.subtitulo {
                text-align: center;
                color: #666;
                margin-bottom: 30px;
            }
            label {
                display: block;
                margin-top: 15px;
                font-weight: 600;
                color: #333;
            }
            input, textarea {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            textarea {
                resize: vertical;
            }
            .btn {
                background-color: #0056b3;
                color: white;
                border: none;
                padding: 12px;
                margin-top: 25px;
                width: 100%;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }
            .btn:hover {
                background-color: #003d80;
            }
            .contacto {
                margin-top: 30px;
                font-size: 14px;
                color: #444;
                background-color: #f0f0f0;
                padding: 15px;
                border-radius: 5px;
            }
            .contacto p {
                margin: 5px 0;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Sugerencias</h2>
            <p class="subtitulo">Compártenos tus ideas para mejorar el sistema</p>
            <form action="procesarSugerencia.jsp" method="post">
                <label for="nombre">Nombres y Apellidos</label>
                <input type="text" id="nombre" name="nombre" placeholder="Nombre">

                <label for="correo">Correo electrónico</label>
                <input type="email" id="correo" name="correo" placeholder="ejemplo@gmail.com">

                <label for="sugerencia">Coloque sus sugerencias</label>
                <textarea id="sugerencia" name="sugerencia" rows="6" placeholder="Escribe tu sugerencia aquí..."></textarea>

                <button type="submit" class="btn">Enviar</button>
            </form>

            <div class="contacto">
                <p><strong>Dirección:</strong> Av. Universitaria 1801, San Miguel, Lima - Perú</p>
                <p><strong>Teléfono:</strong> (01) 626-2000</p>
                <p><strong>Email:</strong> info@empresa.com</p>
            </div>
        </div>
    </body>
</html>
