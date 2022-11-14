import 'package:sqllitemaybe/domain/entity/type.entity.dart';

class adress extends typeEntity {
  adress({
    super.id_type = 0,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory adress.toFromMap(Map<String, dynamic> json) {
    return adress(id_type: (json['id_type'] as int), name: json['name']);
  }
}
