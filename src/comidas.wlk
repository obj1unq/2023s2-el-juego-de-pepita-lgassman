import wollok.game.*
import randomizer.*

//new Alpiste(position = randomizer.emptyPosition(), peso=(40..100).anyOne())

object alpisteFactory {
	
	method nuevo() {
		return new Alpiste(position=randomizer.emptyPosition(), peso=(40..100).anyOne())
	}
}

object manzanaFactory {
	method nuevo() {
		return new Manzana(position=randomizer.emptyPosition())
	}
}

object comidasManager {
	
	var generados = #{}
	const limite = 3
	
	const factories = [alpisteFactory, manzanaFactory]
	
	
	method seleccionarFactory() {

//      Para una probabilidad de 10% alpiste 90% manzana		
//		const x = 0.randomUpTo(1)
//		return if (x < 0.10) alpisteFactory else manzanaFactory 
		
		return factories.anyOne() //igual de probabilidad
	}
	
	method generar() {
		if(generados.size() < limite ) {
			
			const alimento = self.seleccionarFactory().nuevo() 		
			game.addVisual(alimento)	
			generados.add(alimento)
		}
	}
	
	method quitar(alimento) {
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
	
	method solido() {
		return false
	}
		
}

class Alpiste {

	const property position = game.at(4,2)
	const property peso = 20

	method energiaQueOtorga() {
		return peso
	} 
	
	method image() {
		return "alpiste.png"
	}
	
	method text() {
		return peso.toString()
	}
	
	
	method colision(personaje) {
		personaje.comerVisual(self)
		
		personaje.empachada()	
	}
	
	method solido() {
		return false
	}

}

