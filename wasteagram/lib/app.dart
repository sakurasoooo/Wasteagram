import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'screens/waste_list_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter APP',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark),
        home: WasteList());
  }

  String getdate() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd-jms');
    final String formatted = formatter.format(now);
    return formatted;
  }
}
