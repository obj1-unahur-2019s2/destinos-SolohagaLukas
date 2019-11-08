import socios.*

class Viaje {
	var property idioma = #{}
	
	method agregarIdioma(lenguaje) { 
		idioma.add(lenguaje)
	}
	method implicaEsfuerzo ()
	method bronceador ()
	method dias ()
	method esInteresante() {
		return idioma.size() > 1
	}
	method esRecomendada(socio) {
		return self.esInteresante() and
		socio.leAtrae(self) and
		not socio.realizoActividad(self)
	}
}

class Playa inherits Viaje {
	var property largoDePlaya
	 override method dias() {
	 	return largoDePlaya / 500
	 }
	 override method implicaEsfuerzo() {
	 	return largoDePlaya > 1200
	 }
	 override method bronceador () { return true }
}

class Ciudad inherits Viaje {
	var property cantidadAtracciones
	
	override method dias() {
		return cantidadAtracciones / 2
	}
	override method implicaEsfuerzo() {
		return cantidadAtracciones.between(5, 8)
	}
	override method bronceador() { return false }
	override method esInteresante() {
		return super() or cantidadAtracciones == 5
	}
}

class CiudadTropical inherits Ciudad {
	override method dias() {
		return super() + 1
	}
	override method bronceador() { return true }
}

class Trekking inherits Viaje {
	var property kilometrosDeSenderos
	var property diasSoleados
	
	override method dias() {
		return kilometrosDeSenderos / 50
	}
	override method implicaEsfuerzo() {
		return kilometrosDeSenderos > 80
	}
	override method bronceador() {
		return diasSoleados > 200 or diasSoleados.between(100, 200) and kilometrosDeSenderos > 120
	}
	override method esInteresante() {
		return super() and diasSoleados > 140
	}
}

class ClaseDeGimnasia inherits Viaje {
	override method idioma() { return #{"español"} }
	override method dias() { return 1 }
	override method implicaEsfuerzo() { return true }
	override method bronceador() { return false }
	override method esRecomendada(socio) {
		return socio.edad().between(20, 30)
	}
}

class TallerLiterario {
	var property libros = #{}
	
	method agregarLibro(book) {
		libros.add(book)
	}
	method idioma() {
		return libros.map({ l => l.idioma()}).asSet()
	}
	method dias() {
		return libros.size() + 1
	}
	method implicaEsfuerzo() {
		return ( self.hayMasDe500()
		or self.todosMismoAutor() )
		and libros.size() > 1 
	}
	method hayMasDe500() {
		return libros.any({ l => l.paginas() > 500 })
	}
	method todosMismoAutor() {
		return self.autores().size() < 2
	}
	method autores() {
		return libros.map({ l => l.autor() }).asSet()
	}
	method bronceador() { return false }
	method esRecomendado(socio) {
		return socio.idioma().size() > 1
	}
}

class Libro {
	 var property idioma
	 var property paginas
	 var property autor
}