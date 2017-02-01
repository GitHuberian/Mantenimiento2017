package edu.uag.iidis.scec.vista;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;
import org.apache.struts.upload.FormFile;

/**
 * Form bean para el registro de una nueva persona.
 *
 * @author Victor Ramos
 */
public final class FormaNuevoLugar
        extends ValidatorForm {

    private String nombre;
    private String descripcion;
	private Long poblacion;
	private String coordenadas;
	private String estado;
    private String pais;
    private String moneda;
	Collection estados;
    private FormFile imagen;
    

    public String getNombre() {
        return (this.nombre);
    }
    public FormFile getImagen() {
        return (this.imagen);
    }
    public String getDescripcion() {
        return (this.descripcion);
    }
	public Long getPoblacion() {
        return (this.poblacion);
    }
	public String getCoordenadas() {
        return (this.coordenadas);
    }
	public String getEstado() {
        return (this.estado);
    }
    public String getPais() {
        return (this.pais);
    }
    public String getMoneda() {
        return (this.moneda);
    }
	public Collection getEstados(){
		return (this.estados);
	}
	
	public void setEstados(Collection estados) {
        this.estados = estados;
    }
	public void setNombre(String nombre) {
        this.nombre = nombre;
    }
	
	public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
	public void setImagen(FormFile imagen) {
        this.imagen = imagen;
    }
	public void setPoblacion(Long poblacion) {
        this.poblacion = poblacion;
    }
	public void setCoordenadas(String coordenadas) {
        this.coordenadas = coordenadas;
    }
	public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }
    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }
	
    public void reset(ActionMapping mapping,
                      HttpServletRequest request) {
        nombre=null;
        descripcion=null;
    }


    public ActionErrors validate(ActionMapping mapping,
                                 HttpServletRequest request) {

        // Ejecuta las validaciones proporcionadas por Struts-Validator
        ActionErrors errores = super.validate(mapping, request);

        // Validaciones no cubiertas por Struts-Validator

        return errores;

    }

}
