import 'dart:io';

double calcularValorIMC(double peso, double altura) {
  double imc = peso / (altura * altura);
  return imc;
}

String calculaCategoriaIMC(double imc) {
  if (imc < 18.5) {
    return "Bajo Peso";
  } else if (imc >= 18.5 && imc <= 24.9) {
    return "Normal";
  } else if (imc >= 25 && imc <= 29.9) {
    return "Sobrepeso";
  } else if (imc >= 30 && imc <= 34.9) {
    return "Obesidad I";
  } else if (imc >= 35 && imc <= 39.9) {
    return "Obesidad II";
  } else {
    return "Obesidad III";
  }
}

void main() {
  int opcion = 1;

  do {
    stdout.writeln("");
    stdout.writeln("========= CALCULADORA DE IMC =========");
    stdout.writeln("  1. Calcular IMC");
    stdout.writeln("  0. Salir");
    stdout.writeln("=======================================");
    stdout.write("Elige una opción: ");
    opcion = int.parse(stdin.readLineSync()!);

    if (opcion != 1 && opcion != 0) {
      stdout.writeln("Opción inválida. Escribe una de las opciones disponibles.");
    }

    if (opcion == 1) {
      stdout.write("Ingresa tu peso en kg: ");
      double peso = double.parse(stdin.readLineSync()!);
      stdout.write("Ingresa tu altura en metros (ej: 1.70): ");
      double altura = double.parse(stdin.readLineSync()!);
      double imc = calcularValorIMC(peso, altura);

      String categoriaIMC = calculaCategoriaIMC(imc);
      stdout.writeln("Peso: $peso kg");
      stdout.writeln("Altura: $altura m");
      stdout.writeln("Tu IMC es: ${imc.toStringAsFixed(2)} - $categoriaIMC");
    }
  } while (opcion != 0);
}