import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/repositories/user_repository.dart';
import '../presentation/logic/user/user_bloc.dart';

class MainBlocProvider extends StatelessWidget {
  const MainBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) =>
      MultiBlocProvider(providers: <BlocProvider<dynamic>>[
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(
            userRepository: RepositoryProvider.of<UserRepository>(context),
          ),
        ),
      ], child: child);
}
