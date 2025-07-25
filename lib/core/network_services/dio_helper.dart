import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:news_app/core/constans.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: AppConstans.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger(requestHeader: true));
  }

  static getData(String endPoint, {Map<String, dynamic>? query}) async {
    try {
      Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
