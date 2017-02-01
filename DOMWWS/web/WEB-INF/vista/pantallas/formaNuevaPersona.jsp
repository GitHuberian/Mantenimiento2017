    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>


    <br>
    <font size='5'><fmt:message key="formaNuevaPersona.titulo" /></font>

    <form id="forma" action="procesarRegistro.do" method="post">
        <table>
            <tr>
                <td colspan="2">
                   <html:errors />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.prefijo" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="prefijo" 
                           size="12" 
                           maxlength="12" 
                           value="${formaNuevaPersona.prefijo}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.nombre" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="nombre" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevaPersona.nombre}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.apellidoPaterno" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="apellidoPaterno" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevaPersona.apellidoPaterno}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.apellidoMaterno" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="apellidoMaterno" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevaPersona.apellidoMaterno}" />
                </td>
            </tr>
      <!---    /cidades --->      
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.ciudades" />
                </td>
                <td align="left">
       				<select name="ciudad">
                        <c:forEach var="rol" items="${formaNuevaPersona.ciudades}">
    		            <option value="${rol.nombre}">"${rol.descripcion}"</option>
            			</c:forEach>
                     </select>
                </td>
            </tr>
            
            
            
            
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.nombreUsuario" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="nombreUsuario" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevaPersona.nombreUsuario}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.claveAcceso" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="claveAcceso" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevaPersona.claveAcceso}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevaPersona.etiqueta.claveAccesoConfirmacion" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="claveAccesoConfirmacion" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevaPersona.claveAccesoConfirmacion}" />
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
                           onclick="forma.action='procesarRegistro.do?volver=si'"/>
                    <input type="button"
                           value="Reset"
                           onclick="location.href='solicitarRegistro.do'" />
                    <input type="submit" 
                           name="org.apache.struts.taglib.html.CANCEL" 
                           value="Cancelar" 
                           onclick="bCancel=true;">    
                </td>
            </tr>
        </table>
    </form>



