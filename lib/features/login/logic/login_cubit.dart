import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/features/login/data/models/login_request_body.dart';
import 'package:flutter_complete_project/features/login/logic/login_state.dart';

import '../data/repo/login_repo.dart';

class LoginCubit extends Cubit<LoginState>{
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo):super(const LoginState.initial());
  final TextEditingController email=TextEditingController();
  final TextEditingController password=TextEditingController();
  final formKey=GlobalKey<FormState>();
  void login()async{
    emit(const LoginState.loading());
    final response=await _loginRepo.login(
      LoginRequestBody(email: email.text, password: password.text)
    );
    response.when(
      success: (loginResponse){
        emit( LoginState.success(loginResponse));
      },
      failure: (error){
        emit( LoginState.error(error: error.apiErrorModel.message??""));
      }
    );
  }
}