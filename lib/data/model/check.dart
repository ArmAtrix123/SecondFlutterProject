import 'package:sqllitemaybe/domain/entity/check_entity.dart';

class check extends check_entity {
  check({
    super.id_check = 0,
    required super.date,
    required super.id_product,
  });

  Map<String, dynamic> toMap() {
    return {'date': date, 'id_product': id_product.id_product};
  }

  factory check.toFromMap(Map<String, dynamic> json) {
    return check(
        id_check: (json['id_check'] as int),
        date: json['date'],
        id_product: json['id_product']);
  }
}
