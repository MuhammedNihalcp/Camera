import 'package:cemara/model/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

ValueNotifier<List<ImageModel>> imageList = ValueNotifier([]);

void addImage(ImageModel value) async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.initFlutter(dir.path);
  final imageDB = await Hive.openBox<ImageModel>('image_db');
  await imageDB.add(value);
  print(value);
  imageList.value.add(value);
  imageList.notifyListeners();
}

void getImage() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.initFlutter(dir.path);
  final imageDB = await Hive.openBox<ImageModel>('image_db');
  imageList.value.clear();
  imageList.value.addAll(imageDB.values);
  imageList.notifyListeners();
}

void deleteImage(int index) async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.initFlutter(dir.path);
  final imageDB = await Hive.openBox<ImageModel>('image_db');
  await imageDB.deleteAt(index);
  print(index);
  imageList.value.clear();
  imageList.value.addAll(imageDB.values);
  imageList.notifyListeners();
}
