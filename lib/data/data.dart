import 'package:firebase_database/firebase_database.dart';
import 'dart:math';
import 'package:finances_flutter/models/custo_model.dart';
import 'package:finances_flutter/models/tipo_model.dart';

FirebaseDatabase database = FirebaseDatabase.instance;
final rand = Random();

final List<double> gastosSemanais = [
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
  rand.nextDouble() * 100,
];

_gerarDespesas() {
  List<CustoModel> custoModel = [
    CustoModel(nome: 'Item 1', custo: rand.nextDouble() * 90),
    CustoModel(nome: 'Item 2', custo: rand.nextDouble() * 90),
    CustoModel(nome: 'Item 3', custo: rand.nextDouble() * 90),
    CustoModel(nome: 'Item 4', custo: rand.nextDouble() * 90),
    CustoModel(nome: 'Item 5', custo: rand.nextDouble() * 90),
  ];
  return custoModel;
}

List<CategoriaModel> categoriasNomes = [
  CategoriaModel(
    nome: 'Casa',
    valorMaximo: 1000,
    despesas: _gerarDespesas(),
  ),
  CategoriaModel(
    nome: 'Viagens',
    valorMaximo: 2500,
    despesas: _gerarDespesas(),
  ),
  CategoriaModel(
    nome: 'Roupas',
    valorMaximo: 1200,
    despesas: _gerarDespesas(),
  ),
  CategoriaModel(
    nome: 'Delivery',
    valorMaximo: 1150,
    despesas: _gerarDespesas(),
  ),
  CategoriaModel(
    nome: 'Games',
    valorMaximo: 1100,
    despesas: _gerarDespesas(),
  ),
  CategoriaModel(
    nome: 'Gasolina',
    valorMaximo: 1270,
    despesas: _gerarDespesas(),
  )
];
