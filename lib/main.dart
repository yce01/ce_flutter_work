import 'package:flutter/material.dart';
import 'package:palm_edu/teen/teen.dart';
import 'home/home.dart';
import 'palmtv/palmtv.dart';
import 'home/scroll_test.dart';
import 'home/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HOME',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
       home: Teen(),
    );
  }


}
