import wollok.game.*
import pepita.*

object nido {
	
	
	method image() {
		return "nido.png"
	}
	
	method position() {
		//devuelvo la esquina superior derecha
		return game.at(game.width() - 1,game.height() - 1)
	}
	
	method chocaste(golondrina) {
		pepita.ganar()
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
	
	method chocaste(golondrina) {
		pepita.perder()
	}
	
}


