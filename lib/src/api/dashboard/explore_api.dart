import 'dart:convert';

import 'package:http/http.dart';
import 'package:places/src/core/constants/app_url.dart';
import 'package:places/src/model/dashboard/place_model.dart';
import 'package:places/src/model/network_response_model.dart';

class ExploreApi {
  Future<NetworkResponseModel> getAllPlaces() async {
    try {
      final uri = Uri.parse(AppUrl.PLACES_LIST_URL);
      final response = await get(uri);
      final body = jsonDecode(response.body);
      print("list of places $body");
      final list = PlaceModel.allResponse(body);
      return NetworkResponseModel(status: true, data: list);
    } catch (e) {
      print("The places exception $e");
      return NetworkResponseModel(
          status: false, message: "$e".replaceAll("Exception:", ""));
    }
  }
}
