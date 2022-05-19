import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/wrapper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, this.backFn, required this.logout})
      : super(key: key);
  final Function? backFn;
  final Function logout;
  @override
  Widget build(BuildContext context) {
    logOut() async {
      try {
        await FirebaseAuth.instance.signOut();
        logout();
      } catch (e) {
        log(e.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
              child: Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      backFn!();
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromRGBO(250, 38, 9, 1),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Profile",
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(250, 38, 9, 1),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 130,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 38, 9, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: double.maxFinite,
                    child: Image.asset(
                      "assets/prof.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Text(
                            "Fname Lname",
                            textScaleFactor: 1.4,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "email@email.com",
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "+91 98435 35345",
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      )), // Profile Options
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    onTap: () {},
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    minLeadingWidth: 15,
                    leading: const ImageIcon(
                      AssetImage("assets/identification.png"),
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Change Face",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    visualDensity: VisualDensity.compact,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    minLeadingWidth: 15,
                    leading: const ImageIcon(
                      AssetImage("assets/trash-can.png"),
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Clear History",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    visualDensity: VisualDensity.compact,
                    leading: const ImageIcon(
                      AssetImage("assets/password.png"),
                      color: Colors.black,
                    ),
                    minLeadingWidth: 15,
                    title: const Text(
                      "Change Password",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    visualDensity: VisualDensity.compact,
                    minLeadingWidth: 15,
                    leading: const ImageIcon(
                      AssetImage("assets/email.png"),
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Contact Us",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    minLeadingWidth: 15,
                    leading: const ImageIcon(
                      AssetImage("assets/wikis.png"),
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Visit our Website",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      logOut();
                      log("logged out");
                    },
                    minLeadingWidth: 15,
                    leading: const ImageIcon(
                      AssetImage("assets/logout.png"),
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Logout",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
