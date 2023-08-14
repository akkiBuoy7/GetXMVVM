import '../status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.onLoading() : status = Status.LOADING;

  ApiResponse.onCompleted(this.data) : status = Status.COMPLETED;

  ApiResponse.onError(this.message) : status = Status.COMPLETED;

  @override
  toString() {
    return "Status: ${status} Data: ${data} message: ${message}";
  }
}
