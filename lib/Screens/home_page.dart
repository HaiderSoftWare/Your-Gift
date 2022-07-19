import 'package:flutter/material.dart';
import 'package:hadyatuk/Components/custombutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hadyatuk/Constant/const.dart';

import '../Components/TextFromField.dart';
import 'information_resevie.dart';

class Home_Page extends StatelessWidget {
  Home_Page({Key? key}) : super(key: key);
  CollectionReference send = FirebaseFirestore.instance.collection('send');

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _numberphone = TextEditingController();
    TextEditingController _location = TextEditingController();
    TextEditingController _price = TextEditingController();
    GlobalKey<FormState> stateform = GlobalKey();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90, bottom: 10),
        child: SingleChildScrollView(
          child: Form(
            key: stateform,
            child: Column(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.asset("images/gift.png"),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'معلومات مرسل الهدية',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFromFeiled(
                  hinttext: 'الأسم',
                  keyborad: TextInputType.name,
                  obscureText: false,
                  controller: _name,
                  validatorf: (Text) {
                    if (Text.isEmpty) {
                      return 'لا يمكن أن يكون حقل الأسم فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFromFeiled(
                  hinttext: 'رقم الهاتف',
                  controller: _numberphone,
                  obscureText: false,
                  keyborad: TextInputType.number,
                  validatorf: (Text) {
                    if (Text.isEmpty) {
                      return 'لا يمكن أن يكون حقل رقم فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFromFeiled(
                  hinttext: 'رابط موقعك',
                  keyborad: TextInputType.name,
                  obscureText: false,
                  controller: _location,
                  validatorf: (Text) {
                    if (Text.isEmpty) {
                      return 'لا يمكن أن يكون  حقل الموقع فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFromFeiled(
                  hinttext: 'الحد الاعلى لسعر الهدية : مثلأ 20 ألف',
                  keyborad: TextInputType.name,
                  controller: _price,
                  obscureText: false,
                  validatorf: (Text) {
                    if (Text!.isEmpty) {
                      return 'لا يمكن أن يكون  حقل السعر فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Custom_Button(
                  text: 'تسليم المعلومات',
                  onpress: () {
                    if (stateform.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              "معلومات مرسل الهدية",
                              textAlign: TextAlign.end,
                            ),
                            content: const Text(
                              "تم أرسال المعلومات بنجاح الرجاء أرسال معلومات مستلم الهدية",
                              textAlign: TextAlign.end,
                            ),
                            actions: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("تم"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    ;
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Information_Resevie(),
                    ),
                  ),
                  child: const Text(
                    'معلومات مستلم الهدية',
                    style: TextStyle(fontSize: 15, color: colorline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
