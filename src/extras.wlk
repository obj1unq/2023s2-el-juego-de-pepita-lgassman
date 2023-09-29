import wollok.game.*
import pepita.*

object nido {
	var property position=game.at(0,0)
	
	method image() {
		return "nido2.png"
	}
		
	method colision(personaje) {
		personaje.ganar()
	}
	
	method solido() {
		return false
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
	
	method solido() {
		return false
	}
	
	
}

class Muro {
	const property position
	const property image = "muro.png"
	
	method solido() {
		return true
	}
	
}


