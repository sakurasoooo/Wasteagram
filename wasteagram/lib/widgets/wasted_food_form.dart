import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wasteagram/services/photo_storage_service.dart';
import 'package:location/location.dart';
import 'package:wasteagram/services/food_waste_post_service.dart';
import 'package:wasteagram/models/food_waste_post.dart';

class WasteFoodForm extends StatefulWidget {
  final File image;
  const WasteFoodForm({Key key, this.image}) : super(key: key);

  @override
  _WasteFoodFormState createState() => _WasteFoodFormState();
}

class _WasteFoodFormState extends State<WasteFoodForm> {
  int number;
  LocationData locationData;
  final formKey = GlobalKey<FormState>();

  Future retrieveLocation() async {
    var locationService = Location();
    return await locationService.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 280,
            child: TextFormField(
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Number Of Wasted Food',
              ),
              style: Theme.of(context).textTheme.headline4,
              onSaved: (value) {
                number = int.parse(value);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a number';
                } else {
                  return null;
                }
              },
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Semantics(
            label: 'An Upload button',
            button: true,
            image: false,
            child: SizedBox(
              height: 117,
              width: double.infinity,
              child: RaisedButton.icon(
                color: Colors.blue,
                onPressed: () async {
                  if (formKey.currentState.validate()) {
                    formKey.currentState.save();
                    final url = await PhotoStorage().sendImage(widget.image);
                    locationData = await retrieveLocation();
                    FoodWastePoster().sendPost(FoodWastePost(
                        picUrl: url,
                        time: DateTime.now(),
                        numberOfWasted: number,
                        latitude: locationData.latitude,
                        longtitude: locationData.longitude));
                    Navigator.pop(context);
                  }
                },
                icon: Icon(Icons.backup, size: 70),
                label: Text(''),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
