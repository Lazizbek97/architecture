// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:architecture/src/app.dart';
import 'package:architecture/src/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:architecture/src/presentation/theme/cubit/settings_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

// ignore: unused_import
import 'package:architecture/main.dart';
import 'package:get_it/get_it.dart';

void main() {
  serviceLocator(testing: true);
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
  });
}

Future<void> serviceLocator({bool testing = false}) async {
  final getIt = GetIt.instance;
  if (testing) {
    // unit/widget/bloc test
    getIt.registerFactory<SettingsCubit>(() => SettingsCubit());
    getIt.registerFactory<AuthCubit>(() => AuthCubit());
  } else {
    // run app
    getIt.registerFactory<AuthCubit>(() => AuthCubit());
    getIt.registerFactory<SettingsCubit>(() => SettingsCubit());
  }
}
