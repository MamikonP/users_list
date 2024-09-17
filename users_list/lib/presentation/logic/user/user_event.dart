part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUsersEvent extends UserEvent {}

class AddUserEvent extends UserEvent {
  const AddUserEvent({required this.entity});

  final UserEntity entity;
}

class EditUserEvent extends UserEvent {
  const EditUserEvent({required this.entity});

  final UserEntity entity;
}

class DeleteUserEvent extends UserEvent {
  const DeleteUserEvent({required this.id});

  final String id;
}
