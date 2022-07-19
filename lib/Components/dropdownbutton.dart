import 'package:flutter/material.dart';
import 'package:hadyatuk/State_Mangenment/provider.dart';

List<String> maleorfemale = ['ذكر', 'أنثى'];
List<String> listitems = [
  "أب / أم",
  "صديق / صديقة",
  "زوج / زوجة",
  "حبيب / حبيبة",
];

DropdownButton<String> Dropdown(StateOfApp valueP) {
  return DropdownButton(
    value: valueP.selectgender,
    onChanged: (value) {
      valueP.onChangedgender(value.toString());
    },
    items: maleorfemale.map((itemone) {
      return DropdownMenuItem(value: itemone, child: Text(itemone));
    }).toList(),
  );
}

DropdownButton<String> DropDown(StateOfApp valueP) {
  return DropdownButton(
    value: valueP.selectforyou,
    onChanged: (value) {
      valueP.onChangedYou(value.toString());
    },
    items: listitems.map((itemone) {
      return DropdownMenuItem(
        value: itemone,
        child: Text(itemone),
      );
    }).toList(),
  );
}
