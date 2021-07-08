import 'package:places/src/api/auth_api.dart';
import 'package:places/src/core/constants/app_constants.dart';
import 'package:places/src/model/network_response_model.dart';
import 'package:places/src/model/user_model.dart';
import 'package:places/src/services/auth_rx_provider.dart';
import 'package:places/src/services/local/cache_provider.dart';
import 'package:places/src/services/local/db_provider.dart';

class AuthService{
  // business logic goes here.

  final DbProvider dbProvider;
  final CacheProvider cacheProvider;
  final AuthApi api;
  final AuthRxProvider authRxProvider;


  AuthService(this.dbProvider, this.cacheProvider, this.api, this.authRxProvider);

  NetworkResponseModel? _networkResponseModel;
  NetworkResponseModel get networkResponseModel => _networkResponseModel!;

  Future<void> login(String email, String password) async{
    NetworkResponseModel response = await api.login(email, password);
    if(response.status){
      // to store the user detail and the token
      String token = response.data!;
      await _fetchUserDetail(token);
    }else{
      /// else login failed
      _networkResponseModel = response;
    }
  }

  Future<void> _fetchUserDetail(String token) async {
    final response = await api.fetchUserDetail(token);
    if (response.status) {
      // we get the user detail

      /// 1. Store the token in shared perf
      /// 2. Store the user detail on local db
      /// 3. Notify the view model
      UserModel user = response.data!;


      await cacheProvider.setStringValue(TOKEN_KEY, token);
      await dbProvider.insertUser(user);

      authRxProvider.addToken(token);
      authRxProvider.addUser(user);

      _networkResponseModel = NetworkResponseModel(status: true);
    } else {
      // else we could not get the user detail
      _networkResponseModel = response;
    }
  }
}