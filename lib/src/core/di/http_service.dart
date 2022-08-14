import 'package:dio/dio.dart';

import '../constants/constants.dart';

class HttpService {
  Dio authDio = Dio(
    BaseOptions(
      baseUrl: Constants.authUrl(),
      followRedirects: false,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    ),
  );

  Dio adminDio = Dio(
    BaseOptions(
      baseUrl: Constants.adminUrl(),
      followRedirects: false,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      sendTimeout: 30000,
    ),
  );

  HttpService() {
    authDio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );

    adminDio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );
  }
}
