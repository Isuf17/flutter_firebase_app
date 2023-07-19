import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/auth_controller.dart';
import 'package:flutter_firebase_app/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // single child scroll view works
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                height: h * 0.3,
                width: w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/signup.png'),
                        fit: BoxFit.fill)),
                child: const Column(
                  children: <Widget>[
                    Flexible(
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 60,
                        backgroundImage: AssetImage('assets/profile.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: h * 0.02),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(0.5))
                        ]),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
              },
              child: Container(
                width: w * 0.5,
                height: h * 0.04,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: const DecorationImage(
                      image: AssetImage('assets/loginbtn.png'),
                      fit: BoxFit.cover),
                ),
                child: const Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: h*0.09),
            ElevatedButton.icon(
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: Size(double.infinity, h * 0.05),
              ),
              icon: const FaIcon(FontAwesomeIcons.google, color: Colors.black),
              label: const Text('Sign up with Google'),
            ),
            SizedBox(height: 0.09*h),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account? Click Here",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold))),
          ],
        ),
      ),
    );
  }
}
