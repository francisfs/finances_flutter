import 'custo_model.dart';

class CategoriaModel {
  final String? nome;
  final double? valorMaximo;
  final List<CustoModel>? despesas;

  CategoriaModel(
      {required this.nome, required this.valorMaximo, required this.despesas});
}
