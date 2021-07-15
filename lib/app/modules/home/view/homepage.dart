import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_editor_pro/image_editor_pro.dart';
import 'package:wallpaper_app/app/modules/home/controller/photo_edit_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<PhotoEditController>(
          init: PhotoEditController(),
          builder: (_editor) {
            return Container(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    _editor.editImage();
                  }, child: Text("Edit Photo")),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
