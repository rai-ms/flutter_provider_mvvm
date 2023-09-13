import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_mvvm/model/user_model.dart';
import 'package:flutter_provider_mvvm/repository/auth_repository.dart';
import 'package:flutter_provider_mvvm/utils/custom_toast.dart';
import 'package:flutter_provider_mvvm/utils/routes/route_name.dart';
import 'package:flutter_provider_mvvm/view_model/user_view_model.dart';

class AuthViewModel extends ChangeNotifier
{
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setLoading(bool val){_isLoading = val; notifyListeners();}

  final _myRepo = AuthRepository();
  Future<void> loginAPI(dynamic data, BuildContext context)async {
    setLoading(true);
    _myRepo.loginAPI(data).then((value){
      CustomToast(context: context, message: "Login Successful");
      UserViewModel().saveUser(UserModel.fromJSON(value));
      Navigator.pushReplacementNamed(context, RouteName.homePage);
    }).onError((error, stackTrace){
      CustomToast(context: context, message: error.toString());
    });
    setLoading(false);
  }

  Future<void> signupAPI(dynamic data, BuildContext context)async {
    setLoading(true);
    _myRepo.registrationAPI(data).then((value){
      CustomToast(context: context, message: "SignUp Successful");
    }).onError((error, stackTrace){
      CustomToast(context: context, message: error.toString());
    });
    setLoading(false);
  }

}