import 'dart:io';

// Pide la especie y valida que sea una opción permitida.
String pedirEspecie() {
  String especie;
  do {
    stdout.write("Especie (Perro/Gato/Ave/Otro): ");
    especie = (stdin.readLineSync() ?? '').trim();
    especie = especie[0].toUpperCase() + especie.substring(1).toLowerCase();
    if (especie != "Perro" &&
        especie != "Gato" &&
        especie != "Ave" &&
        especie != "Otro") {
      stdout.writeln("⚠ Escribe una opción válida: Perro, Gato, Ave u Otro.");
    }
  } while (especie != "Perro" &&
      especie != "Gato" &&
      especie != "Ave" &&
      especie != "Otro");
  return especie;
}

void registrarMascota() {
  stdout.writeln("");
  stdout.writeln("========================================");
  stdout.writeln("        REGISTRO DE MASCOTA");
  stdout.writeln("========================================");

  stdout.write("Nombre de la mascota: ");
  var mascota = stdin.readLineSync()!;

  String especie = pedirEspecie();

  stdout.write("Raza: ");
  var raza = stdin.readLineSync()!;

  stdout.write("Edad (años): ");
  var edad = stdin.readLineSync()!;

  stdout.write("Nombre del dueño: ");
  var dueno = stdin.readLineSync()!;

  stdout.write("Teléfono de contacto: ");
  var telefono = stdin.readLineSync()!;

  stdout.write("Motivo de la consulta: ");
  var motivo = stdin.readLineSync()!;

  DateTime hoy = DateTime.now();
  String dia = hoy.day.toString().padLeft(2, '0');
  String mes = hoy.month.toString().padLeft(2, '0');
  String hora = hoy.hour.toString().padLeft(2, '0');
  String minuto = hoy.minute.toString().padLeft(2, '0');

  stdout.writeln("");
  stdout.writeln("========================================");
  stdout.writeln("      VETERINARIA PATITAS FELICES");
  stdout.writeln("         FICHA DE CONSULTA");
  stdout.writeln("========================================");
  stdout.writeln("Fecha:............. $dia/$mes/${hoy.year}  $hora:$minuto");
  stdout.writeln("----------------------------------------");
  stdout.writeln("Mascota:........... $mascota");
  stdout.writeln("Especie:............ $especie");
  stdout.writeln("Raza:............... $raza");
  stdout.writeln("Edad:............... $edad años");
  stdout.writeln("----------------------------------------");
  stdout.writeln("Dueño:.............. $dueno");
  stdout.writeln("Teléfono:........... $telefono");
  stdout.writeln("----------------------------------------");
  stdout.writeln("Motivo consulta:.... $motivo");
  stdout.writeln("========================================");
  stdout.writeln("   Mascota registrada correctamente ");
  stdout.writeln("========================================");
}

int mostrarMenu() {
  int? opcion;
  do {
    stdout.writeln("");
    stdout.writeln("========================================");
    stdout.writeln("   VETERINARIA PATITAS FELICES - MENÚ");
    stdout.writeln("========================================");
    stdout.writeln("  1. Registrar mascota");
    stdout.writeln("  0. Salir");
    stdout.writeln("========================================");
    stdout.write("Elige una opción: ");
    opcion = int.tryParse(stdin.readLineSync() ?? '');
    if (opcion != 1 && opcion != 0) {
      stdout.writeln("Opción inválida. Escribe 1 o 0.");
    }
  } while (opcion != 1 && opcion != 0);
  return opcion!;
}

void main() {
  int opcion;
  int mascotasRegistradas = 0;

  do {
    opcion = mostrarMenu();

    if (opcion == 1) {
      registrarMascota();
      mascotasRegistradas++;
    }
  } while (opcion != 0);

  stdout.writeln("");
  stdout.writeln("Mascotas registradas en esta sesión: $mascotasRegistradas");
  stdout.writeln("¡Hasta luego!");
}