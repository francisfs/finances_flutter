import 'cost_model.dart';

class TypeModel {
  final String? name;
  final double? maxAmount;
  final List<CostModel>? expenses;

  TypeModel(
      {required this.name, required this.maxAmount, required this.expenses});
}
