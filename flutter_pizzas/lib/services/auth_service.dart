import 'package:flutter_pizzas/services/http_service.dart';

import '../consts.dart';
import '../models/user.dart';

class AuthService{ // ServiceLocator

  static final AuthService _singleton=AuthService._internal();

  final _httpService=HttpService();

  User?  user;

  factory AuthService(){
    return _singleton;
  }

  AuthService._internal();

  Future<bool> login(String username, String password) async{
   try{
     var response=await _httpService.post(API_LOGIN_URL, {
       "username":username,
       "password": password
     });
     if(response?.statusCode==200 && response?.data!=null){
       user=User.fromJson(response!.data);
       HttpService().setup(user!.token);
       return true;
     }
   }catch(e){
     print(e);
   }
   return false;
  }
}