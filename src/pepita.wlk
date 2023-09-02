import wollok.game.*
import extras.*
import comidas.*
import direcciones.*

object pepita {

	var energia = 100
	var position = game.at(5, 3)
	const destino = nido
	const perseguidor = silvestre

	method enElDestino() {
		return self.position() == destino.position()
	}
	method fracasada() {
		return self.position() == perseguidor.position() or
				not self.puedeVolar(1)
	}

	method estado() {
		return if (self.enElDestino()) {
			"enDestino"
		} else if (self.fracasada()) {
			"atrapada"
		} else {
			"volando"
		}
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
	
	method mover(direccion) {
		const proxima = direccion.siguiente(self.position())
		if(tablero.pertenece(proxima) and not self.fracasada()) {
			self.volar(1)
			self.position(proxima)		
		}
		//Por ahora no es un problema
	}
	
	method comerAhi() {
		const alimento = game.uniqueCollider(self)
		self.comer(alimento)
		game.removeVisual(alimento)
	}


}

