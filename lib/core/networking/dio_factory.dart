import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory{
  DioFactory._();
  static Dio? _dio;
  static Dio getDio(){
    const Duration duration=Duration(seconds: 30);
    _dio ??= Dio()
      ..options.connectTimeout=duration
    ..options.receiveTimeout=duration;
    addDioInterceptor();
    return _dio!;
  }
  static void  addDioInterceptor(){
    _dio!.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true
        )
    );
  }

}