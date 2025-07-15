import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:life_quest/pages/SingInPage.dart';
import 'package:life_quest/pages/SingUpPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Init Demo',
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Если инициализация завершилась с ошибкой
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Ошибка инициализации Firebase')),
            );
          }

          // Если инициализация завершилась успешно
          if (snapshot.connectionState == ConnectionState.done) {
            return MyHomePage();
          }

          // Пока инициализация в процессе — показываем индикатор загрузки
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;

  void signUp() async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: "diwax@gmail.com", password: "123123");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpPage(),
    );
  }
}
