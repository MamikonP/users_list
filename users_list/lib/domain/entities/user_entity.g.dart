// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserEntityCWProxy {
  UserEntity id(String id);

  UserEntity firstname(String? firstname);

  UserEntity lastname(String? lastname);

  UserEntity email(String? email);

  UserEntity phoneNumber(String? phoneNumber);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserEntity call({
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phoneNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserEntity.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserEntity.copyWith.fieldName(...)`
class _$UserEntityCWProxyImpl implements _$UserEntityCWProxy {
  const _$UserEntityCWProxyImpl(this._value);

  final UserEntity _value;

  @override
  UserEntity id(String id) => this(id: id);

  @override
  UserEntity firstname(String? firstname) => this(firstname: firstname);

  @override
  UserEntity lastname(String? lastname) => this(lastname: lastname);

  @override
  UserEntity email(String? email) => this(email: email);

  @override
  UserEntity phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserEntity(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserEntity(...).copyWith(id: 12, name: "My name")
  /// ````
  UserEntity call({
    Object? id = const $CopyWithPlaceholder(),
    Object? firstname = const $CopyWithPlaceholder(),
    Object? lastname = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
  }) {
    return UserEntity(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      firstname: firstname == const $CopyWithPlaceholder()
          ? _value.firstname
          // ignore: cast_nullable_to_non_nullable
          : firstname as String?,
      lastname: lastname == const $CopyWithPlaceholder()
          ? _value.lastname
          // ignore: cast_nullable_to_non_nullable
          : lastname as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
    );
  }
}

extension $UserEntityCopyWith on UserEntity {
  /// Returns a callable class that can be used as follows: `instanceOfUserEntity.copyWith(...)` or like so:`instanceOfUserEntity.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserEntityCWProxy get copyWith => _$UserEntityCWProxyImpl(this);
}
