import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.reaccionar()
	}
	
	method descargar(unaCosa) { cosas.remove(unaCosa) }
	
	method pesoTotal() {
		return 1000 + self.pesoDeLaCarga()
	}
	
	method pesoDeLaCarga() {
		return cosas.sum({ cosa => cosa.peso() })
	}
	
	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}
	
	method objetosPeligrosos(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}
	
	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({ _cosa => _cosa.nivelPeligrosidad() > cosa.nivelPeligrosidad() })
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return cosas.all({ cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
	}
	
	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({cosa => cosa.peso() > min && cosa.peso() < max})
	}
	
	method cosaMasPesada() {
		return cosas.max({cosa => cosa.nivelPeligrosidad()})
	}
	
	method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}
	
	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}
	
}
