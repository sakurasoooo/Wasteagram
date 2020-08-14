import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/food_waste_post.dart';

class FoodWastePoster {
  void sendPost(FoodWastePost post) {
    Firestore.instance.collection('posts').add(post.toMap());
  }
}
