import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    super.firstname,
    super.lastname,
    super.email,
    super.phoneNumber,
  });

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        firstname: entity.firstname,
        lastname: entity.lastname,
        email: entity.email,
        phoneNumber: entity.phoneNumber,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserEntity toEntity() => UserEntity(
        id: id,
        firstname: firstname,
        lastname: lastname,
        email: email,
        phoneNumber: firstname,
      );
}
