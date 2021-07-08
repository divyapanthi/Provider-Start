import 'dart:convert';

import 'package:http/http.dart';
import 'package:places/src/core/constants/app_url.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/model/user_model.dart';

class AuthApi {
  Future<NetworkResponseModel> login(String email, String password) async {
    Map<String, dynamic> requestBody = {"email": email, "password": password};
    try {
      var uri = Uri.parse(AppUrl.LOGIN_URL);
      final response = await post(
        uri,
        body: jsonEncode(requestBody),
        headers: {"Content-Type": "application/json"},
      );
      final body = response.body;
      print("login response $body");
      final parsed = jsonDecode(body);
      if (parsed["token"] == null) {
        return NetworkResponseModel(
            status: false,
            message: parsed["error"] ??
                "Could not login with the credential provided");
      }
      return NetworkResponseModel(status: true, data: parsed["token"]);
    } catch (e) {
      print("login exception $e");

      return NetworkResponseModel(
          status: false, message: "$e".replaceAll("Exception:", ""));
    }
  }

  Future<NetworkResponseModel> fetchUserDetail(String token) async {
    try {
      var uri = Uri.parse(AppUrl.PROFILE_URL);
      final response = await get(
        uri,
        headers: {
          "Content-Type": "application/json",
          // "Authorization":"Bearer $token",
          "x-auth-token": token
        },
      );
      final body = response.body;
      print("me response $body");
      final parsed = jsonDecode(body);
      if (parsed["data"] == null) {
        return NetworkResponseModel(
            status: false,
            message: parsed["error"] ??
                "Could not login with the credential provided");
      }

      final user = UserModel.fromJson(parsed["data"]);
      return NetworkResponseModel(status: true, data: user);
    } catch (e) {
      print("profile fetch exception $e");
      return NetworkResponseModel(
          status: false, message: "$e".replaceAll("Exception:", ""));
    }
  }

  Future<NetworkResponseModel> register(
      String name, String phone, String email, String password) async {
    Map<String, dynamic> requestBody = {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
    };
    try {
      var uri = Uri.parse(AppUrl.REGISTER_URL);
      final response = await post(
        uri,
        body: jsonEncode(requestBody),
        headers: {"Content-Type": "application/json"},
      );
      final body = response.body;
      print("Signup response $body");
      final parsed = jsonDecode(body);
      if (parsed["token"] == null) {
        return NetworkResponseModel(
            status: false,
            message: parsed["error"] ??
                "Could not login with the credential provided");
      }
      return NetworkResponseModel(status: true, data: parsed["token"]);
    } catch (e) {
      print("Signup exception $e");
      return NetworkResponseModel(
          status: false, message: "$e".replaceAll("Exception:", ""));
    }
  }
}
