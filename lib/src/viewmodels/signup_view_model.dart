import 'package:flutter/material.dart';
import 'package:places/src/api/auth_api.dart';
import 'package:places/src/model/network_response_model.dart';

class SignupViewModel extends ChangeNotifier{
  bool _busy = false;

  bool get busy => _busy;

  void setBusy(bool value){
    _busy = value;
    notifyListeners();
  }

  Future<NetworkResponseModel> register(String name, String phone, String email, String password)async{
    final api = AuthApi();
    setBusy(true);
    var response = await api.register(name, phone, email, password);
    setBusy(false);
    return response;
  }
}
