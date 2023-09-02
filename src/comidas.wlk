import wollok.game.*

object manzana {
	const base= 5
	var madurez = 1
	
	method image() {
		return "manzana.png"
	}
	method position() {
		return game.at(3,5)
	}
	
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
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
		return game.at(4,2)
	}
	

}

