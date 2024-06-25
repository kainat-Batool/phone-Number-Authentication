// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_authentication/res/colors/app_colors.dart';
import 'package:firebase_phone_authentication/res/components/custom_text_field.dart';
import 'package:firebase_phone_authentication/res/components/round_button.dart';
import 'package:firebase_phone_authentication/view/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  bool loading = false;
  final auth = FirebaseAuth.instance;
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Image.network(
              'https://img.freepik.com/free-vector/privacy-policy-concept-illustration_114360-7853.jpg?t=st=1719083005~exp=1719086605~hmac=7f7a1ea3fc48de0457870db5323c25e353bab1e6e65a36ef8e7df3811b9d25d8&w=826',
              height: 300,
              width: 500,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 05, left: 20),
              child: Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20),
              child: Text(
                'Please login to continue',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),

            Form(
              key: _formKey,
              child: Column(
                children: [

                  ////// P H O N E //////
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                    // Using ScreenUtil for padding
                    child: CustomTextFormField(
                      controller: phoneController,
                      labelText: 'Phone Number',
                      hintText: '+92 335-065-5554',
                      icon: Icons.phone,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter your Phone Number';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),

            ////// S E N T  OTP  B U T T O N  //////
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 60.h),
                // Using ScreenUtil for padding
                child: RoundButton(
                  buttonColor: Colors.blueAccent,
                  textColor: AppColors.whiteColor,
                  height: 50.h,
                  // Using ScreenUtil for height
                  width: 210.w,
                  // Using ScreenUtil for width
                  title: 'Sent OTP',
                  onPress: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      auth.verifyPhoneNumber(
                          phoneNumber: phoneController.text,
                          verificationCompleted: (_) {},
                          verificationFailed: (e) {
                            log('verificationFailed $e');
                          },
                          codeSent: (String verificationId, int? token) {
                            Get.to(OtpView(verificationId: verificationId));
                          },
                          codeAutoRetrievalTimeout: (e) {
                            log('codeAutoRetrievalTimeout $e');
                          });
                      phoneController.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
