import 'package:hive/hive.dart';

abstract interface class HiveDbDataSource {
  Future<Box<T>> open<T>(String dbName);
  Future<void> add<T>(Box<T> db, T value);
  Future<void> put<T>(Box<T> db, Object key, T value);
  List<T> getAll<T>(Box<T> db);
  T? get<T>(Box<T> db, Object key);
  Future<void> delete<T>(Box<T> db, String dbName);
  Future<void> clear<T>(Box<T> db);
}
