object knightRider {
	
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() = 1
	method reaccionar() {}
	
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() = 2
	method reaccionar() {
		transformadoEnAuto = true
	}
}

object paqueteLadrillos {
	var property cantidad = 0
	
	method peso() = cantidad * 2
	
	method nivelPeligrosidad() = 2
	
	method bultos() { 
		return	if (cantidad < 100) { 1 }
		else if (cantidad > 100 && cantidad < 300){ 2 }
		else { 3 }
	}
	
	method reaccionar() {
		cantidad += 12
	}
}

object arenaGranel {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
	
	method bultos() = 1
	
	method reaccionar() {
		peso += 20
	}
}

object bateriaAntiAerea {
	var property estaConLosMisiles = false
	
	method peso() {
		return if (estaConLosMisiles) { 300 }
		else { 200 } 
	}
	
	method nivelPeligrosidad() {
		return if (estaConLosMisiles) { 100 }
		else { 0 }
	}
	
	method bultos() {
		return if (estaConLosMisiles) { 2 }
		else { 1 }
	}
	
	method reaccionar() {
		estaConLosMisiles = true
	}
}

object contenedorPortuario {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) { cosas.remove(unaCosa) }
	
	method peso() {
		return 100 + self.pesoDeLaCarga()
	}
	
	method pesoDeLaCarga() {
		return cosas.sum({ cosa => cosa.peso() })
	}
	
	method nivelPeligrosidad() {
		return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
	}
	
	method bultos() {
		return 1 + cosas.size()
	}
	
	method reaccionar() {
		cosas.forEach({cosa => cosa.reaccionar()})
	}
}

object residuosRadioactivos {
	var property peso = 0
	
	method nivelPeligrosidad() = 200
	method bultos() = 1
	method reaccionar() {
		peso += 15
	}
	
}

object embalajeDeSeguridad {
	
	var property cosaAdentro 
	
	method peso() = cosaAdentro.peso()
	method nivelPeligrosidad() = cosaAdentro.nivelPeligrosidad() / 2
	method bultos() = 2
	method reaccionar() {}
}
