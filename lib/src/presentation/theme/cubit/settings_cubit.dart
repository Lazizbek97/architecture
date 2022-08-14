// This file is "main.dart"
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/local_source.dart';

part 'settings_state.dart';

part 'settings_cubit.freezed.dart';
part 'settings_cubit.g.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final LocalSource _local = LocalSource.instance;
  SettingsCubit()
      : super(SettingsState(
          theme: ThemeMode.system,
          lang: 'ru',
        ));

  Future<void> initialCheck() async {
    String theme = _local.getTheme();
    if (theme.isEmpty) {
      theme = ThemeMode.system.name;
      await _local.setTheme(theme);
    }
    changeTheme(themeFromString(theme));
    String lang = _local.getLocale();
    if (lang.isEmpty) {
      await changeLang('ru');
    } else {
      await changeLang(lang);
    }
  }

  ThemeMode themeFromString(String themeText) => themeText == "dark"
      ? ThemeMode.dark
      : themeText == "light"
          ? ThemeMode.light
          : ThemeMode.system;

  bool get isDarkMode => state.theme == ThemeMode.system
      ? MediaQueryData.fromWindow(WidgetsBinding.instance.window)
              .platformBrightness ==
          Brightness.dark
      : state.theme == ThemeMode.dark;

  void changeTheme(ThemeMode theme) async {
    emit(state.copyWith(theme: theme, update: !state.update));
    await _local.setTheme(theme.name);
  }

  Future<void> changeLang(String lang) async {
    emit(state.copyWith(lang: lang, update: !state.update));
    await _local.setLocale(lang);
  }

  String get lang => state.lang;
}
