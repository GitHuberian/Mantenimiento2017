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
  function EliminarRecomendacion(strRecomendacionName){
    return confirm("¿Desea eliminar el estado '" + strRecomendacionName + "'?")
  }
-->
</script>
    <br>
    <font size='5'><fmt:message key="formaListadoRecomendaciones.titulo" /></font>
    <table cellpadding="0" cellspacing="0" width="60%" border="0">
        <tr>
            <td colspan="4" style="padding-top:25px; padding-bottom:25px;">
                <a href="solicitarRegistroRecomendacion.do" class="HipervinculoAdmon">Agregar nueva recomendacion...</a>
            </td>
        </tr>
        <tr>
            <td colspan="4">
               <html:errors />
            </td>
        </tr>
        <tr bgcolor="#CCCCCC">
         <td><b><fmt:message key="formaListadoRecomendaciones.etiqueta.nombre" /></b></td>
         <td style="border-right-style:solid; border-left-style:solid; border-width:1px; border-color:#000000;"><b><fmt:message key="formaListadoRecomendaciones.etiqueta.estado" /></b></td>
         <td style="border-right-style:solid; border-left-style:solid; border-width:1px; border-color:#000000;"><b><fmt:message key="formaListadoRecomendaciones.etiqueta.usuario" /></b></td>
         <td style="border-right-style:solid; border-left-style:solid; border-width:1px; border-color:#000000;"><b><fmt:message key="formaListadoRecomendaciones.etiqueta.fecha" /></b></td>
         <td style="border-right-style:solid; border-left-style:solid; border-width:1px; border-color:#000000;"><b><fmt:message key="formaListadoRecomendaciones.etiqueta.comentarios" /></b></td>
         <td style="border-right-style:solid; border-left-style:solid; border-width:1px; border-color:#000000;"><b><fmt:message key="formaListadoRecomendaciones.etiqueta.calificacion" /></b></td>
         
		 <td colspan="2"><b><fmt:message key="formaListadoRecomendaciones.etiqueta.administracion" /></b></td>
        </tr>
        <c:forEach var="recomendacion" items="${formaListadoRecomendaciones.recomendaciones}">
            <tr>
                <td align="left" width="20%"><c:out value="${recomendacion.nombre}"/></td>
                <td align="left" width="20%"><c:out value="${recomendacion.estado}"/></td>
                <td align="left" width="60%"><c:out value="${recomendacion.usuario}"/></td>
				<td align="left" width="60%"><c:out value="${recomendacion.fecha}"/></td>
				<td align="left" width="60%"><c:out value="${recomendacion.comentario}"/></td>
				<td align="left" width="60%"><c:out value="${recomendacion.calificacion}"/></td>
                <td align="left" width="20%">
                    <a href='solicitarModificarRecomendacion.do?id=<c:out value="${recomendacion.id}"/>'
					   class="HipervinculoAdmon">
                        <fmt:message key="formaListadoRecomendaciones.etiqueta.modificar" />
                    </a>
                </td>
                <td>
                    <a href='procesarEliminarRecomendacion.do?id=<c:out value="${recomendacion.id}"/>'
					   onClick="javascript: return EliminarRecomendacion('<c:out value="${recomendacion.nombre}"/>')"
					   class="HipervinculoAdmon">
                        <fmt:message key="formaListadoRecomendaciones.etiqueta.eliminar" />
                    </a>
                </td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="4" align="right" style="padding-top:25px;"><b>Total:</b> ${formaListadoRecomendaciones.contador}</td>
        </tr>
    </table>