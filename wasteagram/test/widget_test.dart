// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:wasteagram/models/food_waste_post.dart';

void main() {
  test('Post created from Map should have appropriate property values', () {
    final date = DateTime.parse('2020-01-01');
    const url = 'FAKE';
    const quantity = 1;
    const latitude = 1.0;
    const longtitude = 2.0;

    final foodWastedPost = FoodWastePost.fromMap({
      'time': date,
      'picUrl': url,
      'numberOfWasted': quantity,
      'latitude': latitude,
      'longtitude': longtitude
    });

    expect(foodWastedPost.picUrl, url);
    expect(foodWastedPost.numberOfWasted, quantity);
    expect(foodWastedPost.time, date);
    expect(foodWastedPost.longtitude, longtitude);
    expect(foodWastedPost.latitude, latitude);
  });
}
