<%--  
    Document   : formulario-libreclamaciones  
    Created on : 7 set. 2025, 11:53:13 p. m.  
    Author     : Moisés  
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Libro de Reclamaciones</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
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
            margin-bottom: 30px;
        }
        section {
            margin-bottom: 30px;
        }
        h3 {
            color: #333;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #333;
        }
        input, select, textarea {
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Libro de Reclamaciones</h2>
        <form action="procesarReclamacion.jsp" method="post">
            
            <!-- Identificación del consumidor -->
            <section>
                <h3>Datos del Cliente</h3>
                <label for="nombre">Nombre completo</label>
                <input type="text" id="nombre" name="nombre">

                <label for="domicilio">Domicilio</label>
                <input type="text" id="domicilio" name="domicilio">

                <label for="dni">DNI / CE</label>
                <input type="text" id="dni" name="dni">

                <label for="telefono">Teléfono</label>
                <input type="text" id="telefono" name="telefono">

                <label for="correo">Correo electrónico</label>
                <input type="email" id="correo" name="correo">
            </section>

            <!-- Identificación del bien contratado -->
            <section>
                <h3>Información del Vehículo o Servicio</h3>
                <label for="tipoBien">Tipo de Bien</label>
                <select id="tipoBien" name="tipoBien">
                    <option value="auto-nuevo">Auto nuevo</option>
                    <option value="auto-usado">Auto usado</option>
                    <option value="financiamiento">Financiamiento</option>
                </select>

                <label for="modelo">Modelo del vehículo</label>
                <input type="text" id="modelo" name="modelo">

                <label for="monto">Monto reclamado (S/)</label>
                <input type="number" id="monto" name="monto" step="0.01">

                <label for="descripcionBien">Descripción del bien o servicio</label>
                <textarea id="descripcionBien" name="descripcionBien" rows="4"></textarea>
            </section>

            <!-- Detalle de la reclamación -->
            <section>
                <h3>Detalle de la Reclamación</h3>
                <label for="tipoReclamo">Tipo</label>
                <select id="tipoReclamo" name="tipoReclamo">
                    <option value="reclamo">Reclamo</option>
                    <option value="queja">Queja</option>
                </select>

                <label for="detalle">Detalle del reclamo</label>
                <textarea id="detalle" name="detalle" rows="5"></textarea>

                <label for="pedido">Pedido del cliente</label>
                <textarea id="pedido" name="pedido" rows="4"></textarea>
            </section>

            <button type="submit" class="btn">Enviar Hoja de Reclamación</button>
        </form>
    </div>
</body>
</html>
