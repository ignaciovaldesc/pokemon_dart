//import 'dart:io';
import 'funciones.dart';

void main() {
  print("Bienvenido a batalla pokemon");
  print("El siguiente juego tiene 2 opciones para comenzar escoge sabiamente");

  var eleccion = elegir();

  switch (eleccion) {
    case 1:
      print("Juego al azar");
      print(
          "Instrucciones: Los pokemones seran escogidos al azar junto con sus ataques.");
      print("Al mismo tiempo la cantidad de pokemones tambien sera al azar");
      print(
          "Podra cambiar el pokemon las veces que desee en batalla mientras aun tenga ps");
      var equipoPokemon = cargarPokemones();
      print("Termine");
      break;
    case 2:
      print("Juego a eleccion");
      break;
    default:
  }
}
