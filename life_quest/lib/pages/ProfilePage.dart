import 'package:flutter/material.dart';
import 'package:life_quest/Service/Auth_Service.dart';
import 'package:life_quest/pages/SingUpPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

AuthClass authClass = AuthClass();

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () async {
                await authClass.logout(context);

                if (context.mounted) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const SignUpPage()),
                      (route) => false);
                }
              }),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
              color: Colors.white,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 32,
              color: Colors.white,
            ),
            label: "",
          ),
        ],
      ),
      //body: ,
    );
  }
}
