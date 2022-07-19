import 'package:flutter/material.dart';

class StateOfApp extends ChangeNotifier {
  String? selectforyou = "صديق / صديقة";
  String? selectgender = "ذكر";

  onChangedYou(String value) {
    selectforyou = value;
    notifyListeners();
  }

  onChangedgender(String value) {
    selectgender = value;
    notifyListeners();
  }
}
