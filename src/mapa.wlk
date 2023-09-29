import pepita.*
import wollok.game.*
import comidas.*
import extras.*

object _ {
	
	method generar(position) {
		//El vacio no agrega nada
	}	
}

object p {
	method generar(position) {
		pepita.position(position)
		//game.addVisual(pepita)
		//No agrega el visual para hacerlo al final
	}		
}

object m {
	method generar(position) {
		game.addVisual(new Muro(position=position))
	}			
}
object n {
	method generar(position) {
		nido.position(position)
		game.addVisual(nido)
	}	
}
object s{
	method generar(position) {
		game.addVisual(silvestre)
		//silvestre calcula solo su posicion
	}		
}

object mapa {
	
	var celdas = [
		[_,_,_,_,_,_,_,_,_,n],
		[_,_,p,_,_,_,_,_,_,_],
		[_,_,m,m,_,_,m,_,_,_],
		[_,_,_,_,_,_,m,_,_,_],
		[_,_,_,_,_,_,m,_,_,_],		
		[_,_,_,_,_,_,m,m,_,_],		
		[_,_,_,s,_,_,_,_,_,_]		
	].reverse() //reverse porque el i crece en el orden inverso
	
	
	
	method generar() {
		game.width(celdas.anyOne().size())
		game.height(celdas.size())
		(0..game.width() -1).forEach({x =>
			(0..game.height() -1).forEach( {y =>
				self.generarCelda(x,y)
			})
		})
		game.addVisual(pepita) //agrego al final por un tema del z index
	}
	
	method generarCelda(x,y) {
		const celda = celdas.get(y).get(x)
		celda.generar(game.at(x,y))
	}
	
}
