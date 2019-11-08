import actividades.*

class Socio {
	var property actividadesRealizadas = []
	var property maximoActividades
	var property edad
	var property idioma = #{}
	
	method agregarActividad(activ) {
		if (actividadesRealizadas.size() < maximoActividades) {
			actividadesRealizadas.add(activ)
		} else {
			self.error("supera el maximo de actividades")
		}
	}
	method adoradorDelSol() {
		return actividadesRealizadas.all({ a => a.bronceador() })
	}
	method actividadesEsforzadas() {
		return actividadesRealizadas.filter({ a => a.implicaEsfuerzo() })
	}
	method agregarIdioma(language) {
		idioma.add(language)
	}
	method realizoActividad(activ) {
		return actividadesRealizadas.contains(activ)
	}	
}
class Tranquilo inherits Socio {
	method leAtrae(actividad) {
		return actividad.dias() >= 4
	}
}
class Coherente inherits Socio {
	method leAtrae(actividad) {
		return if(self.adoradorDelSol()) {
			actividad.bronceador()
		} else {
			actividad.implicaEsfuerzo()
		}
	}
}
class Relajado inherits Socio {
	method leAtrae(actividad) {
		var idiomas = actividad.idioma()
		return idioma.contains(idiomas)
		//ARREGLAR
	}
}