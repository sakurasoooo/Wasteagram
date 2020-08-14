import 'dart:io';
import 'package:flutter/material.dart';

class WasteDetailScreen extends StatelessWidget {
  final File image;
  const WasteDetailScreen({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wasteagram '),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(image),
            SizedBox(
              height: 50,
            )
          ],
        )));
  }
}
