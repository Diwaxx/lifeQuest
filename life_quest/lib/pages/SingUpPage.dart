import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:life_quest/pages/HomePage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Регистрация",
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 20,
            ),
            buttonItem("assets/google.svg", "Войти через гугл", 25),
            SizedBox(
              height: 15,
            ),
            buttonItem("assets/phone.svg", "Войти через телефон", 25),
            SizedBox(
              height: 15,
            ),
            textItem("Почта ", _emailController, false),
            SizedBox(
              height: 15,
            ),
            textItem("Пароль ", _passwordController, true),
            SizedBox(
              height: 30,
            ),
            colorButton(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Уже зарегестрированны? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    )),
                Text("Войти",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ],
            )
          ],
        ),
      )),
    );
  }

  Widget colorButton() {
    return InkWell(
      onTap: () async {
        setState(() {});
        try {
          firebase_auth.UserCredential userCredential =
              await firebaseAuth.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (builder) => HomePage()),
              (route) => false);
        } catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      },
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width - 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                Color(0xfffd746c),
                Color(0xffff9068),
                Color(0xfffd746c)
              ])),
          child: Center(
            child: Text(
              "Зарегестрироваться",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

  Widget buttonItem(String image, String btnname, double size) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 90,
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(width: 1, color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: size,
              width: size,
            ),
            SizedBox(
              width: 15,
            ),
            Text(btnname,
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget textItem(String text, TextEditingController controller, bool hide) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width - 90,
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        obscureText: hide,
        controller: controller,
        decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
