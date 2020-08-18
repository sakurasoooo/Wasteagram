import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:leancloud_storage/leancloud.dart';

class PhotoStorage {
  Future sendImage(File image) async {
    //print('Sending photo');
    // LCFile imageFile =
    //     await LCFile.fromPath(getdate('yyyy-MM-dd-h-m-s') + '.jpg', image.path);
    // await imageFile.save();
    // print('ObjectId ' + imageFile.url);
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child(getdate('yyyy-MM-dd-h-m-s') + '.jpg');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    final url = await storageReference.getDownloadURL();

    return url;
  }

  String getdate(String format) {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat(format);
    final String formatted = formatter.format(now);
    return formatted;
  }
}
