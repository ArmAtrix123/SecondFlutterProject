import 'package:sqllitemaybe/domain/entity/sklad_entity.dart';

class sklad extends sklad_entity {
  sklad(
      {super.id_sklad = 0,
      required super.name,
      required super.id_adress,
      required super.id_user});

  Map<String, dynamic> toMap() {
    return {
      'ID_Adress': id_adress.id_adress,
      'ID_User': id_user.id,
      'name': name
    };
  }

  factory sklad.toFromMap(Map<String, dynamic> json) {
    return sklad(
        id_sklad: (json['id_sklad'] as int),
        id_adress: json['id_adress'],
        id_user: json['id_user'],
        name: json['name']);
  }
}
