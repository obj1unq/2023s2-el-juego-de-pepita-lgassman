import wollok.game.*
import pepita.*

object nido {
	
	var property position = game.at(0,0)	
	method image() {
		return "nido2.png"
	}
	
//	method position() {
//		//devuelvo la esquina superior derecha
//		return game.at(game.width() - 1,game.height() - 1)
//	}
	
	method colision(personaje) {
		personaje.ganar()
	}
	
	method atravesable() {
		return true
	}
	
}

object silvestre {
	const presa = pepita
	
	method image() {
		return "silvestre.png"
	}
	
	method position() {
		return game.at(self.x(), 0)
	}
	
	method x() {
		return presa.position().x().max(3)
	}
	
	method colision(personaje) {
		personaje.perder()
	}
	
	method atravesable() {
		return true
	}
	
}

class Muro {
	
	const property position = game.at(2,4)
	const property image = "muro.png"

	method atravesable() {
		return false
	}
	
}


