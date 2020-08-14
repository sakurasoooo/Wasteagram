import 'dart:io';
import 'package:flutter/material.dart';

class WasteDetailScreen extends StatelessWidget {
  //final File image;
  const WasteDetailScreen({Key key}) : super(key: key);
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
            // Image.file(image),
            SizedBox(
                height: 100, child: Center(child: Text("Sun,Feb 2, 2020"))),
            SizedBox(height: 100),
            SizedBox(height: 300, child: Placeholder()),
            SizedBox(
                height: 200,
                child: Center(child: Text(3.toString() + " Items"))),
            SizedBox(
                height: 50,
                child: Center(child: Text("Location (1123, -123141)")))
          ],
        )));
  }
}
