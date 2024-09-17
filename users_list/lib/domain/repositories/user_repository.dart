import '../entities/user_entity.dart';

abstract interface class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<void> addUser(UserEntity user);
  Future<void> deleteUser(String id);
  Future<void> editUser(UserEntity user);
}
