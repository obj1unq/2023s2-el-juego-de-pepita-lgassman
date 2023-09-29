import pepita.*
import wollok.game.*
import extras.*

object _  {
	
	method llenar(position){
		
	}
}

object p {
	method llenar(position) {
		pepita.position(position)
		//game.addVisual(pepita) no lo agrego acá porque como es el personaje lo quiero al final		
	}
}

object m {
	method llenar(position) {
		game.addVisual(new Muro(position = position))		
	}	
}

object n {
	method llenar(position) {
		nido.position(position)
		game.addVisual(nido)		
	}		
}

object s {
	method llenar(position) {
		//silvestre no necesita position porque es calculada
		game.addVisual(silvestre)		
	}		
}

object mapa {
	
	const _mapa = 
	[
	 [_, p, m, _, _, _, _, _, _, _, n],
	 [_, _, m, _, _, _, _, _, _, _, _],
	 [_, _, _, _, _, _, _, _, _, _, _],
	 [_, m, m, m, _, m, _, _, _, _, _],
	 [_, _, _, _, _, m, _, _, _, _, _],
	 [_, _, _, _, _, m, _, _, _, _, _],
	 [_, _, _, _, _, _, _, _, _, _, _],
	 [_, _, _, _, _, _, _, m, _, _, _],
	 [_, _, _, _, _, _, _, _, _, _, _],
	 [_, _, m, s, _, _, _, _, _, _, _]
	]
	
	
	method llenarCeldas() {
		(0..game.width() -1 ).forEach({ x => 
			(0..game.height() -1 ).forEach({ y =>
				self.celda(x,y).llenar(game.at(x,y))
			})
		})		
	}
	
	method celda(x,y) {
		return _mapa.get(game.height() -1 - y).get(x)
	}
	
	method construir() {
		game.height(_mapa.size())
		game.width(_mapa.anyOne().size())	
		self.llenarCeldas()
		game.addVisual(pepita)
	}
	
	
}
