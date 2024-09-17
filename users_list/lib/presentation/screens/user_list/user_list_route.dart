import 'package:flutter/cupertino.dart';

import '../../screens.dart';

class UserListRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  UserListRoute({super.settings, this.maintainState = true})
      : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const UserListScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
