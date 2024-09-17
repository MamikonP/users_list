import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'user_entity.g.dart';

@CopyWith()
class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phoneNumber,
  });

  final String id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? phoneNumber;

  @override
  List<Object?> get props => [id, firstname, lastname, email, phoneNumber];
}
