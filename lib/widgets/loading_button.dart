import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key, this.task}) : super(key: key);
  final UploadTask? task;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: task != null ? task!.snapshotEvents : null,
      builder: (context, AsyncSnapshot<TaskSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(229, 229, 229, 1),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text(
              "Image sent to server",
              textScaleFactor: 1.2,
            ),
          );
        }
        if (snapshot.data == null) {
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromRGBO(229, 229, 229, 1),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: const Text(
              "Image sent to server",
              textScaleFactor: 1.2,
            ),
          );
        }
        final progress =
            snapshot.data!.bytesTransferred / snapshot.data!.totalBytes;
        if (progress == 1) {
          return const AnimatedBtn();
        }
        return Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(229, 229, 229, 1),
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: const Text(
            "Image Processing",
            textScaleFactor: 1.2,
          ),
        );
      },
    );
  }
}

class AnimatedBtn extends StatefulWidget {
  const AnimatedBtn({Key? key}) : super(key: key);

  @override
  State<AnimatedBtn> createState() => _AnimatedBtnState();
}

class _AnimatedBtnState extends State<AnimatedBtn> {
  double _fontSize = 20;
  double _width = 0.01;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _fontSize = 35;
      });
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _width = 70;
      });
    });
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 38, 9, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          width: MediaQuery.of(context).size.width * 0.45,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          child: AnimatedDefaultTextStyle(
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: _fontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            duration: const Duration(milliseconds: 400),
            child: const Text(
              "32",
            ),
          ),
        ),
        const SizedBox(width: 10),
        AnimatedContainer(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 38, 9, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          width: _width,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          duration: const Duration(milliseconds: 250),
          child: InkWell(
            onTap: () {},
            child: const ImageIcon(
              AssetImage("assets/share.png"),
              color: Colors.white,
              size: 50,
            ),
          ),
        )
      ],
    );
  }
}
