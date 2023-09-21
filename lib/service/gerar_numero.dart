import 'dart:math';

class GerarNumeroAleatorio {
    static int randomNumberGenerate(int maxNumber) {
    Random random = Random();
    return random.nextInt(maxNumber);
  }
}