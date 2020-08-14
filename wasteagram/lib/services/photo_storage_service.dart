import 'dart:io';
import 'package:intl/intl.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PhotoStorage {
  Future sendImage(File image) async {
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
