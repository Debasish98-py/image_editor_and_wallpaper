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

  double opacityValue = 0;
  double flipValue = 0;
  int rotateValue = 0;

  Rx<double> _blur = Rx<double>(0.0);
  double get blur => _blur.value;
  Rx<double> _hue = Rx<double>(0.0);
  double get hueValue => _hue.value;
  Rx<double> _brightness = Rx<double>(0.0);
  double get brightnessValue => _brightness.value;
  Rx<double> _saturation = Rx<double>(0.0);
  double get saturationValue => _saturation.value;

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
    }else{
      Get.snackbar("Error", "No image selected");
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

  Future imgBlur() {
    return Get.bottomSheet(
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(14),
        child: Center(
          child: Column(
            children: [
              Text(
                "Set image blur",
                style: TextStyle(color: Colors.white),
              ),
              Divider(),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Slider(
                    activeColor: Colors.blue,
                    inactiveColor: Colors.red,
                    value: blur,
                    min: 0,
                    max: 10,
                    onChanged: (v) {
                      setState(() {
                        _blur.value = v;
                      });
                      print(blur);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future imgAdjustment(){
    return Get.bottomSheet(
      Container(
        color: Colors.grey,
        padding: EdgeInsets.all(14),
        child: Center(
          child: Column(
            children: [
              Text(
                "Set image filters",
                style: TextStyle(color: Colors.white),
              ),
              Divider(),
              Text("Adjust brightness"),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    value: brightnessValue,
                    min: 0,
                    max: 1,
                    onChanged: (v) {
                      setState(() {
                        _brightness.value = v;
                      });
                      print(brightnessValue);
                    },
                  );
                },
              ),
              Text("Adjust saturation"),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    value: saturationValue,
                    min: -10,
                    max: 10,
                    onChanged: (v) {
                      setState(() {
                        _saturation.value = v;
                      });
                      print(saturationValue);
                    },
                  );
                },
              ),
              Text("Adjust hue"),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return Slider(
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    value: hueValue,
                    min: -10,
                    max: 10,
                    onChanged: (v) {
                      setState(() {
                        _hue.value = v;
                      });
                      print(hueValue);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
