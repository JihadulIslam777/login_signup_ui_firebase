import 'package:flutter/material.dart';
import 'package:login_signup_ui_firebase/authentication/authentication_provider.dart';
import 'package:login_signup_ui_firebase/pages/sign_in_page.dart';
import 'package:login_signup_ui_firebase/widgets/custom_button.dart';
import 'package:login_signup_ui_firebase/widgets/custom_field.dart';
import 'package:login_signup_ui_firebase/widgets/glassmorphism.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final _form = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/raindrop.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Sign Up !',
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Form(
                    key: _form,
                    child: GlassMorphism(
                      start: 0.1,
                      end: 0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Looks like you don\'t have an account?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff9f9f9)),
                            ),
                            const Text(
                              'Let\'s create an account...',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfff9f9f9)),
                            ),
                            SizedBox(height: height * 0.01),
                            CustomField(
                              controller: _nameController,
                              labelText: 'User name',
                            ),
                            SizedBox(height: height * 0.01),
                            CustomField(
                              controller: _emailController,
                              labelText: 'Email',
                              textInputType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: height * 0.01),
                            CustomField(
                              controller: _passwordController,
                              labelText: 'password',
                            ),
                            SizedBox(height: height * 0.015),
                            CustomButton(
                              text: 'Continue',
                              color: Colors.teal,
                              textColor: Colors.black87,
                              onPressed: () {
                                AuthenticationProvider.signUp(
                                  _nameController.text.trim(),
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                );
                              },
                            ),
                            SizedBox(height: height * 0.015),
                            Row(
                              children: [
                                const Text(
                                  'Do you have an account?',
                                  style: TextStyle(color: Color(0xfff9f9f9)),
                                ),
                                TextButton(
                                  child: const Text('Sign In'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => SignIn()));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
