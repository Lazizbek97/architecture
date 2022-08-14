import 'package:architecture/src/app.dart';
import 'package:architecture/src/core/utils/local_source.dart';
import 'package:architecture/src/presentation/theme/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalSource.getInstance();

  GetIt.I.registerLazySingleton<SettingsCubit>(
    () => SettingsCubit()..initialCheck(),
  );
  runApp(const MyApp());
}
