import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/screens/tabs_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Future<void> submitForm() async {
      bool isValid = _formkey.currentState!.validate();
      if (!isValid) {
        return;
      }
      setState(() {
        isLoading = true;
      });
      try {
        final authCreds =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _name.text.trim(),
          password: _password.text.trim(),
        );
        await FirebaseAuth.instance.signInWithCredential(authCreds.credential!);
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TabScreen(),
          ),
        );
      } catch (e) {
        log(e.toString());
        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _name.text.trim(),
            password: _password.text.trim(),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TabScreen(),
            ),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Something went wrong.")),
          );
        }
      }
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Center(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Material(
                              elevation: 4,
                              child: TextFormField(
                                obscureText: false,
                                controller: _name,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  hintText: "Username / Email",
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    20.0,
                                    15.0,
                                    20.0,
                                    15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Material(
                              elevation: 4,
                              child: TextFormField(
                                controller: _password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                    20.0,
                                    15.0,
                                    20.0,
                                    15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 4,
                                  minimumSize: const Size(
                                      double.maxFinite, double.minPositive),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  primary: const Color.fromRGBO(250, 38, 9, 1),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20)),
                              onPressed: () {
                                submitForm();
                              },
                              child: isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text(
                                      'Submit',
                                      textScaleFactor: 1.2,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
