import 'package:dio/dio.dart';
import 'package:flutter_complete_project/core/networking/api_service.dart';
import 'package:flutter_complete_project/core/networking/dio_factory.dart';
import 'package:flutter_complete_project/features/login/data/repo/login_repo.dart';
import 'package:flutter_complete_project/features/login/logic/login_cubit.dart';
import 'package:get_it/get_it.dart';
final gitIt=GetIt.instance;
Future<void> setupGetIt()async{
  Dio dio=DioFactory.getDio();
  gitIt.registerLazySingleton<ApiService>(() => ApiService(dio));


  gitIt.registerLazySingleton<LoginRepo>(() => LoginRepo(gitIt()));
  gitIt.registerLazySingleton<LoginCubit>(() => LoginCubit(gitIt()));

}