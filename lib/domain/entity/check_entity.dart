import 'package:sqllitemaybe/domain/entity/product_entity.dart';

class check_entity {
  late int id_check;
  final String date;
  final product_entity id_product;

  check_entity({
    this.id_check = 0,
    required this.date,
    required this.id_product,
  });
}
