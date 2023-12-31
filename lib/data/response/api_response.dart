import 'package:flutter_provider_mvvm/data/response/status.dart';

class APIResponse<T> {
  Status? status;
  T? data;
  String? message;

  APIResponse(this.status, this.data, this.message);

  APIResponse.loading() : status = Status.LOADING;
  APIResponse.completed() : status = Status.COMPLETED;
  APIResponse.error() : status = Status.ERROR;

  @override
  String toString() {
    return "Status: $status \n Data: $data \n Message: $message";
  }
}
