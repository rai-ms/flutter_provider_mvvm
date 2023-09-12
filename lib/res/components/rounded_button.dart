import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm/res/app_colors.dart';

class AppRoundedButton extends StatelessWidget {
  String title;
  VoidCallback onTap;
  bool loading;

  AppRoundedButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: AppColor.greenColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: loading? const CircularProgressIndicator(color: Colors.white,) : Text(title)),

      ),
    );
  }
}
