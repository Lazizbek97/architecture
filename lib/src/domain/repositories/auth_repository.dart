import 'dart:convert';

import 'package:architecture/src/core/di/api_results.dart';
import 'package:dio/dio.dart';

import '../../core/constants/constants.dart';
import '../../core/di/http_service.dart';
import '../../core/di/injection_extention.dart';
import '../../core/di/network_exceptions.dart';
import '../../data/models/standart_user_model.dart';

class AuthRepository {
  static Future<ApiResult<StandardUserModel>> authStandardUser(
    String companyId,
    String phone,
    String password,
    String referer,
  ) async {
    final data = {
      'company_id': companyId,
      'phone': phone,
      'password': password
    };
    try {
      final response = await inject<HttpService>().authDio.post(
            '/v2/auth/standard/login',
            options: Options(
              headers: {
                'platform-id': Constants.platformId,
                'referer': 'https://$referer.billz.work/'
              },
            ),
            data: jsonEncode(data),
          );
      return ApiResult.success(data: StandardUserModel.fromJson(response.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
