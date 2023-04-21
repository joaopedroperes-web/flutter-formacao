import 'package:test/test.dart';
import '../bin/desafio_calculadora_imc.dart';

void main() {
  group('Calculadora IMC', () {
    test('Teste de cálculo de IMC', () {
      double peso = 70.0;
      double altura = 170.0;

      double imc = calcularIMC(peso, altura);

      expect(imc, closeTo(24.22, 0.01));
    });

    test('Teste de classificação de IMC', () {
      double imcMagreza = 16.0;
      double imcNormal = 23.0;
      double imcSobrepeso = 27.0;
      double imcObesidadeI = 32.0;
      double imcObesidadeII = 37.0;
      double imcObesidadeIII = 42.0;

      String classificacaoMagreza = retornarClassificacaoIMC(imcMagreza);
      String classificacaoNormal = retornarClassificacaoIMC(imcNormal);
      String classificacaoSobrepeso = retornarClassificacaoIMC(imcSobrepeso);
      String classificacaoObesidadeI = retornarClassificacaoIMC(imcObesidadeI);
      String classificacaoObesidadeII = retornarClassificacaoIMC(imcObesidadeII);
      String classificacaoObesidadeIII = retornarClassificacaoIMC(imcObesidadeIII);

      expect(classificacaoMagreza, equals('Magreza'));
      expect(classificacaoNormal, equals('Normal'));
      expect(classificacaoSobrepeso, equals('Sobrepeso'));
      expect(classificacaoObesidadeI, equals('Obesidade Grau I'));
      expect(classificacaoObesidadeII, equals('Obesidade Grau II'));
      expect(classificacaoObesidadeIII, equals('Obesidade Grau III'));
    });
  });
}