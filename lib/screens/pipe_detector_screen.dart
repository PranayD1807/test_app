import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/widgets/loading_button.dart';
import 'package:test_app/widgets/loading_filter.dart';

class PipeDetectorScreen extends StatelessWidget {
  const PipeDetectorScreen({
    Key? key,
    this.image,
  }) : super(key: key);

  final XFile? image;

  @override
  Widget build(BuildContext context) {
    // Uploading image to firebase
    Future<UploadTask?> uploadFile(XFile file) async {
      try {
        UploadTask uploadTask;
        // Create a Reference to the file
        Reference ref =
            FirebaseStorage.instance.ref().child('pipe-img').child(file.name);
        uploadTask = ref.putFile(File(file.path));

        return Future.value(uploadTask);
      } catch (e) {
        log(e.toString());
      }
      return null;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: uploadFile(image!),
        builder: (context, AsyncSnapshot<UploadTask?> snapshot) {
          return SafeArea(
            child: Column(
              children: <Widget>[
                // Custom Title Appbar
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15),
                  child: Row(
                    children: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
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
                        "Pipe Detector",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(250, 38, 9, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.9,
                  width: MediaQuery.of(context).size.width * 0.9,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.9,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      // show loading filter
                      LoadingFilter(task: snapshot.data),
                    ],
                  ),
                ),

                Expanded(
                  child: Center(
                    child: LoadingButton(task: snapshot.data),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
