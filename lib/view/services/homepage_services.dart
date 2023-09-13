import 'package:flutter_provider_mvvm/model/temperature_model.dart';
import 'package:flutter_provider_mvvm/view_model/temperature_view_model.dart';

class HomePageService {
  Future<List<Datum>> getDataUserModel() => TemperatureViewModel().getUser();
  Future<List<Datum>>  getUser(){
    return getDataUserModel();
  }

  getUsers(){
    return getUser();
  }
}