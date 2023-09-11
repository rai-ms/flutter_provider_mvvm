import 'package:flutter/material.dart';

class CustomToast
{
  String? message;
  CustomToast({required BuildContext context, required String message}) 
  {
      final overlay = Overlay.of(context);
      final overlayEntry = OverlayEntry(
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: 30),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade900, width: 1)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.notifications_on_rounded, color: Colors.blue,),
                SizedBox(width: 8),
                Text(
                  message,
                  style: TextStyle(color: Colors.black, fontSize: 11, decoration: TextDecoration.none),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}