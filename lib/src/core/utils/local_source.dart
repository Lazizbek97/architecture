import 'package:shared_preferences/shared_preferences.dart';

const String themeKey = "current_theme";
const String languageCode = 'languageCode';

class LocalSource {
  LocalSource._();
  static SharedPreferences? _sharedPreferences;
  static LocalSource? localSource;
  static LocalSource instance = LocalSource._();

  Future<void> _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<LocalSource> getInstance() async {
    if (localSource == null) {
      localSource = LocalSource._();
      await localSource?._init();
    }
    return localSource!;
  }

  static Future<SharedPreferences> getSharedPref() async {
    if (localSource == null) {
      localSource = LocalSource._();
      await localSource?._init();
    }
    return _sharedPreferences!;
  }

  String getUserId() {
    return _sharedPreferences!.getString("userId") ?? '';
  }

  Future<void> setUserId(String id) async {
    await _sharedPreferences?.setString("userId", id);
  }

   Future<void> setProduction(bool value) async {
    await _sharedPreferences?.setBool("is_production", value);
  }

  bool getProduction() {
    return _sharedPreferences?.getBool("is_production") ?? true;
  }

   String getLocale() {
    return _sharedPreferences?.getString(languageCode) ?? 'ru';
  }

  Future<void> setLocale(String lang) async {
    await _sharedPreferences?.setString(languageCode, lang);
  }

   String getTheme() {
    return _sharedPreferences?.getString(themeKey) ?? '';
  }

  Future<void> setTheme(String theme) async {
    await _sharedPreferences?.setString(themeKey, theme);
  }
}
