import 'package:flutter/material.dart';

import '../Constant/const.dart';

class Custom_Button extends StatelessWidget {
  String text;
  final onpress;
  Custom_Button({Key? key, required this.text, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      height: 45,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: onpress,
      ),
    );
  }
}
