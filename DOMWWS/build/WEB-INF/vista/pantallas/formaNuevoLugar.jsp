    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="/WEB-INF/vista/etiquetas/struts-html.tld" prefix="html" %>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://maps.google.com/maps/api/js?sensor=false&amp;language=es"></script>
    <script>
      var geocoder;
      var infowindow;
      var marker;
      window.onload = function () {
        var latLng = new google.maps.LatLng(16.7408929, -93.10159049999999);
        var opciones = {
          center: latLng,
          zoom: 5,
          mapTypeId: google.maps.MapTypeId.HYBRID
        };
        var map = new google.maps.Map(document.getElementById("mapa"), opciones);
        geocoder = new google.maps.Geocoder();
        infowindow = new google.maps.InfoWindow();
        google.maps.event.addListener(map, 'click', function (event) {
          geocoder.geocode({
            'latLng': event.latLng
          }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
              if (results[0]) {
                document.getElementById('coordenadas').value =  results[0].geometry.location;
                var a = results[0].formatted_address.split(',');
                document.getElementById('estado').value =  a[1].trim();

                var valor = a[2];
                var xmlhttp=new XMLHttpRequest();
                var v = valor.replace("México","Mexico");            
                xmlhttp.onreadystatechange=function(){
                  if(xmlhttp.status==404){
                  }
                  if (xmlhttp.readyState==4 && xmlhttp.status==200){
                      var d = xmlhttp.responseText.trim().replace(/\s/g, ',');
                      var d1 = d.split(',');
                      //alert(d1[0] + ":"  +d1[5] + ":" + d1[10]);
                      document.getElementById('pais').value =  d1[0];
                      document.getElementById('moneda').value = d1[10];
                  }
                };
                xmlhttp.open("GET","Service.do?pais="+valor,true);
                xmlhttp.send();
                if (marker) {
                  marker.setPosition(event.latLng);
                } else {
                  marker = new google.maps.Marker({
                    position: event.latLng,
                    map: map
                  })
                }
                infowindow.setContent(results[0].formatted_address + '<br/> Coordenadas: ' + results[0].geometry.location);
                infowindow.open(map, marker);
              } else {
                document.getElementById('coordenadas').value = 'No se encontraron resultados';
              }
            } else {
              document.getElementById('coordenadas').value = 'Geocodificación  ha fallado debido a: ' + status;
            }
          });
        });
      }
    </script>
    </head>
    <br>
    <font size='5'><fmt:message key="formaNuevoLugar.titulo" /></font>

    <form id="forma" action="procesarRegistroLugar.do" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td colspan="2">
                   <html:errors />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.nombre" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="nombre" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.nombre}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.descripcion" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="descripcion" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.descripcion}" />
                </td>
            </tr>
			<tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.poblacion" />
                </td>
                <td align="left">
                    <input type="number" 
                           name="poblacion" 
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.poblacion}" />
                </td>
            </tr>
			     <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.coordenadas" />
                </td>
                <td align="left">
                    <input type="text" 
                           name="coordenadas" 
                           id="coordenadas"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.coordenadas}" />
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.estado" />
                </td>
                <td align="left">
                    <input type="text"
                          id="estado"
                          name="estado"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.estado}"/>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.pais" />
                </td>
                <td align="left">
                    <input type="text"
                          id="pais"
                          name="pais"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.pais}"/>
                </td>
            </tr>
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.moneda" />
                </td>
                <td align="left">
                    <input type="text"
                          id="moneda"
                          name="moneda"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.moneda}"/>
                </td>
            </tr>
			       <!--<tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.buscaestado" />
                </td>
                <td align="left">
                    <input type="text"
						   id="est"
                           size="50" 
                           maxlength="100" 
                           value="${formaNuevoLugar.estado}"
						   onkeyup="ListaEstado()"/>
                </td>
            </tr>-->
			<!--<tr align="center">
				<td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.estado" />
                </td>
				<td align="left">
					<select id="listaE" name="estado" required>
						<option value="" disabled selected hidden>Seleccione un estado</option>
						<c:forEach var="estado" items="${formaNuevoLugar.estados}">
							<option value='<c:out value="${lugar.nombre}"/>'><c:out value="${estado.nombre}"/></option>
						</c:forEach>
					</select>
				</td>
        </tr>-->
            <tr>
                <td align="right">
                    <fmt:message key="formaNuevoLugar.etiqueta.foto" />
                </td>
                <td align="left">
                    <input type="file" 
                           name="imagen"
                           value="${formaNuevoLugar.imagen}"/>
                           <!--cambios-->
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
                           onclick="forma.action='procesarRegistroLugar.do?volver=si'"/>
                    <input type="button"
                           value="Reset"
                           onclickan="location.href='solicitarRegistroLugar.do'" />
                    <input type="submit" 
                           name="org.apache.struts.taglib.html.CANCEL" 
                           value="cancelar" 
                           onclick="bCancel=true;">    
                </td>
            </tr>
        </table>
    </form>

    <div id="mapa" style="height: 300px; width:400px;"></div>