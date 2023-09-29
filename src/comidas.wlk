import wollok.game.*
import randomizer.*

object alpisteFactory {
	method crear() {
		return new Alpiste(position = randomizer.emptyPosition(), peso=(40..100).anyOne())
	}
}

object manzanaFactory {
	
	method crear() {
		return new Manzana(position = randomizer.emptyPosition())
	}
}

object alimentos {
	
	const factories = [alpisteFactory, manzanaFactory]
	const generados = #{}
	const limite = 3
	
	
	method reponer() {
		if (generados.size() < limite) {
			const alimento = factories.anyOne().crear()
			generados.add(alimento)
			game.addVisual(alimento)
		}
	}
	
	method eliminar(alimento) {
		generados.remove(alimento)
		game.removeVisual(alimento)
	} 
}



class Manzana {
	const base= 5
	var madurez = 1
	const property position = game.at(3,5)
	
	method image() {
		return "manzana.png"
	}
		
	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
	}
	
	method colision(personaje) {
		personaje.comerVisual(self)	
	}
	
	method atravesable() {
		return true
	}
	
	
}

class Alpiste {
	
	const peso = 20
	const property position = game.at(4,2)
	method energiaQueOtorga() {
		return peso
	} 
	method text() {
		return peso.toString()
	}
	
	method image() {
		return "alpiste.png"
	}
	
	
	method colision(personaje) {
		personaje.comerVisual(self)
		personaje.empachada()	
	}

	method atravesable() {
		return true
	}

}

