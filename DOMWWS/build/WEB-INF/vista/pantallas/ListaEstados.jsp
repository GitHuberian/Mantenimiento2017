<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>


<option value="" disabled selected hidden>Seleccione un estado</option>

<c:forEach var="estado" items="${formaListadoEstados.estados}">
	<option value='${estado.nombre}'>${estado.nombre}</option>
</c:forEach>