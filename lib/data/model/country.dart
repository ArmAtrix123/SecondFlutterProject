import 'package:sqllitemaybe/domain/entity/country_entity.dart';

class county extends county_Entity {
  county({
    super.id_county = 0,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory county.toFromMap(Map<String, dynamic> json) {
    return county(id_county: (json['id_county'] as int), name: json['name']);
  }
}
