import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:leancloud_storage/leancloud.dart';

class FoodWastePoster {
  void sendPost(FoodWastePost post) {
    Firestore.instance.collection('posts').add(post.toMap());
    // LCObject record = LCObject('Record');
    // record['picUrl'] = post.picUrl;
    // record['time'] = post.time;
    // record['numberOfWasted'] = post.numberOfWasted;
    // record['latitude'] = post.latitude;
    // record['longtitude'] = post.longtitude;
    // record.save();
  }
}
