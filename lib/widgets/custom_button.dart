import 'package:flutter/material.dart';
import 'package:login_signup_ui_firebase/widgets/button_widget.dart';

class CustomButton extends ButtonWidget {
  CustomButton({
    String? text,
    Color? color,
    Color? textColor,
    VoidCallback? onPressed,
  }) : super(
          child: Text(
            text!,
            style: TextStyle(color: textColor, fontSize: 15),
          ),
          color: color,
          onPressed: onPressed,
        );
}
