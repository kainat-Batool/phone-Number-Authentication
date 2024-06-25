// ignore_for_file: prefer_const_constructors

import 'package:firebase_phone_authentication/view/splash/spalsh_services.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
   // splashServices.isLogin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
