import actividades.*

class Socio {
	var property actividadesRealizadas = []
	var property maximoActividades
	
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
	
}
