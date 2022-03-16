import 'package:flutter/material.dart';
import 'package:login_signup_ui_firebase/authentication/authentication_provider.dart';
import 'package:login_signup_ui_firebase/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("WELCOME HOME", style: TextStyle(fontSize: 30)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            CustomButton(
              onPressed: () {
                AuthenticationProvider.signOut();
              },
              text: 'Sign out!',
            ),
          ],
        ),
      ),
    );
  }
}
