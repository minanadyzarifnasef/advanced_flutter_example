import 'package:flutter_complete_project/core/networking/error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';
@Freezed()
abstract class ApiResult<T> with _$ApiResult<T>{
  const factory ApiResult.success(T data)=Sucuss<T>;
  const factory ApiResult.failure(ErrorHandler error)=Error<T>;

}