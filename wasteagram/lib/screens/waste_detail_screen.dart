import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';

class WasteDetailScreen extends StatelessWidget {
  final FoodWastePost post;
  const WasteDetailScreen({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Wasteagram'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 100,
                child: Center(
                    child: Text(
                  DateFormat.yMMMMEEEEd('en_US').format(post.time),
                  style: Theme.of(context).textTheme.headline4,
                ))),
            SizedBox(height: 100),
            Semantics(
              label: 'An image of wasted food',
              image: true,
              enabled: true,
              readOnly: true,
              child: SizedBox(
                  height: 300,
                  child: Image.network(
                    post.picUrl,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : LinearProgressIndicator();
                    },
                  )),
            ),
            SizedBox(
                height: 200,
                child: Center(
                  child: Text(
                    post.numberOfWasted.toString() + " Items",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                )),
            SizedBox(
                height: 50,
                child: Center(
                    child: Text(
                        "Location (${post.latitude}, ${post.longtitude})")))
          ],
        )));
  }
}
