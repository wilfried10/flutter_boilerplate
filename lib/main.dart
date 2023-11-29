import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_kit/src/core/app_initializer.dart';
import 'package:flutter_kit/src/core/application.dart';

void main() {
  final AppInitializer appInitializer = AppInitializer();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await appInitializer.preAppRun();

      runApp(_Unfocus(child: Application()));

      appInitializer.postAppRun();
    },
    (error, stack) {},
  );
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
