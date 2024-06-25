import 'package:firebase_phone_authentication/routes/routes_name.dart';
import 'package:firebase_phone_authentication/view/homeView/home_view.dart';
import 'package:firebase_phone_authentication/view/phone_view.dart';
import 'package:firebase_phone_authentication/view/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static appRoute() => [
        GetPage(
          name: RouteName.splashView,
          page: () => const SplashView(),
        ),
        GetPage(
          name: RouteName.phoneView,
          page: () => const PhoneView(),
        ),
        GetPage(
          name: RouteName.homeView,
          page: () => const HomeView(),
        ),
      ];
}
