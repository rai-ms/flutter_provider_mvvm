import 'package:flutter_provider_mvvm/model/temperature_model.dart';
import 'package:flutter_provider_mvvm/view_model/temperature_view_model.dart';

class HomePageService {
  List<Datum> users = [];
  Future<List<Datum>> getUser() async {
    users = await TemperatureViewModel().getUser();
    return users;
  }
}