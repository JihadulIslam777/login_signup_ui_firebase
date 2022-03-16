import 'package:flutter/material.dart';
import 'package:login_signup_ui_firebase/widgets/button_widget.dart';

class SocialSignInButton extends ButtonWidget {
  SocialSignInButton({
    IconData? assetName,
    String? text,
    Color? color,
    Color? textColor,
    Color? iconColor,
    VoidCallback? onPressed,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                assetName!,
                color: iconColor,
              ),
              Text(
                text!,
                style: TextStyle(fontSize: 15, color: textColor),
              ),
              Opacity(
                opacity: 0,
                child: Icon(assetName),
              ),
            ],
          ),
          onPressed: onPressed,
          color: color,
        );
}
