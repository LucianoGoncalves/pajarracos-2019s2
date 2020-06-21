import aves.*
import excepciones.*

class Isla {

    const property aves = []
    var property alpiste = 10
    var property maiz = 10

    method agregarAve(ave) {
        aves.add(ave)
    }

    method quitarAve(ave) {
        aves.remove(ave)
    }

    method avesDebiles() {
        return aves.filter({ ave => ave.fuerza() < 1000 })
    }

    method fuerzaTotal() {
        return aves.sum({ ave => ave.fuerza() })
    }

    method esRobusta() {
        return aves.all({ ave => ave.fuerza() > 300 })
    }

    method terremoto() {
        aves.forEach({ ave => ave.recibirDisgusto()})
    }

    method tormenta() {
        self.avesDebiles().forEach({ ave => ave.recibirDisgusto()})
    }

    method capitana() {
        return self.listaDeAvesCapitana().max({ ave => ave.fuerza() })
    }

    method listaDeAvesCapitana() {
        return aves.filter({ ave => ave.fuerza().between(1000, 3000) })
    }

    method sesionDeRelax() {
        aves.forEach({ ave => ave.relajate()})
    }

    method estaEnPaz() {
        return aves.all({ ave => ave.estaConforme(self) })
    }

    method cantidadAvesMasFuerteQue(unaAve) {
        return aves.count({ ave => ave.fuerza() > unaAve.fuerza() })
    }

    method alimentacion() {
        aves.forEach({ ave => ave.tomarAlimentoDe(self)})
    }

    method comerAlpiste(cantidad) {
        if (cantidad < 0) {
            throw new UserException(message = "La cantidad debe ser positiva")
        }
        alpiste = 0.max(alpiste - cantidad)
    }

    method comerMaiz(cantidad) {
        if (cantidad < 0) {
            throw new UserException(message = "La cantidad debe ser positiva")
        }
        maiz = 0.max(maiz - cantidad)
    }

}