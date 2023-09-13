import 'package:flutter/cupertino.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../model/temperature_model.dart';
import '../res/app_url.dart';

class TemperatureViewModel extends ChangeNotifier
{

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final BaseAPIServices _baseAPIServices = NetworkAPIServices();
  List<Datum>? _list = [];
  List<Datum> get list => _list!;

  setLoading(bool val){_isLoading = val; notifyListeners();}

  /// It return the List of Datum which contains each user details
  Future<List<Datum>> getUser() async {
    Map<String, dynamic> json = await userDataGetAPI();
    var user = Temperatures.fromJson(json);
    _list = user.data;
    return _list!;
  }

  /// It fetch data from API call
  Future<dynamic> userDataGetAPI() async {
    dynamic res;
    try{
      res = _baseAPIServices.getGETResponse(AppUrl.getUserEndPoint);
      return res;
    }
    catch (e){ throw e;}
  }
}