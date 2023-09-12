import 'package:flutter/cupertino.dart';
import 'package:flutter_provider_mvvm/repository/auth_repository.dart';
import 'package:flutter_provider_mvvm/utils/custom_toast.dart';

class AuthViewModel extends ChangeNotifier
{
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool val){_isLoading = val; notifyListeners();}

  final _myRepo = AuthRepository();
  Future<void> loginAPI(dynamic data, BuildContext context)async {
    setLoading(true);
    _myRepo.loginAPI(data).then((value){
      setLoading(false);
      CustomToast(context: context, message: "Login Successful");
    }).onError((error, stackTrace){
      CustomToast(context: context, message: error.toString());
      setLoading(false);
    });
  }
}