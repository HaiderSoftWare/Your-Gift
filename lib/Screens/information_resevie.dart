import 'package:flutter/material.dart';
import 'package:hadyatuk/Components/custombutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../Components/TextFromField.dart';
import '../Components/dropdownbutton.dart';
import '../Constant/const.dart';
import '../State_Mangenment/provider.dart';

class Information_Resevie extends StatefulWidget {
  const Information_Resevie({Key? key}) : super(key: key);

  @override
  State<Information_Resevie> createState() => _Information_ResevieState();
}

class _Information_ResevieState extends State<Information_Resevie> {
  CollectionReference reseive =
      FirebaseFirestore.instance.collection('reseive');

  String selectval = "صديق / صديقة";
  String selectval2 = "ذكر";

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _numberphone = TextEditingController();
    TextEditingController _location = TextEditingController();
    GlobalKey<FormState> _formState = GlobalKey();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 10),
        child: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
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
                        'معلومات مستلم الهدية',
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
                  controller: _name,
                  obscureText: false,
                  validatorf: (Text) {
                    if (Text!.isEmpty) {
                      return 'لا يمكن أن يكون  حقل الأسم فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFromFeiled(
                  hinttext: 'رقم الهاتف',
                  controller: _numberphone,
                  keyborad: TextInputType.number,
                  obscureText: false,
                  validatorf: (Text) {
                    if (Text!.isEmpty) {
                      return 'لا يمكن أن يكون  حقل الرقم فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFromFeiled(
                  hinttext: ' رابط الموقع',
                  keyborad: TextInputType.name,
                  obscureText: false,
                  controller: _location,
                  validatorf: (Text) {
                    if (Text!.isEmpty) {
                      return 'لا يمكن أن يكون  حقل الموقع فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        ': الجنس',
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ChangeNotifierProvider(
                          create: (context) {
                            return StateOfApp();
                          },
                          child: Consumer<StateOfApp>(
                            builder: (context, valueP, child) {
                              return Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Dropdown(valueP),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        ': مقربة الشخص',
                        style: TextStyle(fontSize: 16),
                      ),
                      Divider(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ChangeNotifierProvider(
                    create: (context) => StateOfApp(),
                    child: Consumer<StateOfApp>(
                      builder: (context, valueP, child) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              DropDown(valueP),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Custom_Button(
                    text: 'تسليم المعلومات',
                    onpress: () async {
                      if (_formState.currentState!.validate()) {
                        await reseive.add({
                          'name': _name.text,
                          'numberphone': _numberphone.text,
                          'location': _location.text,
                          'type': selectval2,
                          'type for you': selectval
                        }).then((value) => print('user added'));
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                "معلومات مستلم الهدية",
                                textAlign: TextAlign.end,
                              ),
                              content: const Text(
                                "تم أرسال البيانات بنجاح الرجاء أختيار طريقة دفع",
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
                    }),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: const Text(
                                  'كاش',
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                title: const Text(
                                  'زين كاش',
                                  textAlign: TextAlign.center,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 20, left: 10, right: 10),
                                child: Custom_Button(
                                  text: 'تأكيد',
                                  onpress: () {},
                                ),
                              ),
                            ],
                          );
                        });
                  },
                  child: const Text(
                    'طريقة الدفع',
                    style: TextStyle(
                      fontSize: 16,
                      color: colorline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
