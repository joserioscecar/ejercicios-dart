import 'dart:io';

// Pide un entero mayor a 0 (para cantidades).
int pedirEntero(String mensaje) {
  int? valor;
  do {
    stdout.write(mensaje);
    valor = int.tryParse(stdin.readLineSync() ?? '');
    if (valor == null || valor <= 0) {
      stdout.writeln("⚠ Ingresa un número entero válido mayor a 0.");
    }
  } while (valor == null || valor <= 0);
  return valor;
}

// Pide un decimal mayor a 0 (para precios).
double pedirDecimal(String mensaje) {
  double? valor;
  do {
    stdout.write(mensaje);
    valor = double.tryParse(stdin.readLineSync() ?? '');
    if (valor == null || valor <= 0) {
      stdout.writeln("⚠ Ingresa un precio válido mayor a 0.");
    }
  } while (valor == null || valor <= 0);
  return valor;
}

// Pide Si/No, sin importar mayúsculas o minúsculas.
String pedirSiNo(String mensaje) {
  String valor;
  do {
    stdout.write(mensaje);
    valor = (stdin.readLineSync() ?? '').trim().toLowerCase();
    if (valor != "si" && valor != "no") {
      stdout.writeln("⚠ Responde solo con 'Si' o 'No'.");
    }
  } while (valor != "si" && valor != "no");
  return valor == "si" ? "Si" : "No";
}

void registrarVenta() {
  stdout.writeln("");
  stdout.writeln("****************************************");
  stdout.writeln("           NUEVA VENTA");
  stdout.writeln("****************************************");

  stdout.write("Nombre del cliente: ");
  var cliente = stdin.readLineSync()!;

  stdout.write("Nombre del medicamento: ");
  var medicamento = stdin.readLineSync()!;

  int cantidad = pedirEntero("Cantidad: ");
  double precioUnitario = pedirDecimal("Precio unitario: \$");
  String receta = pedirSiNo("¿Requiere receta médica? (Si/No): ");

  double total = cantidad * precioUnitario;
  String totalFormateado = total.toStringAsFixed(2);
  String precioFormateado = precioUnitario.toStringAsFixed(2);

  DateTime hoy = DateTime.now();
  String dia = hoy.day.toString().padLeft(2, '0');
  String mes = hoy.month.toString().padLeft(2, '0');
  String hora = hoy.hour.toString().padLeft(2, '0');
  String minuto = hoy.minute.toString().padLeft(2, '0');

  stdout.writeln("");
  stdout.writeln("****************************************");
  stdout.writeln("         FARMACIA SALUD TOTAL");
  stdout.writeln("           RECIBO DE VENTA");
  stdout.writeln("****************************************");
  stdout.writeln("Fecha:......... $dia/$mes/${hoy.year}  $hora:$minuto");
  stdout.writeln("Cliente:....... $cliente");
  stdout.writeln("----------------------------------------");
  stdout.writeln("Medicamento:... $medicamento");
  stdout.writeln("Cantidad:...... $cantidad");
  stdout.writeln("Precio unit.:.. \$$precioFormateado");
  stdout.writeln("Req. receta:... $receta");
  stdout.writeln("----------------------------------------");
  stdout.writeln("TOTAL A PAGAR:.. \$$totalFormateado");
  stdout.writeln("****************************************");
  stdout.writeln("     Gracias por su compra. ¡Cuídese!");
  stdout.writeln("****************************************");
}

int mostrarMenu() {
  int? opcion;
  do {
    stdout.writeln("");
    stdout.writeln("========================================");
    stdout.writeln("       FARMACIA SALUD TOTAL - MENÚ");
    stdout.writeln("========================================");
    stdout.writeln("  1. Registrar nueva venta");
    stdout.writeln("  0. Salir");
    stdout.writeln("========================================");
    stdout.write("Elige una opción: ");
    opcion = int.tryParse(stdin.readLineSync() ?? '');
    if (opcion != 1 && opcion != 0) {
      stdout.writeln("⚠ Opción inválida. Escribe 1 o 0.");
    }
  } while (opcion != 1 && opcion != 0);
  return opcion!;
}

void main() {
  int opcion;
  int ventasRealizadas = 0;

  do {
    opcion = mostrarMenu();

    if (opcion == 1) {
      registrarVenta();
      ventasRealizadas++;
    }
  } while (opcion != 0);

  stdout.writeln("");
  stdout.writeln("Ventas registradas en esta sesión: $ventasRealizadas");
  stdout.writeln("¡Hasta luego!");
}