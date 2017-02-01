package edu.uag.iidis.scec.persistencia;

import org.hibernate.*;
import org.hibernate.type.*;
import org.hibernate.criterion.Example;
//import org.hibernate.classic.*;


import edu.uag.iidis.scec.excepciones.ExcepcionInfraestructura;
import edu.uag.iidis.scec.modelo.Recomendacion;
import edu.uag.iidis.scec.persistencia.hibernate.HibernateUtil;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.Collection;
import java.util.List;


public class RecomendacionDAO {

    private Log log = LogFactory.getLog(RecomendacionDAO.class);

    public RecomendacionDAO() {
    }


    public Recomendacion buscarPorId(Long idRecomendacion, boolean bloquear)
            throws ExcepcionInfraestructura {

        Recomendacion recomendacion = null;

        if (log.isDebugEnabled()) {
            log.debug(">buscarPorID(" + idRecomendacion + ", " + bloquear + ")");
        }

        try {
            if (bloquear) {
                recomendacion = (Recomendacion)HibernateUtil.getSession()
                                                .load(Recomendacion.class, 
                                                      idRecomendacion, 
                                                      LockMode.UPGRADE);
            } else {
                recomendacion = (Recomendacion)HibernateUtil.getSession()
                                                .load(Recomendacion.class,
                                                      idRecomendacion);
            }
        } catch (HibernateException ex) {
            if (log.isWarnEnabled()) {
                log.warn("<HibernateException");
            }

            throw new ExcepcionInfraestructura(ex);
        }
        return recomendacion;
    }


    public Collection buscarTodos()
            throws ExcepcionInfraestructura {

        Collection recomendaciones;

        if (log.isDebugEnabled()) {
            log.debug(">buscarTodos()");
        }

        try {
            recomendaciones = HibernateUtil.getSession()
                                    .createCriteria(Recomendacion.class)
                                    .list();
                                    
              log.debug(">buscarTodos() ---- list   " + recomendaciones.size());
			log.debug(">buscarTodos() ---- contenido   " + recomendaciones);
        } catch (HibernateException e) {
            if (log.isWarnEnabled()) {
                log.warn("<HibernateException");
            }
            throw new ExcepcionInfraestructura(e);
        }
        return recomendaciones;
    }


    public Collection buscarPorEjemplo(Recomendacion recomendacion)
            throws ExcepcionInfraestructura {


        Collection recomendaciones;
 
        if (log.isDebugEnabled()) {
            log.debug(">buscarPorEjemplo()");
        }

        try {
            Criteria criteria = HibernateUtil.getSession()
                                             .createCriteria(Recomendacion.class);
            recomendaciones = criteria.add(Example.create(recomendacion)).list();
        } catch (HibernateException e) {
            if (log.isWarnEnabled()) {
                log.warn("<HibernateException");
            }
            throw new ExcepcionInfraestructura(e);
        }
        return recomendaciones;
    }


    public void hazPersistente(Recomendacion recomendacion)
            throws ExcepcionInfraestructura {

        if (log.isDebugEnabled()) {
            log.debug(">hazPersistente(recomendacion)");
        }

        try {
            HibernateUtil.getSession().saveOrUpdate(recomendacion);
        } catch (HibernateException e) {
            if (log.isWarnEnabled()) {
                log.warn("<HibernateException");
            }
            throw new ExcepcionInfraestructura(e);
        }
    }


    public void hazTransitorio(Recomendacion recomendacion)
            throws ExcepcionInfraestructura {

        if (log.isDebugEnabled()) {
            log.debug(">hazTransitorio(recomendacion)");
        }

        try {
            HibernateUtil.getSession().delete(recomendacion);
        } catch (HibernateException e) {
            if (log.isWarnEnabled()) {
                log.warn("<HibernateException");
            }
            throw new ExcepcionInfraestructura(e);
        }
    }

    public boolean existeRecomendacion(String nombreRecomendacion)
            throws ExcepcionInfraestructura {

        if (log.isDebugEnabled()) {
            log.debug(">existeRol(nombreRol)");
        }

        try {
            
            
//            String consultaCuentaRoles =
//            "select count(*) from Ciudad r where r.nombre=?";
//
 //           int resultado =
 //           ((Integer) HibernateUtil.getSession()
 //                          .find(consultaCuentaRoles, 
 //                                nombreRol,
 //                                StringType.INSTANCE)
 //                          .iterator()
 //                          .next()).intValue();
// de acuerdo al nuevo formato
 
            String hql = "select nombre from Recomendacion where nombre = :nombre";
            
             if (log.isDebugEnabled()) {
                 log.debug(hql + nombreRecomendacion);
            }
        
            Query query = HibernateUtil.getSession()
                                        .createQuery(hql);
            if (log.isDebugEnabled()) {
                 log.debug("<<<<<<<<< create query ok " );
            }

            query.setParameter("nombre", nombreRecomendacion);
            if (log.isDebugEnabled()) {
                 log.debug("<<<<<<<<< set Parameter ok antes del query list >>>>>");
            }
            List results = query.list();
            int resultado = results.size();
            if (log.isDebugEnabled()) {
                 log.debug("<<<<<<<<< Result size " + resultado);
            }
            if (resultado == 0) {
               return false;
            }
            
            return true;

        } catch (HibernateException ex) {
            if (log.isWarnEnabled()) {
                log.warn("<HibernateException *******************");
            }
            throw new ExcepcionInfraestructura(ex);
        }
    }

    public Collection buscaRecomendacion(String nombreLugar)
            throws ExcepcionInfraestructura {
                
        if (log.isDebugEnabled()) {
            log.debug(">existeRol(nombreRol)");
        }

        try {
            String hql = "from Recomendacion where nombre = '"+nombreLugar+"'";
            
             if (log.isDebugEnabled()) {
                 log.debug(hql + nombreLugar);
            }
        
            Query query = HibernateUtil.getSession()
                                        .createQuery(hql);
            if (log.isDebugEnabled()) {
                 log.debug("<<<<<<<<< create query ok " );
            }

            
            if (log.isDebugEnabled()) {
                 log.debug("<<<<<<<<< set Parameter ok antes del query list >>>>>");
            }
            List results = query.list();
            int resultado = results.size();
            if (log.isDebugEnabled()) {
                 log.debug("<<<<<<<<< Result size " + resultado);
            }
            if (resultado == 0) {
               return results;
            }
            
            return results;

        } catch (HibernateException ex) {
            if (log.isWarnEnabled()) {
                log.warn("<HibernateException *******************");
            }
            throw new ExcepcionInfraestructura(ex);
        }
    }


}
