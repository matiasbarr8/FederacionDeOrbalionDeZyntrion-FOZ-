// Equipos

class Equipo{
  const nombre
  const nivelDeEnergiaBase
  const entrenador
  const property tecnologiasComplementarias = []

  method nombre() = nombre
  method nivelDeEnergiaBase() = nivelDeEnergiaBase
  method entrenador() = entrenador
  
  method calcularEnergiaTotal() = nivelDeEnergiaBase + self.valorEnergeticoDeTecnologiasActivadas()

  method valorEnergeticoDeTecnologiasActivadas() = self.listaDeTecnologiasComplementariasActivadas().sum({t => t.valorEnergetico()})
  method listaDeTecnologiasComplementariasActivadas() = tecnologiasComplementarias.filter({t => t.estaActiva()})
  method reglaAdicional(unValor)
  method esDePrestigioUniversal() = true
}
class Luminico inherits Equipo{
  const nivelRadacionCapturada
  const property cristalesSolares = []

  method nivelRadacionCapturada() = nivelRadacionCapturada
  
  override method calcularEnergiaTotal() = super() + self.reglaAdicional(super())
  override method reglaAdicional(unValor){
    return
    if(nivelRadacionCapturada < 5000){
      unValor * 0.1
    }
    else{0}
  }
  override method esDePrestigioUniversal() = cristalesSolares.size() >= 3 && self.entrenador().esEliteGalactico() && self.tieneAlMenosUnaTecnologiaActivada()
  method tieneAlMenosUnaTecnologiaActivada() = tecnologiasComplementarias.any({t => t.estaActiva()})
}
class Sintetico inherits Equipo{
  const nivelProcesamientoCentral
  const cantModulosActivos
  const estaCertificadoComoEstable

  method nivelProcesamientoCentral() = nivelProcesamientoCentral
  method cantModulosActivos() = cantModulosActivos
  method estaCertificadoComoEstable() = estaCertificadoComoEstable

  override method calcularEnergiaTotal() = super() - self.reglaAdicional(super())
  override method reglaAdicional(unValor){
    return
    if(cantModulosActivos > 5){
      unValor * 0.2
    }
    else{0}
  }
  override method esDePrestigioUniversal() = self.estaCertificadoComoEstable() && self.cantModulosActivos() >= 3 && self.todasLasTecnologiasActivadas()
  method todasLasTecnologiasActivadas() = tecnologiasComplementarias.all({t => t.estaActiva()})
}
class Eterico inherits Equipo{
  const nivelFluctacionDimensional
  const cantPortalesEnergeticos

  method nivelFluctacionDimensional() = nivelFluctacionDimensional
  method cantPortalesEnergeticos() = cantPortalesEnergeticos
  override method calcularEnergiaTotal() = super() + self.reglaAdicional(super())
  override method reglaAdicional(unValor) {
    return
    if(self.esDePrestigioUniversal()){
      unValor * 0.15
    }
    else{
      0
    }
  }
  override method esDePrestigioUniversal() = self.nivelFluctacionDimensional() > 75 && self.cantPortalesEnergeticos() >= 2 && self.tieneAlMenosDosTecnologiasActivas()
  method tieneAlMenosDosTecnologiasActivas() = self.cantidadTecnologiasActivas().size() >= 2
  method cantidadTecnologiasActivas()= tecnologiasComplementarias.filter({t => t.estaActiva()})
}

//Entrenadores

class Entrenador{
  const cantCiclosSolares
  const estaEnSintoniaConElEquipo
  const nivelPrecisionEstrategica
  var rol

  method initialize(){
    if (nivelPrecisionEstrategica < 0){
      self.error("El nivel de precisión estratégica no puede ser un número negativo")
    }
    if(nivelPrecisionEstrategica > 100){
      self.error("El nivel de precisión estratégica no puede ser mayor que 100")
    }
    if(!foz.rolesHomologados().contains(self.rol())){
      self.error("Rol no homologado por la FOZ")
    }
  }
  method cantCiclosSolares() = cantCiclosSolares
  method estaEnSintoniaConElEquipo() = estaEnSintoniaConElEquipo
  method nivelPrecisionEstrategica() = nivelPrecisionEstrategica
  method rol() = rol
  method cambiarRol(nuevoRol){
    rol = nuevoRol
  }
  method esEliteGalactico() = cantCiclosSolares > 10 && self.rol().condicion(self)
}
object foz{
  const property rolesHomologados = [estrategaCuantico,arquitectoDeEnergia,guiaMental]
}

object estrategaCuantico{
  method condicion(unEntrenador) = unEntrenador.nivelPrecisionEstrategica() > 80
}
object arquitectoDeEnergia{
  method condicion(unEntrenador) = unEntrenador.estaEnSintoniaConElEquipo()
}
object guiaMental{
  method condicion(unEntrenador) = true
}

// Tecnologias Especiales

class Tecnologia{
  const nombre
  const valorEnergetico
  const estaActiva

  method nombre() = nombre
  method valorEnergetico() = valorEnergetico
  method estaActiva() = estaActiva
}
