import 'package:hive/hive.dart';

import '../../core/constants/alias.dart';
import '../../core/constants/constants.dart';
import '../../core/extension/list_extension.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/local/hive_db/hive_db_data_source.dart';
import '../models/user_model.dart';

class UserRespositoryImp implements UserRepository {
  UserRespositoryImp({required this.dbDataSource});

  final HiveDbDataSource dbDataSource;

  Future<Box<MapDynamic>> get usersBox async =>
      dbDataSource.open(kLocalDefaultDb);

  @override
  Future<List<UserEntity>> getUsers() async {
    final box = await usersBox;
    final users = dbDataSource.getAll(box);
    return users
        .toMapString()
        .map((e) => UserModel.fromJson(e).toEntity())
        .toList();
  }

  @override
  Future<void> addUser(UserEntity user) async {
    final box = await usersBox;
    await dbDataSource.put(box, user.id, UserModel.fromEntity(user).toJson());
  }

  @override
  Future<void> deleteUser(String id) async {
    final box = await usersBox;
    if (dbDataSource.containsKey(box, id)) {
      await dbDataSource.delete(box, id);
    }
  }

  @override
  Future<void> editUser(UserEntity user) async {
    final box = await usersBox;
    await dbDataSource.put(box, user.id, UserModel.fromEntity(user).toJson());
  }
}
