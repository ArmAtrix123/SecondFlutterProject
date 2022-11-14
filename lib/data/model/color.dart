import 'package:sqllitemaybe/domain/entity/adress_entity.dart';
import 'package:sqllitemaybe/domain/entity/color_entity.dart';

class color extends color_Entity {
  color({
    super.id_color = 0,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory color.toFromMap(Map<String, dynamic> json) {
    return color(id_color: (json['id_adress'] as int), name: json['name']);
  }
}
