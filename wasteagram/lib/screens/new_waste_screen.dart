import 'dart:io';
import 'package:flutter/material.dart';

class NewWasteScreen extends StatelessWidget {
  final File image;
  const NewWasteScreen({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Psot'),
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
      )),
    );
  }
}
