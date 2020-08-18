import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

import 'package:leancloud_storage/leancloud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
  LeanCloud.initialize(
      'vtLBLUbq4rbU51lujPsOLRbg-gzGzoHsz', 'S1jcG7TcCLyowqK5et2wAcmh',
      server: 'https://vtlblubq.lc-cn-n1-shared.com',
      queryCache: new LCQueryCache());
  LCLogger.setLevel(LCLogger.DebugLevel);
  // LCObject object = LCObject('TestObject');
  // object['words'] = 'Hello world!';
  // await object.save();
  runApp(App());
}
