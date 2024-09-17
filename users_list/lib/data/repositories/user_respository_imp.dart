import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

class UserRespositoryImp implements UserRepository {
  @override
  Future<void> addUser(UserEntity user) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> editUser(UserEntity user) {
    throw UnimplementedError();
  }
}
