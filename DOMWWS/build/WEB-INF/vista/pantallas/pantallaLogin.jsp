<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
    
    <br>
    <font size='5'><fmt:message key="formaLogin.titulo" /></font>

    <form id="forma" action="procesarLogin.dd" method="post">
        <table>
            <tr>
                <td colspan="2">
                   <html:errors />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaLogin.etiqueta.Usuario" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="user" 
                           size="50" 
                           maxlength="100" 
                           value="${formaLogin.user}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaLogin.etiqueta.Contrasena" />
                </td>
                <td align="left">
                    <input type="password" 
                           name="password" 
                           size="50" 
                           maxlength="100" 
                           value="${formaLogin.password}" />
                </td>
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" 
                           name="submit"
                           value="Login"/>
                     
                </td>
            </tr>
        </table>
    </form>