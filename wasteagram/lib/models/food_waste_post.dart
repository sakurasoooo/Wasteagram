class FoodWastePost {
  final String picUrl;
  final DateTime time;
  final int numberOfWasted;
  final double latitude;
  final double longtitude;
  FoodWastePost(
      {this.picUrl,
      this.time,
      this.numberOfWasted,
      this.latitude,
      this.longtitude});

  Map<String, dynamic> toMap() {
    return {
      'picUrl': picUrl,
      'time': time,
      'numberOfWasted': numberOfWasted,
      'latitude': latitude,
      'longtitude': longtitude
    };
  }

  FoodWastePost.fromMap(Map map)
      : picUrl = map['picUrl'],
        time = map['time'],
        numberOfWasted = map['numberOfWasted'],
        latitude = map['latitude'],
        longtitude = map['longtitude'];
}
