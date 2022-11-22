import 'package:sqllitemaybe/domain/entity/role_entity.dart';

class Role extends RoleEntity {
  Role({
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Role.toFromMap(Map<String, dynamic> json) {
    return Role(name: json['name']);
  }
}
