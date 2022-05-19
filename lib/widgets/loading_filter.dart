import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class LoadingFilter extends StatelessWidget {
  const LoadingFilter({Key? key, required this.task}) : super(key: key);
  final UploadTask? task;
  @override
  Widget build(BuildContext context) {
    // final len = MediaQuery.of(context).size.width * 0.9;
    const len = double.maxFinite;
    return Center(
      child: StreamBuilder(
        stream: task != null ? task!.snapshotEvents : null,
        builder: (context, AsyncSnapshot<TaskSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: len,
              width: len,
              color: Colors.black26,
              child: const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
          if (snapshot.data == null) {
            return Container(
              height: len,
              width: len,
              color: Colors.black26,
              child: const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }
          final progress =
              snapshot.data!.bytesTransferred / snapshot.data!.totalBytes;
          if (progress == 1) {
            return const SizedBox();
          }
          return Container(
            height: len,
            width: len,
            color: Colors.black26,
            child: Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 6,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
