import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/auth_controller.dart';
import 'notification_api.dart';

class WelcomePage extends StatelessWidget {
  final String? email;
  const WelcomePage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      // single child scroll view works
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: h * 0.3,
            width: w,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/signup.png'), fit: BoxFit.cover)),
            child: Column(
              children: <Widget>[
                SizedBox(height: h * 0.16),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
              ],
            ),
          ),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Welcome",
                    style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54)),
                Text(email!,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500])),
              ],
            ),
          ),
          Container(
            height: h*0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Simple Notification'
                    )
                ),
                ElevatedButton(
                    onPressed: () {
                      NotificationApi.showNotification(
                        id: 0,
                        title: 'Affirmation',
                        body: 'Have a great day!',
                      );
                    },
                    child: Text(
                      'Scheduled Notification'
                    )
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Remove Notifications')
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              AuthController.instance.logOut();
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
                  "Sign Out",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
