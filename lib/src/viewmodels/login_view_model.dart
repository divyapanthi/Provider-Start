import 'package:flutter/material.dart';
import 'package:places/src/api/auth_api.dart';
import 'package:places/src/core/base_view_model.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/services/auth/auth_service.dart';

class LoginViewModel extends BaseViewModel{

  final AuthService authService;
  LoginViewModel(this.authService);

  NetworkResponseModel get networkResponseModel =>
      authService.networkResponseModel;

  Future<void> login(String email, String password) async{
    setBusy(true);
    var response = await authService.login(email, password);
    setBusy(false);

  }


}