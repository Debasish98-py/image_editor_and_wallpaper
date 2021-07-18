import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:screenshot/screenshot.dart';
import 'package:wallpaper_app/app/modules/shared/shared_controller/shared_controller.dart';

class ImageEditor extends StatelessWidget {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("Edit Image"),
        actions: [
          IconButton(
            icon: Icon(Icons.blur_on),
            onPressed: () {
              Get.bottomSheet(
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(

                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<SharedController>(
          init: SharedController(),
          builder: (_editor) {
            return Container(
              child: Screenshot(
                controller: screenshotController,
                child: RotatedBox(
                  quarterTurns: _editor.rotateValue,
                  child: imageFilterLatest(
                    hue: _editor.hueValue,
                    saturation: _editor.saturationValue,
                    brightness: _editor.brightnessValue,
                    child: Transform(
                      transform: Matrix4.rotationY(_editor.flipValue),
                      child: ClipRRect(
                        child: Container(
                          height: _editor.imgHeight.toDouble(),
                          width: _editor.imgWidth.toDouble(),
                          child: Image.file(_editor.image),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
