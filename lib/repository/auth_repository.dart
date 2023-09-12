import 'package:flutter_provider_mvvm/data/network/base_api_services.dart';
import 'package:flutter_provider_mvvm/data/network/network_api_services.dart';
import 'package:flutter_provider_mvvm/res/app_url.dart';

class AuthRepository
{
  BaseAPIServices _baseAPIServices = NetworkAPIServices();

  Future<dynamic> loginAPI(dynamic data) async
  {
    dynamic res;
    try{
      res = _baseAPIServices.getPOSTResponse(AppUrl.loginEndPoint, data);
    }
    catch(e){
      throw e;
    }
    return res;
  }

  Future<dynamic> registrationAPI(dynamic data) async
  {
    dynamic  res;
    try{
      res =  _baseAPIServices.getPOSTResponse(AppUrl.registerEndPoint, data);
    }
    catch (e){ throw e;}
  }
}