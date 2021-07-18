import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http/utils/body_decoder.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:image_picker/image_picker.dart';

class SharedController extends GetxController {
  File image;
  var imgHeight;
  var imgWidth;

  double flipValue = 0;
  int rotateValue = 0;
  double blurValue = 0;
  double opacityValue = 0;
  double hueValue = 0;
  double brightnessValue = 0;
  double saturationValue = 0;

  Future editImage() {
    return Get.to(() => ImageEditorPro(
          appBarColor: Colors.red,
          bottomBarColor: Colors.red,
          pathSave: Directory("Image Editor"),
        )).then(
      (getEditImage) {
        if (getEditImage != null) {
          image = getEditImage;
          update();
        }
      },
    );
  }

  Future getImageFromGallery() async {
    var galImg = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 100);
    var decodedGalImg =
        await decodeImageFromList(File(galImg.path).readAsBytesSync());
    if (galImg != null) {
      image = File(galImg.path);
      imgHeight = decodedGalImg.height;
      imgWidth = decodedGalImg.width;
    }
  }

  Future getImageFromCamera() async {
    var camImg = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 100);
    var decodedCamImg =
        await decodeImageFromList(File(camImg.path).readAsBytesSync());
    if (camImg != null) {
      image = File(camImg.path);
      imgHeight = decodedCamImg.height;
      imgWidth = decodedCamImg.width;
    }
  }


}
