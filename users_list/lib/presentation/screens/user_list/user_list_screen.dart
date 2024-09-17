import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extension/string_extension.dart';
import '../../../domain/entities/user_entity.dart';
import '../../logic/user/user_bloc.dart';
import '../../shared/modal_sheet.dart';
import '../widgets.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onAddOrUpdateUser(context),
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserFailed && state.error != null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error ?? '')));
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.users.isEmpty) {
            return const Center(
              child: Text('No users found'),
            );
          }
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) => Dismissible(
              key: ValueKey(state.users[index].id),
              onDismissed: (direction) => context
                  .read<UserBloc>()
                  .add(DeleteUserEvent(id: state.users[index].id)),
              background: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              child: ListTile(
                onTap: () =>
                    _onAddOrUpdateUser(context, user: state.users[index]),
                leading: CircleAvatar(
                  child: Text(
                      (state.users[index].firstname ?? '').showFirstLetter()),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${state.users[index].firstname ?? ''} ${state.users[index].lastname ?? ''}'),
                  ],
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.users[index].email ?? ''),
                    Text(state.users[index].phoneNumber ?? ''),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onAddOrUpdateUser(BuildContext context, {UserEntity? user}) {
    showPopup<dynamic>(
        context,
        AddOrUpdateUserWidget(
          userEntity: user,
          onAddOrUpdateUser: user == null
              ? (user) =>
                  context.read<UserBloc>().add(AddUserEvent(entity: user))
              : (user) =>
                  context.read<UserBloc>().add(EditUserEvent(entity: user)),
        ),
        padding: const EdgeInsets.all(16));
  }
}
