    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>


    <br>
    <font size='5'><fmt:message key="formaNuevoPais.titulo" /></font>

    <form id="forma" action="procesarRegistroPais.do" method="post">
        <table>
            <tr>
                <td colspan="2">
                   <html:errors />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoPais.etiqueta.nombre" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="nombre" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoPais.nombre}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoPais.etiqueta.descripcion" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="descripcion" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoPais.descripcion}" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" 
                           name="submit"
                           value="Agregar y terminar"/>
                    <input type="submit" 
                           name="submit"
                           value="Agregar y volver"
                           onclick="forma.action='procesarRegistroPais.do?volver=si'"/>
                    <input type="button"
                           value="Reset"
                           onclick="location.href='solicitarRegistroPais.do'" />
                    <input type="submit" 
                           name="org.apache.struts.taglib.html.CANCEL" 
                           value="cancelar" 
                           onclick="bCancel=true;">    
                </td>
            </tr>
        </table>
    </form>