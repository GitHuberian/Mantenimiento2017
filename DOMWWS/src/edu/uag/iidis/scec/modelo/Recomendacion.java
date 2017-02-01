package edu.uag.iidis.scec.modelo;

import java.io.Serializable;
import java.util.*;
import java.util.Date;

/**
 * 
 *  
 *
 * <p><a href="calificacion.java.html"><i>Ver código fuente</i></a></p>
 *
 * @author <a href="mailto:vramos@uag.mx">Victor Ramos</a>
 * @version 1.0
 */
public class Recomendacion extends ClaseBase 
        implements Serializable {

    private Long id;
    private String nombre;
    private String estado;
    private String usuario;
	private String fecha;
	private String comentario;
	private Long calificacion;


    public Recomendacion() {
    }

    public Recomendacion(Long id){
        this.id = id;
    }

    public Recomendacion(String nombre,String estado, String usuario,String fecha,String comentario,Long calificacion){
        this.nombre=nombre;
        this.estado=estado;
        this.usuario=usuario;
		this.fecha=fecha;
		this.comentario=comentario;
		this.calificacion=calificacion;
    }

    /**
     * Regresa el id del Recomendacion.
     * @return Long
     */
    public Long getId() {
        return this.id;
    }

    /**
     * Establece el id del Recomendacion.
     * @return void
     */
    public void setId(Long id) {
        this.id = id;
    }


    /**
     * Regresa el nombre del Recomendacion.
     * @return String
     */
    public String getNombre() {
        return this.nombre;
    }
    public String getEstado() {
        return this.estado;
    }
	public String getUsuario() {
        return this.usuario;
    }
	public String getFecha() {
        return this.fecha;
    }
	public String getComentario() {
        return this.comentario;
    }
	public Long getCalificacion() {
        return this.calificacion;
    }

    /**
     * Establece el nombre del Recomendacion.
     * @return void
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setEstado(String estado) {
        this.estado = estado;
    }
	public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
	public void setFecha(String fecha) {
        this.fecha = fecha;
    }
	public void setComentario(String comentario) {
        this.comentario = comentario;
    }
	public void setCalificacion(Long calificacion) {
        this.calificacion = calificacion;
    }
    
    /**
     * Regresa la descripción del Recomendacion.
     * @return String
     */
    

    /**
     * Establece la descripción del Recomendacion.
     * @return void
     */
    


}