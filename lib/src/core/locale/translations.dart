import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Translations {
  Translations._();

  static Map<String, dynamic> _localizedValues = {};

  static String text(String key) {
    if (_localizedValues.isNotEmpty) {
      _localizedValues[key] ?? '*$key';
    }
    return '';
  }

  static Future<Translations> load(Locale locale) async {
    Translations _translations = Translations._();
    String jsonContent = await rootBundle.loadString(
      "assets/locale/${locale.languageCode}.json",
    );
    try {
      _localizedValues = jsonDecode(jsonContent);
    } catch (e) {
      print(e);
    }
    return _translations;
  }

  static const LocalizationsDelegate<Translations> delegate =
      TranslationsDelegate();
}

class TranslationsDelegate extends LocalizationsDelegate<Translations> {
  const TranslationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'uz', 'en'].contains(
        locale.languageCode,
      );

  @override
  Future<Translations> load(Locale locale) async {
    return await Translations.load(locale);
  }

  @override
  bool shouldReload(TranslationsDelegate old) => false;
}
