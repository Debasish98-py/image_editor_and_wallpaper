import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper_app/app/modules/image_editor/view/image_editor_view.dart';
import 'package:wallpaper_app/app/modules/shared/shared_controller/shared_controller.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = Get.context.height;
    var width = Get.context.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: GetBuilder<SharedController>(
          init: SharedController(),
          builder: (_editor) {
            return Container(
              padding: EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            height: height * 0.2,
                            color: Colors.yellowAccent[200],
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Select Photo",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.camera,
                                            size: 40,
                                            color: Colors.blue,
                                          ),
                                          Text(
                                            "Camera",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        _editor.getImageFromCamera();
                                      },
                                    ),
                                    GestureDetector(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.folder,
                                            size: 40,
                                            color: Colors.greenAccent,
                                          ),
                                          Text(
                                            "Gallery",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      onTap: () async {
                                        await _editor.getImageFromGallery();
                                        Get.to(() => ImageEditor());
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Text("Edit Photo"),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Browse Wallpapers"),
                    ),
                    TextButton(
                      onPressed: () {
                        _editor.editImage();
                      },
                      child: Text("Test"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
