package edu.uag.iidis.scec.modelo;

import java.io.Serializable;
import java.util.*;


/**
 * Esta clase es usada para representar un rol de un
 * usuario. 
 *
 * <p><a href="Estado.java.html"><i>Ver código fuente</i></a></p>
 *
 * @author <a href="mailto:vramos@uag.mx">Victor Ramos</a>
 * @version 1.0
 */
public class Pais extends ClaseBase 
        implements Serializable {

    private Long id;
    private String nombre;
    private String descripcion;


    public Pais() {
    }

    public Pais(Long id){
        this.id = id;
    }

    public Pais(String nombre, String descripcion){
        this.nombre=nombre;
        this.descripcion=descripcion;
    }

    /**
     * Regresa el id del Pais.
     * @return Long
     */
    public Long getId() {
        return this.id;
    }

    /**
     * Establece el id del Pais.
     * @return void
     */
    public void setId(Long id) {
        this.id = id;
    }


    /**
     * Regresa el nombre del Pais.
     * @return String
     */
    public String getNombre() {
        return this.nombre;
    }

    /**
     * Establece el nombre del Pais.
     * @return void
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    /**
     * Regresa la descripción del Pais.
     * @return String
     */
    public String getDescripcion() {
        return this.descripcion;
    }

    /**
     * Establece la descripción del Pais.
     * @return void
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }


}