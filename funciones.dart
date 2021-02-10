import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'clases.dart';

var numero, nombre, tipo, tipo2, ps, ataque, defensa, ataspe, defesp, velo;
List<String> numeros = new List();
List<String> name = new List();
List<String> tip = new List();
List<String> tip2 = new List();
List<String> hp = new List();
List<String> ata = new List();
List<String> def = new List();
List<String> atas = new List();
List<String> defe = new List();
List<String> velos = new List();

int elegir() {
  print("1.- Jugar con elecciones al azar");
  print("2.- Jugar escogiendo mis opciones");
  print("\n");
  print("Ingresa el numero de la opcion deseada: ");
  var elec = int.parse(stdin.readLineSync());
  return elec;
}

void cargarPokemones() {
  final file = new File('pokemones.txt');
  Stream<List<int>> inputStream = file.openRead();

  inputStream.transform(utf8.decoder).transform(new LineSplitter()).listen(
      (String line) {
    var lista = line.split(',');

    numero = lista[0];
    nombre = lista[1];
    tipo = lista[2];
    tipo2 = lista[3];
    ps = lista[4];
    ataque = lista[5];
    defensa = lista[6];
    ataspe = lista[7];
    defesp = lista[8];
    velo = lista[9];

    numeros.add(numero);
    name.add(nombre);
    tip.add(tipo);
    tip2.add(tipo2);
    hp.add(ps);
    ata.add(ataque);
    def.add(defensa);
    atas.add(ataspe);
    defe.add(defesp);
    velos.add(velo);

    //print('${nombre}, ${velo}');
  }, onDone: () {
    print('Pokemones cargados!!');

    print('Ingrese los pokemones deseados de la siguiente lista ingresando su');
    print('numero separados por ' ',');
    print('Ejemplo para escoger Bulbasaur, Charmander y Squirtle: 1,4,7');

    for (int i = 0; i < 152; i++) {
      print('${numeros[i]} ${name[i]}');
    }

    var listaEquipo = stdin.readLineSync();
    var pokenumeros = convertirNumero(listaEquipo);
    print("");
    print("");
    print("Los pokemones escogidos son los siguientes:  ");
    var listpokemon = buscarPokemon(pokenumeros);
    listarPokemon(listpokemon);
  }, onError: (e) {
    print(e.toString());
  });

  // Process results.
}

List convertirNumero(String a) {
  var b = a.split(',');
  List<int> c = [];
  var aux2;
  for (int i = 0; i < b.length; i++) {
    aux2 = b[i];
    c.add(int.parse(aux2));
  }
  c.sort();
  return c;
}

List buscarPokemon(List a) {
  var c = new List();
  for (int i = 0; i < a.length; i++) {
    c.add(name[a[i]]);
  }
  return c;
}

void listarPokemon(List a) {
  for (int i = 0; i < a.length; i++) {
    print(a[i]);
  }
}
