import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const name = "Sami";
  static const occupation = "Flutter Developer";
  static const phoneNumber = "+966 58 340 3210";
  static const email = "sami.abosharkh@hotmail.com";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/profile.png'),
            ),
            Text(name, style: TextStyle(fontSize: 40, color: Colors.white)),
            Text(occupation, style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 150,
              child: Divider(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 25,
                  color: Colors.teal,
                ),
                title: Text(
                  phoneNumber,
                  style: TextStyle(color: Colors.teal),
                ),
                tileColor: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 25,
                  color: Colors.teal,
                ),
                title: Text(
                  email,
                  style: TextStyle(color: Colors.teal),
                ),
                tileColor: Colors.white,
              ),
            )
          ],
        ));
  }
}
