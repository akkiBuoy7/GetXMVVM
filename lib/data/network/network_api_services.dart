import 'dart:convert';
import 'dart:io';

import 'package:getx_mvvm/data/app_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      responseJson = returnResponse((response));
    } on SocketException {
      throw InternetException("");
    } on RequestTimeoutException {
      throw RequestTimeoutException("");
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(data, String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));

      responseJson = returnResponse((response));
    } on SocketException {
      throw InternetException("");
    } on RequestTimeoutException {
      throw RequestTimeoutException("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw InvalidUrlException();
      default:
        throw FetchDataException(
            "error while fetching data ${response.statusCode.toString()}");
    }
  }
}
