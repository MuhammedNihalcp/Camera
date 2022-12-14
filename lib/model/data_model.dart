import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class ImageModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String img;

  ImageModel({required this.img, this.id});
}
