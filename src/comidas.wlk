import wollok.game.*

object manzana {
	const base= 5
	var madurez = 1
	
	method image() {
		return "manzana.png"
	}
	method position() {
		return game.at(6,5)
	}
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
	}

	method chocaste(golondrina) {
		golondrina.comerVisual(self)	
	}
}

object alpiste {

	method energiaQueOtorga() {
		return 20
	} 
	
	method image() {
		return "alpiste.png"
	}
	
	method position() {
		return game.at(6,6)
	}
	
	method chocaste(golondrina) {
		golondrina.comerVisual(self)	
		golondrina.empachada()
	}

}


