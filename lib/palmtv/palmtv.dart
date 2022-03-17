import 'package:flutter/material.dart';
import 'package:palm_edu/palmtv/palmtv_channel.dart';
import 'package:palm_edu/palmtv/palmtv_joanchoice.dart';
import 'package:palm_edu/palmtv/palmtv_latest.dart';
import 'package:palm_edu/palmtv/palmtv_word.dart';
import 'palmtv_palmschoice.dart';
import 'palmtv_banner.dart';
import 'palmtv_sschoice.dart';
import 'palmtv_word.dart';
import 'palmtv_service_praise.dart';

class PalmTV extends StatefulWidget {
  const PalmTV({Key? key}) : super(key: key);

  @override
  _PalmTVState createState() => _PalmTVState();
}

class _PalmTVState extends State<PalmTV> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PalmTV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: const Center(
              child: Text('PalmTV',
                  style: TextStyle(
                    color: Colors.black,
                  ))),
          actions: const <Widget>[
            Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
              child: Row(
                children: const [
                  Icon(Icons.announcement_outlined, size: 15,),
                  SizedBox(width: 8,),
                  Text('팜티비에서 아래로 쭈욱~ 새로운 초이스들을 만나보세요',
                      style: TextStyle(fontSize: 13, color: Colors.black38),)
                ],
              ),),
              PalmTVBanner(),
              PalmTVSSChoice(),
              PalmTVPalmChoice(),
              PalmTVWord(),
              PalmTVChannel(),
              PalmTVLatest(),
              PalmTVServicePraise(),
              PalmTVJoanChoice(),
            ],
          ),
        ),
      ),
    );
  }
}
