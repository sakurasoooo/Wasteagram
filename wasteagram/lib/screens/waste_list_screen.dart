import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wasteagram/widgets/camera_fab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/screens/waste_detail_screen.dart';
import 'package:leancloud_storage/leancloud.dart';

class WasteList extends StatefulWidget {
  @override
  _WasteListState createState() => _WasteListState();
}

class _WasteListState extends State<WasteList> {
  var count = 0;

  void text() async {
    LCQuery<LCObject> query = LCQuery('Student').orderByAscending('createdAt');
    List<LCObject> records = await query.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          // child: StreamBuilder(
          //     stream: Firestore.instance.collection('posts').snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData &&
          //           snapshot.data.documents != null &&
          //           snapshot.data.documents.length > 0) {
          //         var results = snapshot.data.documents;
          //         count = results
          //             .map((result) => result['numberOfWasted'])
          //             .reduce((a, b) => a + b);
          //         return AppBar(
          //           title: Text('Wasteagram ' + count.toString()),
          //         );
          //       } else {
          //         return AppBar(title: Text('Wasteagram 0'));
          //       }
          //     }),
          child: AppBar(title: Text('Wasteagram'))),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('posts')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          print('build!');
          if (snapshot.hasData &&
              snapshot.data.documents != null &&
              snapshot.data.documents.length > 0) {
            return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  var post = snapshot.data.documents[index];

                  return ListTile(
                      leading: Text(DateFormat.yMMMMEEEEd('en_US')
                          .format(post['time'].toDate())),
                      trailing: Text(
                        post['numberOfWasted'].toString(),
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WasteDetailScreen(
                                        post: FoodWastePost(
                                      picUrl: post['picUrl'],
                                      time: post['time'].toDate(),
                                      numberOfWasted: post['numberOfWasted'],
                                      latitude: post['latitude'],
                                      longtitude: post['longtitude'],
                                    ))));
                      });
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Semantics(
          child: CameraFab(),
          button: true,
          enabled: true,
          onTapHint: 'Select an image'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

// class LCInstance {
//   LCInstance(){
//     Timer.periodic(Duration(seconds: 5), (t) {_controller.sink.add(0);});
//   }
//   var ;

//   final _controller = StreamController<>();

//   Stream<> get stream => _controller.stream;
// }
