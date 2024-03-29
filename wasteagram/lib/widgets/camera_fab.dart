import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/new_waste_screen.dart';

class CameraFab extends StatefulWidget {
  @override
  _CameraFabState createState() => _CameraFabState();
}

class _CameraFabState extends State<CameraFab> {
  File image;

  Future<File> getImage() async {
    final _picker = ImagePicker();
    PickedFile pickedImage =
        await _picker.getImage(source: ImageSource.gallery);
    return pickedImage == null ? null : File(pickedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        image = await getImage();
        if (image != null)
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewWasteScreen(image: image)));
      },
      child: Icon(Icons.camera_alt),
      backgroundColor: Colors.teal,
    );
  }
}
