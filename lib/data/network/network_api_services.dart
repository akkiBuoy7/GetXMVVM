import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
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
      if(kDebugMode){
        print("#### url: $url");
        print("#### QUERY PARAM: $data");
      }
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));

      responseJson = returnResponse((response));
    } on SocketException {
      throw InternetException("");
    } on RequestTimeoutException {
      throw RequestTimeoutException("");
    }
    if(kDebugMode){
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if(kDebugMode){
      print("#### RESPONSE: ${response.body.toString()}");
      print("#### RESPONSE CODE: ${response.statusCode.toString()}");
    }
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            "error while fetching data ${response.statusCode.toString()}");
    }
  }
}
