import 'dart:io';
import 'package:flutter/material.dart';

class WasteFoodForm extends StatefulWidget {
  final File image;
  const WasteFoodForm({Key key, this.image}) : super(key: key);

  @override
  _WasteFoodFormState createState() => _WasteFoodFormState();
}

class _WasteFoodFormState extends State<WasteFoodForm> {
  int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Number Of Wasted Food',
          ),
          onChanged: (text) {
            number = int.parse(text);
            print(number);
          },
        ),
        SizedBox(
          height: 300,
        ),
        SizedBox(
          height: 117,
          width: double.infinity,
          child: RaisedButton.icon(
            color: Colors.blue,
            onPressed: () {},
            icon: Icon(Icons.backup, size: 70),
            label: Text(''),
          ),
        )
      ],
    );
  }
}
