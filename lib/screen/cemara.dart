import 'dart:convert';
import 'dart:io';

import 'package:cemara/function/db_function.dart';
import 'package:cemara/model/data_model.dart';
import 'package:cemara/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ScreenCamera extends StatefulWidget {
  const ScreenCamera({super.key});

  @override
  State<ScreenCamera> createState() => _ScreenCameraState();
}

class _ScreenCameraState extends State<ScreenCamera> {
  String _image = '';

  final imagePicker = ImagePicker();
  void getFromCamera() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      // maxHeight: 1080,
      // maxWidth: 1080,
    );
    if (image == null) {
      return;
    } else {
      final imageTemp = File(image.path).readAsBytesSync();

      setState(() {
        _image = base64Encode(imageTemp);
      });
      final imageMod = ImageModel(img: _image);
      addImage(imageMod);
    }
  }

  @override
  Widget build(BuildContext context) {
    getImage();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        automaticallyImplyLeading: false,
      ),
      body: const ScreenHome(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => getFromCamera(),
        backgroundColor: Colors.blue,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
