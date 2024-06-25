import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonColor = AppColors.lavenderColor,
    this.textColor = AppColors.blackColor,
    required this.title,
    required this.onPress,
    this.width = 70,
    this.height = 50,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? const Center(child: CircularProgressIndicator(color: Colors.white,))
            : Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor,
                fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
      ),
    );
  }
}
