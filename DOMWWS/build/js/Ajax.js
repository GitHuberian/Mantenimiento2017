
function ListaEstado(){
	var xhttp = new XMLHttpRequest();
	var src = document.getElementById("est").value;
	xhttp.onreadystatechange = function() {
		if(xhttp.status == 400){
			
		}
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			document.getElementById("listaE").innerHTML = xhttp.responseText;
		}
	};
	xhttp.open("GET", "ListarEstados.do?nombre="+src, true);
	xhttp.send();
}