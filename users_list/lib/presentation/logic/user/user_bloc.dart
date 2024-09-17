import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/extension/list_extension.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GetUsersEvent>(_mapGetUsersEventToState);
    on<AddUserEvent>(_mapAddUserEventToState);
    on<DeleteUserEvent>(_mapDeleteUserEventToState);
    on<EditUserEvent>(_mapEditUserEventToState);
  }

  final UserRepository userRepository;

  FutureOr<void> _mapGetUsersEventToState(
      GetUsersEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      final users = await userRepository.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapAddUserEventToState(
      AddUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userRepository.addUser(event.entity);
      emit(UserLoaded(List.from(state.users)..add(event.entity)));
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapDeleteUserEventToState(
      DeleteUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userRepository.deleteUser(event.id);
      emit(
        UserLoaded(
          List.from(state.users)
            ..removeWhere((element) => element.id == event.id),
        ),
      );
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }

  FutureOr<void> _mapEditUserEventToState(
      EditUserEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading(state));
      await userRepository.editUser(event.entity);
      emit(
        UserLoaded(
          List<UserEntity>.from(state.users).updateWhere(
              test: (element) => element.id == event.entity.id,
              updateTo: event.entity),
        ),
      );
    } catch (e) {
      emit(UserFailed(state, e.toString()));
    }
  }
}
