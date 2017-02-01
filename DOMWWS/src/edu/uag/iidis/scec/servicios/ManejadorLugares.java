package edu.uag.iidis.scec.servicios;

import java.util.Collection;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.uag.iidis.scec.modelo.Lugar;
import edu.uag.iidis.scec.excepciones.*;
import edu.uag.iidis.scec.persistencia.LugarDAO;
import edu.uag.iidis.scec.persistencia.hibernate.*;
import net.webservicex.*;
import java.util.ArrayList;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.NodeList;
public class ManejadorLugares {
    private Log log = LogFactory.getLog(ManejadorLugares.class);
    private LugarDAO dao;

    public ManejadorLugares() {
        dao = new LugarDAO();
    }


    public Collection listarLugares() {
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

	public Collection listarLugaresPorNombre(String nombre) {
        Collection resultado;

        if (log.isDebugEnabled()) {
            log.debug(">guardarUsuario(usuario)");
        }

        try {
            HibernateUtil.beginTransaction();
            resultado = dao.buscarLugar(nombre);
            HibernateUtil.commitTransaction();
            return resultado;         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
            return null;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    public Collection buscaEstado(String nombre) {
        Collection resultado;

        if (log.isDebugEnabled()) {
            log.debug(">guardarUsuario(usuario)");
        }

        try {
            HibernateUtil.beginTransaction();
            resultado = dao.buscarEstado(nombre);
            HibernateUtil.commitTransaction();
            return resultado;         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
            return null;
        } finally {
            HibernateUtil.closeSession();
        }
    }
	
    public void eliminarLugar(Long id) {
        if (log.isDebugEnabled()) {
            log.debug(">eliminarLugar(lugar)");
        }
        try {
            HibernateUtil.beginTransaction();           
            Lugar lugar = dao.buscarPorId(id, true);
            if (lugar != null) {
              dao.hazTransitorio(lugar);
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

    //cambios
    public Collection buscaImagen(String nombre) {
        Collection resultado;

        if (log.isDebugEnabled()) {
            log.debug(">guardarUsuario(usuario)");
        }

        try {
            HibernateUtil.beginTransaction();
            resultado = dao.buscarImagen(nombre);
            HibernateUtil.commitTransaction();
            return resultado;         
        } catch (ExcepcionInfraestructura e) {
            HibernateUtil.rollbackTransaction();
            return null;
        } finally {
            HibernateUtil.closeSession();
        }
    }

    public Collection getService(String pais,String path) {
        Collection<DataService> resultado=null;
        ArrayList<DataService> b =  new ArrayList<>();
        if (log.isDebugEnabled()) {
            log.debug(">guardarUsuario(usuario)");
        }
        String a = getCurrencyByCountry("Mexico");
        log.error(path);
        
        DataService d = new DataService(getData(a,path));
        b.add(d);
        resultado = b;
        return resultado;
    }

    public int crearLugar(Lugar lugar) {

        int resultado;

        if (log.isDebugEnabled()) {
            log.debug(">guardarLugar(lugar)");
        }

        try {
            HibernateUtil.beginTransaction();           
            
            if (dao.existeLugar(lugar.getNombre())) {
               resultado = 1; // Excepción. El nombre de ciudad ya existe
            } else {

               dao.hazPersistente(lugar);

               resultado = 0; // Exito. El ciudad se creo satisfactoriamente.
            }

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
    private static String getCurrencyByCountry(java.lang.String countryName) {
        Country service = new net.webservicex.Country();
        CountrySoap port = service.getCountrySoap();
        return port.getCurrencyByCountry(countryName);
    }

    public String getData(String cities,String path){
        String service ="";
        try {
            

            File fXmlFile = new File(path+"input.xml");
            FileWriter w = new FileWriter(fXmlFile);
            BufferedWriter bw = new BufferedWriter(w);
            PrintWriter wr = new PrintWriter(bw);
            wr.write(cities);
            wr.close();
            bw.close();
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory
                    .newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            org.w3c.dom.Document doc = dBuilder.parse(fXmlFile);
            NodeList nList = doc.getElementsByTagName("Table");
            
            int temp = 0;
            org.w3c.dom.Node nNode = nList.item(temp);
            service += nNode.getTextContent();


        } catch (Exception e) {
            e.printStackTrace();
        }
        return service;
    }
    
}
