part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState({this.users = const [], this.error});

  final List<UserEntity> users;
  final String? error;

  @override
  List<Object?> get props => [users, error];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {
  UserLoading(UserState initState) : super(users: initState.users);
}

final class UserLoaded extends UserState {
  const UserLoaded(List<UserEntity> users) : super(users: users);
}

final class UserFailed extends UserState {
  UserFailed(UserState initState, String error)
      : super(users: initState.users, error: error);
}
