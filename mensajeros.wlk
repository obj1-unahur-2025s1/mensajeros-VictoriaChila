object empresa {
  var empleados = #{} //conjunto vacío

  method contratar(empleado){
    empleados.add(empleado)
  }

  method despedir(empleado){
    empleados.remove(empleado)
  }

  method despedirATodos(){
    empleados.clear()
  }

  method esGrande() = empleados.size() > 2

  method entregadoPorPrimero(envio) = envio.puederSerEntregadoPor(empleados.asList().first())

  method pesoDelUltimo() = empleados.asList().last().peso()

}


object roberto {
  var vehiculo = null
  var peso = 70

  method aumentarPeso(incremento){
    peso += incremento
  }

  method adelgazarPeso(decremento){
    peso -= decremento
  }

  method peso() = peso + vehiculo.peso()

  method vehiculo(nuevoVehiculo){
    vehiculo = nuevoVehiculo
  }

  method puedeLlamar() = false
  //method puedeLlegar(destino){
   // return destino.puedePasar(self)
  //}

  method puedeEntregar(paquete){
    return 
    paquete.estaPago() 
    and paquete.destino().puedeLlegar(self)
  }
}

object chuck {
  method peso() = 80
  method puedeLlamar() = true
}

object neo {
  var tieneCredito = false

  method peso() = 0
  method puedeLlamar() = tieneCredito

  method cargarCredito() {
    tieneCredito = true
  }

  method gastarCredito(){
    tieneCredito = false
  }
}

object brooklyn {
  method puedeLlegar(mensajero) = mensajero.peso() <= 1000
}

object matrix {
  method puedeLlegar(mensajero) = mensajero.puedeLlamar()
}

object paquete {
  var destino = null
  var estaPago = false

  method destino() = destino
  method destino(nuevoDestino){
    destino = nuevoDestino
  }
  method estaPago() = estaPago

  method pagarPaquete(){
    estaPago = true
  }

  method puedeSerEntregadoPor(mensajero) = destino.puedeLlegar(mensajero)
  and self.estaPago()
}

object paquetito{
  var destino = null
  
  method destino() = destino
  method destino(nuevoDestino){
    destino = nuevoDestino
  }

  method estaPago() = true

  method precio() = 0

  method puedeSerEntregadoPor(mensajero) = true

}

object paqueton {
  var destinos = #{}
  var montoPagado = 0

  method precio() = 100 * destinos.size()

  method pagar(monto){
    montoPagado = (montoPagado +monto).min(self.precio())
  }

  method estaPago() = montoPagado == self.precio()

  method puedeSerEntregadoPor(mensajero){
    estaPago() and destinos.all(
      {d=> d.puedeLlegar(mensajero)}
      ) //d es cada elemento de la colección y lo va a verificar en cada destino
  }

  method agregarDestino(nuevoDestino){
    destinos.add(nuevoDestino)
  }


}

object bicicleta {
  method peso() = 5
}

object camion {
  var cantidadAcoplados = 1
  method peso() = 500 * cantidadAcoplados

  method agregarAcoplado() {
    cantidadAcoplados += 1
  } 

  method quitarAcoplado(){
    cantidadAcoplados = (cantidadAcoplados -1).max(1)
  }
}