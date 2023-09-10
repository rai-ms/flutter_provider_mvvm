abstract class BaseAPIServices {
  Future<dynamic> getGETResponse (String url);
  Future<dynamic> getPOSTResponse(String url, dynamic data);
}
