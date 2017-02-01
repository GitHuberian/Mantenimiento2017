package edu.uag.iidis.scec.servicios;

import java.util.Collection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.uag.iidis.scec.modelo.Recomendacion;
import edu.uag.iidis.scec.excepciones.*;
import edu.uag.iidis.scec.persistencia.RecomendacionDAO;
import edu.uag.iidis.scec.persistencia.hibernate.*;

public class ManejadorRecomendaciones {
    private Log log = LogFactory.getLog(ManejadorRecomendaciones.class);
    private RecomendacionDAO dao;

    public ManejadorRecomendaciones() {
        dao = new RecomendacionDAO();
    }


    public Collection listarRecomendaciones() {
        Collection resultado;

        if (log.isDebugEnabled()) {
            log.debug(">guardarUsuario(usuario)");
        }

        try {
            HibernateUtil.beginTransaction();
            resultado = dao.buscarTodos();
            HibernateUtil.commitTransaction();
            return resultado;         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
            return null;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    public void eliminarRecomendacion(Long id) {
        if (log.isDebugEnabled()) {
            log.debug(">eliminarRecomendacion(recomendacion)");
        }
        try {
            HibernateUtil.beginTransaction();           
            Recomendacion recomendacion = dao.buscarPorId(id, true);
            if (recomendacion != null) {
              dao.hazTransitorio(recomendacion);
            }
            HibernateUtil.commitTransaction();
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
            if (log.isWarnEnabled()) {
                log.warn("<ExcepcionInfraestructura");
            }
        } finally {
            HibernateUtil.closeSession();
        }

    }

    public int crearRecomendacion(Recomendacion recomendacion) {

        int resultado;

        if (log.isDebugEnabled()) {
            log.debug(">guardarRecomendacion(recomendacion)");
        }

        try {
            HibernateUtil.beginTransaction();           
            
            

               dao.hazPersistente(recomendacion);

               resultado = 0; // Exito. El ciudad se creo satisfactoriamente.
            

            HibernateUtil.commitTransaction();

        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();

            if (log.isWarnEnabled()) {
                log.warn("<ExcepcionInfraestructura");
            }
            resultado = 2;    // Excepción. Falla en la infraestructura
        } finally {
            HibernateUtil.closeSession();
        }
        return resultado;
    }

    public Collection listarRecomendacionPorNombre(String nombre) {
        Collection resultado;

        if (log.isDebugEnabled()) {
            log.debug(">guardarUsuario(usuario)");
        }

        try {
            HibernateUtil.beginTransaction();
            resultado = dao.buscaRecomendacion(nombre);
            log.debug("Consulta "+resultado);
            HibernateUtil.commitTransaction();
            return resultado;         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
            return null;
        } finally {
            HibernateUtil.closeSession();
        }
    }


}
