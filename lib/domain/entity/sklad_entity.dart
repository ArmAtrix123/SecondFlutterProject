import 'package:sqllitemaybe/domain/entity/adress_entity.dart';
import 'package:sqllitemaybe/domain/entity/user_entity.dart';

class sklad_entity {
  late int id_sklad;
  final String name;
  final adress_entity id_adress;
  final UserEntity id_user;

  sklad_entity(
      {this.id_sklad = 0,
      required this.name,
      required this.id_adress,
      required this.id_user});
}
