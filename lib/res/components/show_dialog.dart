import 'package:flutter/material.dart';
import '../app_colors.dart';

class ShowMyAppDialog
{
  showAppDialog(BuildContext context, String imgUrl, String firstName, String lastName, String email){
    showDialog(context: context, builder: (context){
      return Center(
        child: Container(
          height: 230,
          width: 300,
          decoration: BoxDecoration(
            color: AppColor.greenColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius:50,  backgroundImage: NetworkImage(imgUrl),),
                  ],
                ),
                Text("Name: $firstName $lastName"),
                Text("Email: $email"),
              ],
            ),
          ),
        ),
      );
    });
  }
}