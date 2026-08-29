import 'dart:io';

void registrarVenta() {
  stdout.writeln("");
  stdout.writeln("****************************************");
  stdout.writeln("           NUEVA VENTA");
  stdout.writeln("****************************************");

  stdout.write("Nombre del cliente: ");
  var cliente = stdin.readLineSync()!;

  stdout.write("Nombre del medicamento: ");
  var medicamento = stdin.readLineSync()!;

  stdout.write("Cantidad: ");
  int cantidad = int.parse(stdin.readLineSync()!);

  stdout.write("Precio unitario: \$");
  double precioUnitario = double.parse(stdin.readLineSync()!);

  stdout.write("¿Requiere receta médica? (Si/No): ");
  var receta = stdin.readLineSync()!;

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

void main() {
  int? opcion;
  int ventasRealizadas = 0;

  do {
    stdout.writeln("");
    stdout.writeln("========================================");
    stdout.writeln("       FARMACIA SALUD TOTAL - MENÚ");
    stdout.writeln("========================================");
    stdout.writeln("  1. Registrar nueva venta");
    stdout.writeln("  0. Salir");
    stdout.writeln("========================================");
    stdout.write("Elige una opción: ");
    opcion = int.parse(stdin.readLineSync()!);

    if (opcion != 1 && opcion != 0) {
      stdout.writeln("Opción inválida. Escribe 1 o 0.");
    }

    if (opcion == 1) {
      registrarVenta();
      ventasRealizadas++;
    }
  } while (opcion != 0);

  stdout.writeln("");
  stdout.writeln("Ventas registradas en esta sesión: $ventasRealizadas");
  stdout.writeln("¡Hasta luego!");
}