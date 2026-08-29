import 'dart:io';

void registrarVenta() {
  stdout.writeln("");
  stdout.writeln("========================================");
  stdout.writeln("           NUEVA VENTA");
  stdout.writeln("========================================");

  stdout.write("Producto: ");
  var producto = stdin.readLineSync()!;

  stdout.write("Talla (S/M/L/XL): ");
  var talla = stdin.readLineSync()!;

  stdout.write("Precio original: \$");
  double precio = double.parse(stdin.readLineSync()!);

  stdout.write("¿Aplica descuento? (Si/No): ");
  var aplicaDescuento = stdin.readLineSync()!;

  double porcentaje = 0;
  double precioFinal = precio;

  if (aplicaDescuento.toLowerCase() == "si") {
    stdout.writeln("Elige el porcentaje de descuento:");
    stdout.writeln("  1. 10%");
    stdout.writeln("  2. 20%");
    stdout.writeln("  3. 30%");
    stdout.write("Opción: ");
    int opcionDescuento = int.parse(stdin.readLineSync()!);

    if (opcionDescuento == 1) porcentaje = 0.10;
    if (opcionDescuento == 2) porcentaje = 0.20;
    if (opcionDescuento == 3) porcentaje = 0.30;

    double descuento = precio * porcentaje;
    precioFinal = precio - descuento;
  }

  String precioFormateado = precio.toStringAsFixed(2);
  String precioFinalFormateado = precioFinal.toStringAsFixed(2);
  String porcentajeTexto = "${(porcentaje * 100).toInt()}%";

  DateTime hoy = DateTime.now();
  String dia = hoy.day.toString().padLeft(2, '0');
  String mes = hoy.month.toString().padLeft(2, '0');

  stdout.writeln("");
  stdout.writeln("========================================");
  stdout.writeln("         MODA STYLE - RECIBO");
  stdout.writeln("========================================");
  stdout.writeln("Fecha:............. $dia/$mes/${hoy.year}");
  stdout.writeln("----------------------------------------");
  stdout.writeln("Producto:.......... $producto");
  stdout.writeln("Talla:.............. $talla");
  stdout.writeln("Precio original:.... \$$precioFormateado");
  if (aplicaDescuento.toLowerCase() == "si") {
    stdout.writeln("Descuento aplicado:. $porcentajeTexto");
  } else {
    stdout.writeln("Descuento aplicado:. Ninguno");
  }
  stdout.writeln("----------------------------------------");
  stdout.writeln("TOTAL A PAGAR:...... \$$precioFinalFormateado");
  stdout.writeln("========================================");
  stdout.writeln("      ¡Gracias por su compra!");
  stdout.writeln("========================================");
}

void main() {
  int? opcion;
  int ventasRealizadas = 0;

  do {
    stdout.writeln("");
    stdout.writeln("========================================");
    stdout.writeln("       MODA STYLE - MENÚ PRINCIPAL");
    stdout.writeln("========================================");
    stdout.writeln("  1. Registrar venta");
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