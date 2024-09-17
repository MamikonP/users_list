import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_sources/local/hive_db/hive_db_data_source.dart';
import '../data/data_sources/local/hive_db/hive_db_data_source_imp.dart';
import '../data/repositories/user_respository_imp.dart';
import '../domain/repositories/user_repository.dart';
import 'constants/alias.dart';

class MainRepositoryProvider extends StatelessWidget {
  const MainRepositoryProvider({super.key, required this.builder});

  final MainRepositoryBuilderCallback builder;

  @override
  Widget build(BuildContext context) => MultiRepositoryProvider(
        providers: <RepositoryProvider<dynamic>>[
          RepositoryProvider<HiveDbDataSource>(
            create: (context) => HiveDbDataSourceImp(),
          ),
          RepositoryProvider<UserRepository>(
            create: (context) => UserRespositoryImp(
              dbDataSource: RepositoryProvider.of<HiveDbDataSource>(context),
            ),
          )
        ],
        child: builder(context),
      );
}
