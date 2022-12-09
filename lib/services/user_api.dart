import 'package:dio/dio.dart';
import '../utils/constant.dart';
import '../models/user.dart';
import '../models/job.dart';

class UserApi {
  static final Dio _dio = Dio(
    BaseOptions(
        connectTimeout: 8000,
        receiveTimeout: 8000,
        baseUrl: Constant.apiUrl,
        headers: {
          'Accept': 'application/json',
        }),
  );

  static Future<dynamic> getUser({
    required int page,
    required int perPage,
  }) async {
    try {
      // rest api
      Response response = await _dio.get(
        '/users',
        queryParameters: <String, dynamic>{
          'page': page,
          'per_page': perPage,
        },
      );

      return User.fromJson(response.data);
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future<dynamic> createUser({
    required Map<String, dynamic> data,
  }) async {
    try {
      // rest api
      Response response = await _dio.post(
        '/users',
        queryParameters: {
          'data': data,
        },
      );

      if (response.statusCode == 201) {
        return Job.fromJson(response.data);
      }
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future<dynamic> updateUser({
    required int id,
    required Map<String, dynamic> data,
  }) async {
    try {
      // rest api
      Response response = await _dio.put(
        '/users/$id',
        queryParameters: {
          'data': data,
        },
      );

      if (response.statusCode == 200) {
        return Job.fromJson(response.data);
      }
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }

  static Future<dynamic> deleteUser({
    required int id,
  }) async {
    try {
      // rest api
      Response response = await _dio.delete(
        '/users/$id',
      );

      if (response.statusCode == 204) {
        return true;
      }
    } on DioError catch (e) {
      // catch error
      if (e.response != null) {
        throw '${e.response!.statusCode} ${e.response!.statusMessage}';
      } else {
        throw e.message.toString();
      }
    }
  }
}
