import 'dart:convert';
import 'dart:io';

import 'package:flutter_provider_mvvm/data/app_exceptions.dart';
import 'package:flutter_provider_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkAPIServices extends BaseAPIServices {
  @override
  Future getGETResponse(String url) async {
    dynamic responseJSON;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJSON;
  }

  @override
  Future getPOSTResponse(String url, dynamic data) async {
    dynamic responseJSON;
    try {
      final response =
          await http.post(Uri.parse(url), body:  data)
          .timeout(const Duration(seconds: 10));
      responseJSON = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJSON;
  }

  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw InvalidInputException(
            "Error occur while communicating with server ${response.body}");
    }
  }
}
