import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_pro/image_editor_pro.dart';

class PhotoEditController extends GetxController {
  File _image;
  bool isSaved;
  Future editImage() {
    return Get.to(() => ImageEditorPro(
          appBarColor: Colors.red,
          bottomBarColor: Colors.red,
          pathSave: Directory("Image Editor"),
        )).then((getEditImage) {
      if (getEditImage != null) {
        _image = getEditImage;
        update();
      }
    });
  }
}
