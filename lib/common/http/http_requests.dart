import 'package:dio/dio.dart';
import 'package:gtodolist/common/constants/constants.dart';
import 'package:gtodolist/common/http/request_apis.dart';
import 'package:logger/logger.dart';
import 'package:sp_util/sp_util.dart';

class HttpRequest {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: RequestApi.baseUrl,
    connectTimeout: 10000,
    sendTimeout: 10000,
    receiveTimeout: 10000,
    contentType: 'application/json; charset=utf-8',
    responseType: ResponseType.json,
    headers: {
      'Accept': 'application/json, text/plain, */*',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': '*',
    },
  ));

  static final Logger _logger = Logger();

  static Future pathGet(String path, {List<dynamic>? params}) async {
    Response? response;
    for (dynamic param in (params ?? [])) {
      path = '$path/$param';
    }
    response = await _dio.get(path, options: Options(headers: getHeader()));
    return response.data;
  }

  static Future queryGet(String path, {Map<String, dynamic>? params}) async {
    Response? response;
    response = await _dio.get(path,
        queryParameters: params, options: Options(headers: getHeader()));
    return response.data;
  }

  static Future<Map<String, dynamic>> formPost(String path,
      {Map<String, dynamic>? params}) async {
    Response? response;
    FormData formData = FormData.fromMap(params ?? {});
    response = await _dio.post(path,
        data: formData, options: Options(headers: getHeader()));
    _logger.i(response.data);
    return response.data;
  }

  static Future bodyPost(String path, {Map<String, dynamic>? params}) async {
    Response? response;
    response = await _dio.post(path,
        data: params, options: Options(headers: getHeader()));
    return response.data;
  }

  static Map<String, dynamic>? getHeader() {
    Map<String, dynamic> headers = {};

    // 放入token
    String? token = SpUtil.getString(Constants.authorization);
    _logger.i('token: $token');
    // token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NDAyMjg0MDQsImlhdCI6MTcwODY5MjQwNCwiand0VXNlcklkIjo0fQ.v5p1Kwl8w2Iof879c0P4LYnKErpiMFP5kGoIJ20M-wY';
    headers[Constants.authorization] = token;

    _logger.i('headers: {$headers}');
    return headers;
  }
}
