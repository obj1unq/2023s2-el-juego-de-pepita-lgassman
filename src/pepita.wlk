import wollok.game.*
import extras.*
import comidas.*
import direcciones.*


object empachada {
	
	method puedeMover() {
		return false
	}
}

object fracasada {

	method puedeMover() {
		return false
	}
}

object ganadora {
	method puedeMover() {
		return false
	}
	
}

object volando {
	method puedeMover() {
		return true
	}
	
	method aplica(golondrina) {
		return true
	}
}

object pepita {

	var energia = 1000
	var position = game.at(5, 3)
	const property destino = nido
	const property perseguidor = silvestre
	var property estado = volando

	
	method empachada() {
		estado = empachada
		game.schedule(2000, {estado = volando})	
	}
	
	method ganar() {
		estado = ganadora
		game.say(self, "GANE!")
		self.fin()
	}
	
	method perder() {
		estado = fracasada
		game.say(self, "ouch!")
		self.fin()
	}
	
	method fin() {
		game.removeTickEvent("gravedad")
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
		energia = energia + comida.energiaQueOtorga()
	}

	method energiaParaVolar(kms) {
		return 10 + kms
	}
	
	method volar(kms) {
		energia = energia - self.energiaParaVolar(kms)
	}
	
	method puedeVolar(kms) {
		return energia >= self.energiaParaVolar(kms) 
	}

	method energia() {
		return energia
	}
	
	method puedeMoverA(proxima){
		return tablero.pertenece(proxima) and self.estado().puedeMover()
	}
	
	method validarMover(proxima){
		if(not self.puedeMoverA(proxima)) {
			self.error("No puedo ir")
		}		
	}

	method mover(direccion) {
		const proxima = direccion.siguiente(self.position())
		self.validarMover(proxima)
		self.volar(1)
		self.position(proxima)	
		if (not self.puedeCaer() or not self.puedeVolar(1)) {
			self.perder()
		}	
	}
	
	method comerAhi() {
		const alimento = game.uniqueCollider(self)
		self.comerVisual(alimento)
	}
	
	method comerVisual(alimento){
		self.comer(alimento)
		game.removeVisual(alimento)
	}
	
	method puedeCaer() {
		const siguiente = abajo.siguiente(self.position())
		return tablero.pertenece(siguiente)
	}
	
	method caer() {
		if(self.puedeCaer()) {
			const siguiente = abajo.siguiente(self.position())
			self.position(siguiente)
		}
	}


}

