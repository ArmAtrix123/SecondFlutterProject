import 'package:sqllitemaybe/domain/entity/color_entity.dart';
import 'package:sqllitemaybe/domain/entity/country_entity.dart';
import 'package:sqllitemaybe/domain/entity/sklad_entity.dart';
import 'package:sqllitemaybe/domain/entity/type.entity.dart';

class product_entity {
  late int id_product;
  final String name;
  final county_Entity id_country;
  final typeEntity id_type;
  final color_Entity id_color;
  final sklad_entity id_sklad;

  product_entity(
      {this.id_product = 0,
      required this.name,
      required this.id_country,
      required this.id_type,
      required this.id_color,
      required this.id_sklad});
}
