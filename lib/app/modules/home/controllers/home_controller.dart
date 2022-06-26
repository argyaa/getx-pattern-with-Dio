import 'package:first_get_cli/app/data/services/user_service.dart';
import 'package:get/get.dart';

import '../../../data/models/user_model.dart';

class HomeController extends GetxController with StateMixin<List<User>> {
  List<User> _user = [];

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future getUser() async {
    change(null, status: RxStatus.loading());
    try {
      _user = await UserService().getUser();
      if (_user.isNotEmpty) {
        change(_user, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    } catch (e) {
      print(e);
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
