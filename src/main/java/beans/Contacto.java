/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * Bean para representar un mensaje de contacto
 * @author LAB-USR-LNORTE
 */
public class Contacto implements Serializable {
    
    private int id;
    private String nombre;
    private String email;
    private String telefono;
    private String asunto;
    private String mensaje;
    private LocalDateTime fechaCreacion;
    private String estado; // pendiente, leido, respondido
    private int numeroTicket;
    
    // Constructor vacío
    public Contacto() {
        this.fechaCreacion = LocalDateTime.now();
        this.estado = "pendiente";
    }
    
    // Constructor con parámetros principales
    public Contacto(String nombre, String email, String asunto, String mensaje) {
        this();
        this.nombre = nombre;
        this.email = email;
        this.asunto = asunto;
        this.mensaje = mensaje;
        this.numeroTicket = generarNumeroTicket();
    }
    
    // Constructor completo
    public Contacto(String nombre, String email, String telefono, String asunto, String mensaje) {
        this(nombre, email, asunto, mensaje);
        this.telefono = telefono;
    }
    
    // Método para generar número de ticket
    private int generarNumeroTicket() {
        return (int) (Math.random() * 900000) + 100000;
    }
    
    // Getters y Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getNombre() {
        return nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getTelefono() {
        return telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
    public String getAsunto() {
        return asunto;
    }
    
    public void setAsunto(String asunto) {
        this.asunto = asunto;
    }
    
    public String getMensaje() {
        return mensaje;
    }
    
    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }
    
    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }
    
    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
    
    public String getEstado() {
        return estado;
    }
    
    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    public int getNumeroTicket() {
        return numeroTicket;
    }
    
    public void setNumeroTicket(int numeroTicket) {
        this.numeroTicket = numeroTicket;
    }
    
    // Método para obtener descripción del asunto
    public String getAsuntoDescripcion() {
        switch (this.asunto) {
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
                return this.asunto;
        }
    }
    
    @Override
    public String toString() {
        return "Contacto{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", email='" + email + '\'' +
                ", telefono='" + telefono + '\'' +
                ", asunto='" + asunto + '\'' +
                ", mensaje='" + mensaje + '\'' +
                ", fechaCreacion=" + fechaCreacion +
                ", estado='" + estado + '\'' +
                ", numeroTicket=" + numeroTicket +
                '}';
    }
}