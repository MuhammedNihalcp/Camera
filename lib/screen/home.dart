import 'dart:convert';


import 'package:cemara/function/db_function.dart';
import 'package:cemara/model/data_model.dart';
import 'package:cemara/screen/full_screen.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: imageList,
      builder: (BuildContext ctx, List<ImageModel> listImage, Widget? child) {
        return GridView.builder(
            itemCount: listImage.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (BuildContext ctx, index) {
              final data = listImage[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => FullScreen(
                                path: data,
                                index: index,
                              )));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Image(
                    image: MemoryImage(
                      const Base64Decoder().convert(data.img),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            });
      },
    );
  }
}
