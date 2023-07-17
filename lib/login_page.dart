import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/auth_controller.dart';
import 'package:flutter_firebase_app/signup_page.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // single child scroll view works
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: h * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/loginimg.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Container(
              width: w,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Hello",
                    style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign into your account",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
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
                  const SizedBox(height: 20),
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
                      controller: passwordController,
                      obscureText: true,
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
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Text(
                        "Forgot your password?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[500],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 0.03 * h),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  AuthController.instance.login(emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: Container(
                  width: w * 0.5,
                  height: h * 0.09,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage('assets/loginbtn.png'),
                        fit: BoxFit.cover),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                    children: [
                  TextSpan(
                      text: " Create",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const SignUpPage()))
                ])),
          ],
        ),
      ),
    );
  }
}
