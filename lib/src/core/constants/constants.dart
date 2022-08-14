import 'package:flutter/material.dart';

import '../utils/local_source.dart';

class Constants {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const platformId = '';

  static String authUrl() => LocalSource.instance.getProduction() ? '' : '';

  static String adminUrl() => LocalSource.instance.getProduction() ? '' : '';
}
