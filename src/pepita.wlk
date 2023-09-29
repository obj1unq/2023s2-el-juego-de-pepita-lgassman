import wollok.game.*
import extras.*
import comidas.*
import direcciones.*

object ganadora {
	method puedeMover() {
		return false
	}

// ya no hacen falta	
//	method esActual(personaje) {
//		return personaje.position() == personaje.destino().position()
//	}
}

object perdedora {
	method puedeMover() {
		return false
	}

//	method esActual(personaje) {
//		return personaje.position() == personaje.perseguidor().position() or
//				not personaje.puedeVolar(1)
//	}
}

object 	volando {
	method puedeMover() {
		return true
	}
	
//	method esActual(personaje) {
//		return true		
//	}
}

object empachada {

	method puedeMover() {
		return false //Esto despues lo vamos a tener que cambiar
	}
	
}

// Ahora no se necesita más este objeto
// porque el estado se recuerda a partir
// de los eventos de las colisiones
//
//object estadosDePersonaje {
//	
//	const estadosPosibles = [enDestino, fracasada, volando]
//	
//	method actual(personaje) {
//		return estadosPosibles.find({estado => estado.esActual(personaje)})
//	} 
//}

object pepita {

	var energia = 1000
	var position = game.at(2, 5)
	const property destino = nido
	const property perseguidor = silvestre
	var property estado = volando
	
	method empachada() {
		estado = empachada	
		game.schedule(2000, {estado = volando})
	}

// Ahora el estado es recordado a partir de los eventos de las colisiones	
//	method estado() {
//		return estadosDePersonaje.actual(self)
//	}
	
	method ganar() {
		estado = ganadora
		self.terminar()
	}
	
	method perder() {
		estado = perdedora
		self.terminar()
	}
	
	method terminar() {
		game.removeTickEvent("GRAVEDAD")
		game.schedule(5000, {game.stop()})	
	}
	
	method image() {
		return "" + self + "-" + self.estado() + ".png"
		// es equivalente a lo siguiente, 
		// porque self se convierte en string 
		// automáticamente cuando se concatena con el "" inicial
		//return "pepita-" + self.estado() + ".png"	
	}
	
	method text() {
		return energia.toString()
	}
	
	method textColor() {
		return "FF0000FF"
	}
	


	method position() {
		return position
	}

	method position(_position) {
		position = _position
	}

	method comer(comida) {
//		If no polimorfico que hay que evitar
//		if (comida.esAlpiste()) {
//			energia += energia + 20
//		}
//		else {
//			energia += energia + comida.madurez() * base
//		}
//
	    // Manera standard de resolver el problema		
		//comida.teComieron(self)
		
		
		//Manera correcta para este caso ya que había parte del código 
		//que era dependiente de pepita
		energia = energia + comida.energiaQueOtorga()
	}

	method energiaParaVolar(kms) {
		return 10 + kms
	}
	
	method volar(kms) {
		energia = energia - self.energiaParaVolar(kms)
		if(not self.puedeVolar(1)) {
			self.perder()
		}
	}
	
	method puedeVolar(kms) {
		return energia >= self.energiaParaVolar(kms) 
	}

	method energia() {
		return energia
	}
	
	method puedeOcupar(posicion) {
		return tablero.puedeOcupar(posicion) 
	}
	
	method sePuedeMover(direccion) {
		const proxima = direccion.siguiente(self.position())
		return self.puedeOcupar(proxima) and self.estado().puedeMover()
	}
	
	method validarMover(direccion) {
		if(not self.sePuedeMover(direccion)) {
			self.error("No puedo ir ahí")
		} 
	}
	
	method mover(direccion) {
		self.validarMover(direccion)
		const proxima = direccion.siguiente(self.position())		
		self.volar(1)
		self.position(proxima)		
	}
	
	method comerVisual(alimento) {
		self.comer(alimento)
		comidasManager.quitar(alimento)
	}
	
	method decaer() {
		const proxima = abajo.siguiente(self.position())
		if(self.puedeOcupar(proxima)) {
			self.position(proxima)
		}
	}


}

