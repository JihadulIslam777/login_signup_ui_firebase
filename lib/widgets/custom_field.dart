import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.textInputType,
  }) : super(key: key);

  TextEditingController? controller;
  String? labelText;
  TextInputType? textInputType = TextInputType.name;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: const Color(0xfff9f9f9),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      keyboardType: textInputType,
    );
  }
}
