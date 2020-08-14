import 'package:flutter/material.dart';
import 'package:wasteagram/screens/waste_detail_screen.dart';
import 'package:wasteagram/widgets/camera_fab.dart';

class WasteList extends StatefulWidget {
  @override
  _WasteListState createState() => _WasteListState();
}

class _WasteListState extends State<WasteList> {
  final count = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram ' + count.toString()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            leading: Text("Thursday, Janary 30, 2020 "),
            trailing: Text('5'),
            onTap: () {
              print("TAP1");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WasteDetailScreen()));
            },
          ),
          ListTile(
            title: Text("Thursday, Janary 30, 2020"),
            trailing: Text('5'),
            onTap: () {
              print("TAP2");
            },
          )
        ],
      ),
      floatingActionButton: CameraFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
