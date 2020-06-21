class Nido {

    var property grosor = 5
    var property resisenciaDelMaterial = 3

    method aumentarGrosor(cantidad) {
        grosor += cantidad
    }

    method potenciaDelNido() {
        return grosor * resisenciaDelMaterial + 20
    }

}