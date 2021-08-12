import 'package:flutter/material.dart';
import 'package:waste/models/image.dart';

class ImageNotifier extends ChangeNotifier {
  late Img _image;

  get img => _image;

  saveImg(image) {
    _image = image;
    notifyListeners();
  }
}