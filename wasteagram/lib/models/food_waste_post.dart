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
}
