import 'dart:io';
import 'dart:math';

class ValorInvalidoException implements Exception {
  final String mensagem;
  
  const ValorInvalidoException(this.mensagem);
  
  @override
  String toString() => mensagem;
}

void main() {
  String peso = lerStringComTexto("Digite seu peso em kg: ");
  double pesoNumerico = double.tryParse(peso) ?? 0.0;
  
  String altura = lerStringComTexto("Digite sua altura em cm: ");
  double alturaNumerica = double.tryParse(altura) ?? 0.0;
  
  try {
    double imc = calcularIMC(pesoNumerico, alturaNumerica);
    String resultado = retornarClassificacaoIMC(imc);
    
    print("Seu IMC é: $imc");
    print("Classificação: $resultado");
  } on ValorInvalidoException catch(e) {
    print("Erro: ${e.mensagem}");
  }
}

double calcularIMC(double peso, double altura) {
  if(peso <= 0 || altura <= 0) {
    throw ValorInvalidoException("Peso e altura devem ser maiores que zero.");
  }
  double alturaMetros = altura / 100;
  return peso / pow(alturaMetros, 2);
}

String retornarClassificacaoIMC(double imc) {
  if (imc >= 40) {
    return 'Obesidade Grau III';
  } else if (imc >= 35) {
    return 'Obesidade Grau II';
  } else if (imc >= 30) {
    return 'Obesidade Grau I';
  } else if (imc >= 25) {
    return 'Sobrepeso';
  } else if (imc >= 18.5) {
    return 'Normal';
  } else {
    return 'Magreza';
  }
}

String lerStringComTexto(String texto) {
  print(texto);
  return stdin.readLineSync() ?? "";
}