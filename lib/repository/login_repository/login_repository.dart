import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginUser(var data) {
    dynamic response = _apiService.postApi(data, AppUrl.loginUrl);
    return response;
  }
}
