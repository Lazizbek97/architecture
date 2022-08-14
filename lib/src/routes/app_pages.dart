import 'package:flutter/material.dart';

import '../presentation/pages/auth/auth_page.dart';
import '../presentation/pages/launcher_page/launcher_page.dart';
import '../presentation/pages/main_page/main_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static Map<String, WidgetBuilder> routes = {
    Routes.initial: (_) => const LauncherPage(),
    Routes.auth: (_) => AuthPage(),
    Routes.main: (_) => const MainPage(),
  };
}
