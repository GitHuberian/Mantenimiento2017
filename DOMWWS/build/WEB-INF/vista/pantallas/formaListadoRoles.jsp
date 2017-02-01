    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
<style>
  .HipervinculoAdmon{
    color:#000000;
	text-decoration:none;
  }
  
  .HipervinculoAdmon:hover{
    color:#006666;
	text-decoration:underline;
  }
</style>
<script language="javascript" type="text/javascript">
<!--
  function EliminarRol(strRolName){
    return confirm("¿Desea eliminar el rol '" + strRolName + "'?")
  }
-->
</script>
    <br>
    <font size='5'><fmt:message key="formaListadoRoles.titulo" /></font>
    <table cellpadding="0" cellspacing="0" width="60%" border="0">
        <tr>
            <td colspan="4" style="padding-top:25px; padding-bottom:25px;">
                <a href="solicitarRegistroRol.do" class="HipervinculoAdmon">Agregar nuevo rol...</a>
            </td>
        </tr>
        <tr>
            <td colspan="4">
               <html:errors />
            </td>
        </tr>
        <tr bgcolor="#CCCCCC">
         <td><b><fmt:message key="formaListadoRoles.etiqueta.nombre" /></b></td>
         <td style="border-right-style:solid; border-left-style:solid; border-width:1px; border-color:#000000;"><b><fmt:message key="formaListadoRoles.etiqueta.descripcion" /></b></td>
         <td colspan="2"><b><fmt:message key="formaListadoRoles.etiqueta.administracion" /></b></td>
        </tr>
        <c:forEach var="rol" items="${formaListadoRoles.roles}">
            <tr>
                <td align="left" width="20%"><c:out value="${rol.nombre}"/></td>
                <td align="left" width="60%"><c:out value="${rol.descripcion}"/></td>
                <td align="left" width="20%">
                    <a href='solicitarModificarRol.do?id=<c:out value="${rol.id}"/>'
					   class="HipervinculoAdmon">
                        <fmt:message key="formaListadoRoles.etiqueta.modificar" />
                    </a>
                </td>
                <td>
                    <a href='procesarEliminarRol.do?id=<c:out value="${rol.id}"/>'
					   onClick="javascript: return EliminarRol('<c:out value="${rol.nombre}"/>')"
					   class="HipervinculoAdmon">
                        <fmt:message key="formaListadoRoles.etiqueta.eliminar" />
                    </a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" align="right" style="padding-top:25px;"><b>Total:</b> ${formaListadoRoles.contador}</td>
        </tr>
    </table>