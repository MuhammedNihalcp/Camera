import 'dart:convert';

import 'package:cemara/function/db_function.dart';
import 'package:cemara/model/data_model.dart';
import 'package:cemara/screen/cemara.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FullScreen extends StatelessWidget {
  ImageModel path;
  int index;

  FullScreen({Key? key, required this.path, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo'),
        actions: [
          IconButton(
            onPressed: () {
              showAlert(context);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Image(
        image: MemoryImage(
          const Base64Decoder().convert(path.img),
        ),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(
      //     children: [
      //       FloatingActionButton(
      //         onPressed: () {
      //           Navigator.pushReplacement(context,
      //               MaterialPageRoute(builder: (ctx) => const ScreenCamera()));
      //         },
      //         child: const Icon(Icons.backup),
      //       ),
      //       FloatingActionButton(
      //         onPressed: () {
      //           showAlert(context);
      //         },
      //         child: const Icon(Icons.delete),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  showAlert(BuildContext context) {
    Widget deleteButton = TextButton(
      onPressed: () {
        deleteImage(index);
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const ScreenCamera()));
      },
      child: const Text('Delete'),
    );
    Widget cencalButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cencal'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Notice'),
      content: const Text('Delete your photo'),
      actions: [cencalButton, deleteButton],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
