import 'package:architecture/src/presentation/pages/auth/cubit/auth_cubit.dart';
import 'package:architecture/src/presentation/theme/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'core/constants/constants.dart';
import 'core/di/injection_extention.dart';
import 'core/locale/translations.dart';
import 'presentation/theme/app_themes.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
          BlocProvider<SettingsCubit>(
            create: (_) => inject()..initialCheck(),
            lazy: true,
          ),
        ],
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            return KeyboardDismisser(
              gestures: const [GestureType.onTap],
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: Constants.navigatorKey,
                theme: appThemeData[ThemeMode.light],
                darkTheme: appThemeData[ThemeMode.dark],
                locale: Locale(state.lang),
                themeMode: state.theme,
                localizationsDelegates: const [
                  Translations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('ru', 'RU'),
                  Locale('uz', 'UZ'),
                  Locale('en', 'US'),
                ],
                initialRoute: Routes.initial,
                routes: AppPages.routes,
              ),
            );
          },
        ));
  }
}
