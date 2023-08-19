import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

export 'package:dio/dio.dart';

class DioService {
  static final DioService instance = DioService._();

  String baseUrl = "";

  DioService._() {
    baseUrl = dotenv.env["BASE_URL"] ?? "";
  }

  factory DioService() => instance;

  Future<Response> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Response response = await Dio().get(
      baseUrl + path,
      queryParameters: queryParameters,
      options: options,
    );

    return response;
  }

  Future<Response> post({
    required String path,
    Object? data,
    Options? options,
  }) async {
    Response response = await Dio().post(
      baseUrl + path,
      data: data,
      options: options?.copyWith(
        validateStatus: (status) => status! <= 500,
      ),
    );

    return response;
  }
}
