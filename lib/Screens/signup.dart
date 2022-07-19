import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hadyatuk/Screens/login.dart';

import '../Components/TextFromField.dart';
import '../Components/custombutton.dart';
import '../Constant/const.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  TextEditingController _numberphone = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _verifypassword = TextEditingController();
  // Future signup() async {
  //   return await FirebaseAuth.instance.signInWithPhoneNumber(
  //     _numberphone.text.trim(),

  //   );
  // }

  GlobalKey<FormState> stateform = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'تسجيل حساب',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFromFeiled(
                  hinttext: 'رقم الهاتف',
                  controller: _numberphone,
                  obscureText: false,
                  keyborad: TextInputType.number,
                  validatorf: (Text) {
                    if (Text.isEmpty) {
                      return 'لا يمكن أن يكون حقل الرقم فارغ ';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFromFeiled(
                  hinttext: 'كلمة السر',
                  controller: _password,
                  obscureText: true,
                  keyborad: TextInputType.visiblePassword,
                  validatorf: (Text) {
                    if (Text.isEmpty) {
                      return 'لا يمكن أن يكون  حقل كلمة السر فارغا ';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFromFeiled(
                  hinttext: 'تاكيد كلمة السر ',
                  obscureText: true,
                  controller: _verifypassword,
                  keyborad: TextInputType.visiblePassword,
                  validatorf: (Text) {
                    if (Text.isEmpty) {
                      return 'لا يمكن أن يكون  حقل كلمة السر فارغا ';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Custom_Button(
                    text: 'أنشاء الحساب',
                    onpress: () {
                      // signup();
                      if (stateform.currentState!.validate()) {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      }
                      ;
                    }),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ),
                            );
                          },
                          child: const Text(
                            'هل تمتلك حساب؟ ',
                            style: TextStyle(fontSize: 16, color: colorline),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
