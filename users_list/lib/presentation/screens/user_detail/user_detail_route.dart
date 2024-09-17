import 'package:flutter/cupertino.dart';

import '../../screens.dart';

class UserDetailRoute<T> extends PageRoute<T>
    with CupertinoRouteTransitionMixin<T> {
  UserDetailRoute({super.settings, this.maintainState = true})
      : super(fullscreenDialog: false);

  @override
  Widget buildContent(BuildContext context) {
    return const UserDetailScreen();
  }

  @override
  final bool maintainState;

  @override
  String? get title => '';
}
