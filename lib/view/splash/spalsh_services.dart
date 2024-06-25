import 'dart:async';

import 'package:firebase_phone_authentication/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashServices {
  void isLogin() {
    Timer(Duration(seconds: 3), () => Get.toNamed(RouteName.homeView));
  }
}
