import 'package:flutter_pizzas/models/recipe.dart';
import 'package:flutter_pizzas/services/http_service.dart';

import '../consts.dart';
import '../models/user.dart';

class DataService{ // ServiceLocator

  static final DataService _singleton=DataService._internal();

  final _httpService=HttpService();

  User?  user;

  factory DataService(){
    return _singleton;
  }

  DataService._internal();

  Future<List<Recipe>?> getRecipes(String filter) async{
    String path=RECIPES_URL;
    if(filter.isNotEmpty){
      path="$RECIPES_URL/meal-type/$filter";
    }
    try{
      var response=await _httpService.get(path);
      if(response?.statusCode ==200 && response?.data!=null){
        print(response!.data);
        List data=response!.data['recipes'];
        List<Recipe> recipes=data.map((e) => Recipe.fromJson(e)).toList();
        return recipes;
      }
    }catch(e){
      print(e);
    }
  }
}