class AppException implements Exception{

  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String toString(){
    return "${_message}  ${_prefix}";
  }
}

class InternetException extends AppException{
  InternetException([String? message]):super(message,"No internet");
}

class RequestTimeout extends AppException{
  RequestTimeout([String? message]):super(message,"Request Time out");
}

class ServerException extends AppException{
  ServerException([String? message]):super(message,"Internal Server Error");
}