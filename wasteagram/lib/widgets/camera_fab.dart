import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/screens/new_waste_screen.dart';
import 'package:location/location.dart';

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
        var locationService = Location();
        bool _serviceEnabled;
        PermissionStatus _permissionGranted;

        _serviceEnabled = await locationService.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await locationService.requestService();
          if (!_serviceEnabled) {
            return;
          }
        }

        _permissionGranted = await locationService.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await locationService.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            return;
          }
        }
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
