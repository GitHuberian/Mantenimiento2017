<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>


<option value="" disabled selected hidden>Seleccione un Lugar</option>

<c:forEach var="lugar" items="${formaListadoLugares.lugares}">
    <option value='${lugar.nombre}'>${lugar.nombre}</option>
</c:forEach>