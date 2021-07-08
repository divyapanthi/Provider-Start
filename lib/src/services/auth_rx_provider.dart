import 'package:places/src/model/user_model.dart';
import 'package:rxdart/rxdart.dart';

class AuthRxProvider{
  final BehaviorSubject<String> _tokenSubject = BehaviorSubject();
  final BehaviorSubject<UserModel> _userSubject = BehaviorSubject();

  // getter for adding data
  Function(String token) get addToken => _tokenSubject.sink.add;
  Function(UserModel model) get addUser => _userSubject.sink.add;


  //getters for retrieving the data
  String? get currentToken => _tokenSubject.hasValue ? _tokenSubject.value : null;
  UserModel? get currentUser => _userSubject.hasValue ? _userSubject.value : null;

  void dispose(){
    _tokenSubject.close();
    _userSubject.close();
  }
}