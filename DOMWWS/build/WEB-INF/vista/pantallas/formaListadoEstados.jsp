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
  function EliminarEstado(strEstadoName){
    return confirm("¿Desea eliminar el estado '" + strEstadoName + "'?")
  }
-->
</script>
    <br>
    <font size='5'><fmt:message key="formaListadoEstados.titulo" /></font>
    <table cellpadding="0" cellspacing="0" width="60%" border="0">
        <tr>
            <td colspan="4" style="padding-top:25px; padding-bottom:25px;">
                <a href="solicitarRegistroEstado.do" class="HipervinculoAdmon">Agregar nuevo estado...</a>
            </td>
        </tr>
        <tr>
            <td colspan="4">
               <html:errors />
            </td>
        </tr>
        <tr bgcolor="#CCCCCC">
         <td><b><fmt:message key="formaListadoEstados.etiqueta.nombre" /></b></td>
         <td style="border-right-style:solid; border-left-style:solid; border-width:1px; border-color:#000000;"><b><fmt:message key="formaListadoEstados.etiqueta.descripcion" /></b></td>
         <td colspan="2"><b><fmt:message key="formaListadoEstados.etiqueta.administracion" /></b></td>
        </tr>
        <c:forEach var="estado" items="${formaListadoEstados.estados}">
            <tr>
                <td align="left" width="20%"><c:out value="${estado.nombre}"/></td>
                <td align="left" width="60%"><c:out value="${estado.descripcion}"/></td>
                <td align="left" width="20%">
                    <a href='solicitarModificarEstadp.do?id=<c:out value="${estado.id}"/>'
					   class="HipervinculoAdmon">
                        <fmt:message key="formaListadoEstados.etiqueta.modificar" />
                    </a>
                </td>
                <td>
                    <a href='procesarEliminarEstado.do?id=<c:out value="${estado.id}"/>'
					   onClick="javascript: return EliminarEstado('<c:out value="${estado.nombre}"/>')"
					   class="HipervinculoAdmon">
                        <fmt:message key="formaListadoEstados.etiqueta.eliminar" />
                    </a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" align="right" style="padding-top:25px;"><b>Total:</b> ${formaListadoEstados.contador}</td>
        </tr>
    </table>