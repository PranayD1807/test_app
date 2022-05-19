import 'package:flutter/material.dart';
import 'package:test_app/screens/wrapper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        const Duration(seconds: 2),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(
            body: Center(
              child: Image.asset("assets/symbol.png"),
            ),
          );
        }
        return const Wrapper();
      },
    );
  }
}
