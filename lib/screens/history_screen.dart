import 'package:flutter/material.dart';
import 'package:test_app/widgets/history_item.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, this.backFn}) : super(key: key);
  final Function? backFn;
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      widget.backFn!();
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
                    "History",
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
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const HistoryItem(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
