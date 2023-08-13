import 'dart:math';

double generateDouble() {
  final random = Random();
  const decimalPlaces = 2;
  const minValue = 10;
  const maxValue = 100;

  final randomValue = minValue + random.nextDouble() * (maxValue - minValue);
  final roundedValue = double.parse(randomValue.toStringAsFixed(decimalPlaces));

  return roundedValue;
}