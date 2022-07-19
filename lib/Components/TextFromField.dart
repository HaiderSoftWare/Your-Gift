import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constant/const.dart';

class TextFromFeiled extends StatelessWidget {
  String? hinttext;
  final controller;
  final validatorf;
  final obscureText;
  TextInputType? keyborad;

  TextFromFeiled(
      {required this.hinttext,
      required this.controller,
      required this.validatorf,
      required this.keyborad,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 50,
      child: TextFormField(
        obscureText: obscureText,
        validator: validatorf,
        textAlign: TextAlign.end,
        controller: controller,
        keyboardType: keyborad,
        decoration: InputDecoration(
          hintText: hinttext,
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: primaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: primaryColor),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: primaryColor),
          ),
        ),
      ),
    );
  }
}
