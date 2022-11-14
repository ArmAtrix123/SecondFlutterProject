import 'package:sqllitemaybe/domain/entity/product_entity.dart';

class product extends product_entity {
  product(
      {super.id_product = 0,
      required super.name,
      required super.id_country,
      required super.id_type,
      required super.id_color,
      required super.id_sklad});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id_country': id_country.id_county,
      'id_type': id_type.id_type,
      'id_color': id_color.id_color,
      'id_sklad': id_sklad.id_sklad
    };
  }

  factory product.toFromMap(Map<String, dynamic> json) {
    return product(
        id_product: json['id_product'],
        name: json['name'],
        id_country: json['id_country'],
        id_type: json['id_type'],
        id_color: json['id_color'],
        id_sklad: json['id_sklad']);
  }
}
