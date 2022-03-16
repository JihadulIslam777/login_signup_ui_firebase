import 'package:flutter/material.dart';
import 'package:login_signup_ui_firebase/authentication/authentication_provider.dart';
import 'package:login_signup_ui_firebase/pages/sign_up_page.dart';
import 'package:login_signup_ui_firebase/presentation/custom%20icon/flutter_icons.dart';
import 'package:login_signup_ui_firebase/widgets/custom_button.dart';
import 'package:login_signup_ui_firebase/widgets/custom_field.dart';
import 'package:login_signup_ui_firebase/widgets/glassmorphism.dart';
import 'package:login_signup_ui_firebase/widgets/social_signin_button.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hi !',
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
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomField(
                                controller: emailController,
                                labelText: 'Email',
                                textInputType: TextInputType.emailAddress),
                            SizedBox(height: height * 0.015),
                            CustomField(
                                controller: passwordController,
                                labelText: 'Password'),
                            SizedBox(height: height * 0.015),
                            CustomButton(
                              text: 'Continue',
                              color: Colors.teal,
                              textColor: Colors.black87,
                              onPressed: () {
                                AuthenticationProvider.logIn(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                              },
                            ),
                            SizedBox(height: height * 0.015),
                            const Text(
                              'or',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: height * 0.015),
                            SocialSignInButton(
                              assetName: MyFlutterApp.google,
                              iconColor: const Color(0xff009A17),
                              color: const Color(0xfff9f9f9),
                              textColor: Colors.black87,
                              text: 'Continue with google',
                              onPressed: () {},
                            ),
                            SizedBox(height: height * 0.015),
                            SocialSignInButton(
                              assetName: MyFlutterApp.facebookOfficial,
                              color: const Color(0xFF334D92),
                              textColor: Colors.black87,
                              text: 'Continue with facebook',
                              onPressed: () {},
                            ),
                            SizedBox(height: height * 0.015),
                            SocialSignInButton(
                              assetName: MyFlutterApp.apple,
                              iconColor: Colors.black87,
                              color: Colors.lightBlue,
                              textColor: Colors.black87,
                              text: 'Continue with Apple',
                              onPressed: () {},
                            ),
                            SizedBox(height: height * 0.015),
                            Row(
                              children: [
                                const Text(
                                  'Don\'t have an account?',
                                  style: TextStyle(color: Color(0xfff9f9f9)),
                                ),
                                TextButton(
                                  child: const Text('Sign up'),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => SignUp()));
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.015),
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                child: const Text(
                                  'Forgot your password?',
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
