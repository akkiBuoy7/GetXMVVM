import 'package:get/get.dart';
import 'package:getx_mvvm/models/home/user_list_model.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

import '../../../data/status.dart';

class HomeViewModel extends GetxController {
  final _repo = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error =  ''.obs;

  void setRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setUserList(UserListModel _value) => userList.value = _value;

  void setError(String _value) => error.value = _value;

  void getUserList() {
    _repo.getUserList().then((value) {
      setRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setRequestStatus(Status.ERROR);
      setError(error.toString());
    });
  }
}
