import 'dart:math';
import 'package:finances_flutter/models/cost_model.dart';
import 'package:finances_flutter/models/type_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_generateExpenses() {
  List<CostModel> costModel = [
    CostModel(name: 'Item 1', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 2', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 3', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 4', cost: rand.nextDouble() * 90),
    CostModel(name: 'Item 5', cost: rand.nextDouble() * 90),
  ];
  return costModel;
}

List<TypeModel> typeNames = [
  TypeModel(
    name: 'House',
    maxAmount: 2000,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'House',
    maxAmount: 2000,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Clothing',
    maxAmount: 2000,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Food',
    maxAmount: 2000,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Games',
    maxAmount: 2000,
    expenses: _generateExpenses(),
  ),
  TypeModel(
    name: 'Travel',
    maxAmount: 2000,
    expenses: _generateExpenses(),
  )
];
