import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:screenshot/screenshot.dart';
import 'package:wallpaper_app/app/modules/shared/shared_controller/shared_controller.dart';

class ImageEditor extends StatelessWidget {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    var height = Get.context.height;
    var width = Get.context.width;
    return GetBuilder<SharedController>(
      init: SharedController(),
      builder: (_editor) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red,
            title: Text("Edit Image"),
            actions: [
              IconButton(
                icon: Icon(Icons.blur_on),
                onPressed: () {
                  _editor.imgBlur();
                },
              ),
              IconButton(
                icon: Icon(Icons.filter),
                onPressed: () {
                  _editor.imgAdjustment();
                },
              ),
            ],
          ),
          body: SafeArea(
            child: Container(
              child: Screenshot(
                controller: screenshotController,
                child: RotatedBox(
                  quarterTurns: _editor.rotateValue,
                  child: Obx(
                    () => imageFilterLatest(
                      brightness: _editor.brightnessValue,
                      saturation: _editor.saturationValue,
                      hue: _editor.hueValue,
                      child: RepaintBoundary(
                        child: Transform(
                          transform: Matrix4.rotationY(_editor.flipValue),
                          child: ClipRRect(
                            child: Container(
                              child: Obx(
                                () => ImageFiltered(
                                  imageFilter: ImageFilter.blur(
                                    sigmaY: _editor.blur,
                                    sigmaX: _editor.blur,
                                  ),
                                  child: Image.file(
                                    _editor.image,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
