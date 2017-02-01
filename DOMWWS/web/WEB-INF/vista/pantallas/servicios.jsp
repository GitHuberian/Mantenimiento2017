<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <c:forEach var="recomendacion" items="${formaListadoRecomendaciones.recomendaciones}">
			<Recomendacion>
                <Nombre><c:out value="${recomendacion.nombre}"/></Nombre>
                <Estado><c:out value="${recomendacion.estado}"/></Estado>
				<Usuario><c:out value="${recomendacion.usuario}"/></Usuario>
				<Fecha><c:out value="${recomendacion.fecha}"/></Fecha>
				<Comentario><c:out value="${recomendacion.comentario}"/></Comentario>
				<Calificacion><c:out value="${recomendacion.calificacion}"/></Calificacion>
			</Recomendacion>
        </c:forEach>
