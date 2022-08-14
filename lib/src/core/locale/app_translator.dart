import 'translations.dart';

extension AppTranslator on String {
  String get tr {
    return Translations.text(this);
  }
}
