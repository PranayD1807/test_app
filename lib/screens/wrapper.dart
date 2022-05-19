import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/auth_screen.dart';
import 'package:test_app/screens/tabs_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      // check whether user is logged in or out and listen to changes
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Image.asset('assets/symbol.png'),
            ),
          );
        }

        if (snapshot.data == null) {
          log("User not logged in.");
          return const AuthScreen(); // signin screen
        } else {
          log("User is logged in.");
          return TabScreen(); // store tabs
        }
      },
    );
  }
}
