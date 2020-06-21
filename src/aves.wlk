import islas.*
import nidos.*

class Ave {

}

class Aguilucho {

    var property velocidad = 20

    method fuerza() {
        return if (velocidad <= 60) {
            180
        } else {
            velocidad * 3
        }
    }

    method recibirDisgusto() {
        velocidad *= 2
    }

    method relajate() {
        velocidad = 0.max(velocidad - 10)
    }

    method estaConforme(unaIsla) {
        return unaIsla.alpiste() >= 8
    }

    method tomarAlimentoDe(unaIsla) {
        unaIsla.comerAlpiste(3)
        velocidad += 15
    }

}

class Albatro {

    var property peso = 4000
    var property masaMuscular = 600

    method fuerza() {
        return if (peso < 6000) {
            masaMuscular
        } else {
            masaMuscular / 2
        }
    }

    method recibirDisgusto() {
        peso += 800
    }

    method irAlGimnasio() {
        peso += 500
        masaMuscular += 500
    }

    method relajate() {
        peso = 0.max(peso - 300)
    }

    method estaConforme(unaIsla) {
        return unaIsla.cantidadAvesMasFuerteQue(self) <= 2
    }

    method tomarAlimentoDe(unaIsla) {
        unaIsla.comerMaiz(4)
        peso += 700
        masaMuscular += 700
    }

}

class Paloma {

    var property ira = 200

    method fuerza() {
        return ira * 2
    }

    method recibirDisgusto() {
        ira += 300
    }

    method relajate() {
        ira -= 50
    }

    method estaConforme(unaIsla) {
        return unaIsla.avesDeviles().size() <= 1
    }

    method tomarAlimentoDe(unaIsla) {
    }

    method equilibrarse() {
        if (self.fuerza() <= 700) {
            self.recibirDisgusto()
        } else {
            self.relajate()
        }
    }

}

class AguiluchoColorado inherits Aguilucho {

    override method fuerza() {
        return 400 + super()
    }

}

class PalomaTorcaza inherits Paloma {

    var property huevos = 3

    override method fuerza() {
        return huevos * 100 + super()
    }

    override method recibirDisgusto() {
        super()
        huevos++
    }

}

class PalomaMontera inherits Paloma {

    var property topeDeFuerza = 2000

    override method fuerza() {
        return super().min(topeDeFuerza)
    }

}

class PalomaManchada inherits Paloma {

    const property nidos = []

    method agregarNido(unNido) {
        nidos.add(unNido)
    }

    method quitarNido(unNido) {
        nidos.remove(unNido)
    }

    method cantidadDeNidos() {
        return nidos.size()
    }

    override method recibirDisgusto() {
        super()
        self.agregarNido(new Nido())
    }

    override method relajate() {
        if (self.cantidadDeNidos() <= 2) {
            super()
        } else {
            nidos.forEach({ nido => nido.aumentarGrosor(1)})
        }
    }

    override method ira() {
        return ira + self.potenciaDeLosNidos()
    }

    method potenciaDeLosNidos() {
        return nidos.sum({ nido => nido.potenciaDelNido() })
    }

}