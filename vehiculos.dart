import 'dart:io';

void registrarVehiculo() {
  stdout.writeln("");
  stdout.writeln("========================================");
  stdout.writeln("        REGISTRO DE VEHÍCULO");
  stdout.writeln("========================================");

  stdout.write("Placa: ");
  var placa = stdin.readLineSync()!;

  stdout.write("Marca: ");
  var marca = stdin.readLineSync()!;

  stdout.write("Modelo: ");
  var modelo = stdin.readLineSync()!;

  stdout.write("Año: ");
  var anio = stdin.readLineSync()!;

  stdout.write("Color: ");
  var color = stdin.readLineSync()!;

  stdout.write("Nombre del propietario: ");
  var propietario = stdin.readLineSync()!;

  DateTime hoy = DateTime.now();
  String dia = hoy.day.toString().padLeft(2, '0');
  String mes = hoy.month.toString().padLeft(2, '0');
  String fechaRegistro = "$dia/$mes/${hoy.year}";

  stdout.writeln("");
  stdout.writeln("========================================");
  stdout.writeln("        COMPROBANTE DE REGISTRO");
  stdout.writeln("========================================");
  stdout.writeln("Placa:.................. $placa");
  stdout.writeln("Marca:................... $marca");
  stdout.writeln("Modelo:................. $modelo");
  stdout.writeln("Año:..................... $anio");
  stdout.writeln("Color:................... $color");
  stdout.writeln("Propietario:............. $propietario");
  stdout.writeln("Fecha de registro:....... $fechaRegistro");
  stdout.writeln("========================================");
  stdout.writeln("      Vehículo registrado con éxito");
  stdout.writeln("========================================");
}

void main() {
  int? opcion;
  int registrosRealizados = 0;

  do {
    stdout.writeln("");
    stdout.writeln("========================================");
    stdout.writeln("     SISTEMA DE REGISTRO DE VEHÍCULOS");
    stdout.writeln("========================================");
    stdout.writeln("  1. Registrar vehículo");
    stdout.writeln("  0. Salir");
    stdout.writeln("========================================");
    stdout.write("Elige una opción: ");
    opcion = int.parse(stdin.readLineSync()!);

    if (opcion != 1 && opcion != 0) {
      stdout.writeln("Opción inválida. Escribe 1 o 0.");
    }

    if (opcion == 1) {
      registrarVehiculo();
      registrosRealizados++;
    }
  } while (opcion != 0);

  stdout.writeln("");
  stdout.writeln("Vehículos registrados en esta sesión: $registrosRealizados");
  stdout.writeln("¡Hasta luego!");
}