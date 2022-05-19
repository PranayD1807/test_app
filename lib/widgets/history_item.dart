import 'package:flutter/material.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        elevation: 4,
        child: Container(
          height: 150,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: double.maxFinite,
                child: Image.asset(
                  'assets/minimalist-construction-pvc-pipes-composition.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Pipe Count",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "32",
                    textScaleFactor: 1.7,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "11-05-2022",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "14.50",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage("assets/share.png"),
                      color: Color.fromRGBO(250, 38, 9, 1),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const ImageIcon(
                      AssetImage("assets/trash-can.png"),
                      color: Color.fromRGBO(250, 38, 9, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
