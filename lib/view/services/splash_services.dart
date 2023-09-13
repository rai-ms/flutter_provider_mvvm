import 'package:flutter/cupertino.dart';
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
        if(value.token == null || value.token == ''){
          await Future.delayed(const Duration(seconds: 3));
          Navigator.pushNamedAndRemoveUntil(context, RouteName.loginPage, (route)=> route.isFirst);
        }
        else {
          await Future.delayed(const Duration(seconds: 3));
          Navigator.pushNamedAndRemoveUntil(context, RouteName.homePage, (route)=> route.isFirst);
        }
      }
    )
    .onError((error, stackTrace)
      {

      }
    );
  }
}