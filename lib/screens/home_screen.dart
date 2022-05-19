import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:test_app/screens/pipe_detector_screen.dart';
import 'package:test_app/widgets/image_type_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String option = "Pipe Counter";
  var items = ['Pipe Counter', "Other Option"];

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Future<void> pickFromGallery() async {
      try {
        final XFile? result =
            await _picker.pickImage(source: ImageSource.gallery);
        if (result == null) {
          return;
        }
        // ignore: use_build_context_synchronously
        pushNewScreen(
          context,
          screen: PipeDetectorScreen(
            image: result,
          ),
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } catch (e) {
        log(e.toString());
      }
    }

    Future<void> pickFromCamera() async {
      try {
        final XFile? result =
            await _picker.pickImage(source: ImageSource.camera);
        if (result == null) {
          return;
        }
        // ignore: use_build_context_synchronously
        pushNewScreen(
          context,
          screen: PipeDetectorScreen(
            image: result,
          ),
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      } catch (e) {
        log(e.toString());
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 20.0,
                left: 15,
                right: 15,
                bottom: 10,
              ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 250,
              width: double.maxFinite,
              child: Image.asset(
                "assets/guide-tubes-04-mobile-en.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Material(
                color: Colors.white,
                elevation: 3,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: DropdownButton(
                      isExpanded: true,
                      // isDense: true,
                      iconSize: 30,
                      iconDisabledColor: Colors.grey,
                      iconEnabledColor: Colors.grey,
                      elevation: 4,
                      style: const TextStyle(color: Colors.grey),
                      value: option,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            textScaleFactor: 1.5,
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          option = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // buttons to select image
            Expanded(
              child: Center(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Select an image to Count",
                      textScaleFactor: 1.5,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ImageTypeItem(
                          text: "Use Existing\nImage",
                          icon: const ImageIcon(
                            AssetImage("assets/gallery_icon.png"),
                            color: Colors.white,
                            size: 40,
                          ),
                          fn: pickFromGallery,
                        ),
                        ImageTypeItem(
                          text: "Take a new\nImage",
                          icon: const ImageIcon(
                            AssetImage("assets/camera_icon.png"),
                            color: Colors.white,
                            size: 40,
                          ),
                          fn: pickFromCamera,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
