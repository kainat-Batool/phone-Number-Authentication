// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_authentication/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LogOut", style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold
            ),),
            IconButton(onPressed: () {
              auth.signOut().then((value){
                Get.toNamed(RouteName.phoneView);
              });
            }, icon: Icon(Icons.logout_outlined, size: 35,),)
          ],
        ),
      ),
    );
  }
}
