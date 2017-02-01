<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
<html>
    <head>
        <title>Administrador de Roles - UPCHIAPAS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<script type="text/javascript" src="js/Ajax.js"></script>
        <link rel="stylesheet" type="text/css" href="css/plantilla.css">
        <link rel="stylesheet" type="text/css" href="css/mensajes.css">
    </head>
	
    <body>
        <table class="marco" cellpadding="0">
            <tr>
                <td colspan="2">
                    <c:import url="/WEB-INF/vista/comun/banner.jsp" />
                    <c:import url="/WEB-INF/vista/comun/barraMenu01.jsp" />
                </td>
            </tr>
            <tr height="490px">
                <td align="center" valign="center" width="100%">
                    <c:import url="/WEB-INF/vista/pantallas/${param.c}" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:import url="/WEB-INF/vista/comun/barraPie.jsp" />
                </td>
            </tr>
        </table>
    </body>
</html>
