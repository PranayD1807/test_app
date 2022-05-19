import 'package:flutter/material.dart';

class ImageTypeItem extends StatelessWidget {
  const ImageTypeItem(
      {Key? key, required this.text, required this.icon, required this.fn})
      : super(key: key);
  final String text;
  final Widget icon;
  final Future<void> Function() fn;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        InkWell(
          onTap: () {
            fn();
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(250, 38, 9, 1),
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: icon,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          textScaleFactor: 1,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
