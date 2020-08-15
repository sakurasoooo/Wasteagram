import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/widgets/wasted_food_form.dart';

class NewWasteScreen extends StatelessWidget {
  final File image;
  const NewWasteScreen({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
      ),
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Semantics(
                label: 'A picture you have selected',
                image: true,
                child: SizedBox(height: 309, child: Image.file(image))),
            SizedBox(
              height: 20,
            ),
            WasteFoodForm(
              image: image,
            )
          ],
        )),
      ),
    );
  }
}
