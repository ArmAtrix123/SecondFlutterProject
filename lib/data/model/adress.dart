import 'package:sqllitemaybe/domain/entity/adress_entity.dart';
import 'package:sqllitemaybe/domain/entity/type.entity.dart';

class adress extends adress_entity {
  adress({
    super.id_adress = 0,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory adress.toFromMap(Map<String, dynamic> json) {
    return adress(id_adress: (json['id_adress'] as int), name: json['name']);
  }
}
