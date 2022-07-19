import 'package:flutter/material.dart';
import 'package:hadyatuk/Components/custombutton.dart';
import 'package:hadyatuk/Constant/const.dart';
import 'package:hadyatuk/Screens/home_page.dart';
import 'package:hadyatuk/Screens/signup.dart';

import '../Components/TextFromField.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _numberphone = TextEditingController();
    TextEditingController _password = TextEditingController();

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
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'تسجيل الدخول',
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
                Custom_Button(
                    text: 'تسجيل الدخول',
                    onpress: () {
                      if (stateform.currentState!.validate()) {
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home_Page(),
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
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: const Text(
                          'هل تريد أنشاء حساب جديد؟ ',
                          style: TextStyle(fontSize: 16, color: colorline),
                        ),
                      ),
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
