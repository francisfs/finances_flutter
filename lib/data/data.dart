import 'dart:math';
import 'package:finances_flutter/models/cost_model.dart';
import 'package:finances_flutter/models/type_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 1,
  rand.nextDouble() * 10,
  rand.nextDouble() * 10,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 10,
  rand.nextDouble() * 100,
];

_generateExpenses() {
  List<CostModel> costModel = [
    CostModel(name: 'Item 1', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 2', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 3', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 4', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 5', cost: rand.nextDouble() * 9),
  ];
  return costModel;
}

List<TypeModel> typeNames = [
  TypeModel(
    name: 'Casa',
    maxAmount: 1000,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Viagens',
    maxAmount: 2500,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Roupas',
    maxAmount: 1200,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Delivery',
    maxAmount: 1150,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Games',
    maxAmount: 1100,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Gasolina',
    maxAmount: 1270,
    expenses: _generateExpenses(),
  )
];
