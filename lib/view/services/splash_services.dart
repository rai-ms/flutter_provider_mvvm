import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_mvvm/utils/custom_toast.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';
import 'package:flutter_provider_mvvm/view_model/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices
{
  Future<UserModel> getDataUserModel() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async
  {
    getDataUserModel().then((value) async
      {
        String isNullToken = value.token.toString();
        if(isNullToken == 'null'){
          await Future.delayed(const Duration(seconds: 3));
          // eve.holt@reqres.in
          CustomToast(message: value.token.toString(), context: context);
          Navigator.pushNamedAndRemoveUntil(context, RouteName.loginPage, (route)=>false);
        }
        else
        {
          await Future.delayed(const Duration(seconds: 3));
          CustomToast(message: "${value.token.toString()}", context: context);
          Navigator.pushNamedAndRemoveUntil(context, RouteName.homePage, (route)=> false);
        }
      }
    )
    .onError((error, stackTrace)
      {

      }
    );
  }

  getToken(BuildContext context){
    getDataUserModel().then((value) async
    {
      if(value.token == null || value.token == ''){
        await Future.delayed(const Duration(seconds: 3));
        CustomToast(message: "${value.token.toString()}", context: context);}
      else { await Future.delayed(const Duration(seconds: 3));
      CustomToast(message: "${value.token.toString()}", context: context); }})
    .onError((error, stackTrace){});
  }

}