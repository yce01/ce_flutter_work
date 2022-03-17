import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:palm_edu/teen/teen_banner.dart';
import 'package:palm_edu/teen/teen_bottom_banner.dart';
import 'package:palm_edu/teen/teen_hotclip.dart';
import 'package:palm_edu/teen/teen_music_banner.dart';
import 'package:palm_edu/teen/teen_music_fromjoan.dart';
import 'package:palm_edu/teen/teen_music_special.dart';
import 'package:palm_edu/teen/teen_music_speciallive_list.dart';
import 'package:palm_edu/teen/teen_music_today.dart';
import 'package:palm_edu/teen/teen_replay.dart';
import 'package:palm_edu/teen/teen_special.dart';
import 'package:palm_edu/teen/teen_tv_blue.dart';

class Teen extends StatefulWidget {
  const Teen({Key? key}) : super(key: key);

  @override
  _TeenState createState() => _TeenState();
}

class _TeenState extends State<Teen> {
  final ItemScrollController itemScrollController = ItemScrollController();
  double alignment = 0;
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final List<String> _sectionList = ['좋은건 다시보기', '슈스를 위한 Hot Clip', '슈스 Special', 'SS가 조은 TV-BLUE', '갓!띵!곡!from Joan', '오늘의 틴뮤직', '미듣찬 정주행', '슈스의 특송'];
  final List _section = [
    TeenReplay(),
    TeenHotClip(),
    TeenSpecial(),
    TeenSSJoanTVBlue(),
    TeenMusicBanner(),
    TeenMusicFromJoan(),
    TeenMusicToday(),
    TeenMusicSpecialLiveList(),
    TeenMusicSpecial(),
    TeenBottomBanner(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teen',
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
              child: Text('Teen',
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
                    Icon(
                      Icons.announcement_outlined,
                      size: 15,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '일을 해야 하나님도 성령님도 주도 와서 도우시고 함께하신다',
                      style: TextStyle(fontSize: 13, color: Colors.black38),
                    )
                  ],
                ),
              ),
              const TeenBanner(),
              // _shortCut,
              list(),
              const SizedBox(
                height: 10,
              ),
              item(),
            ],
          ),
        ),
      ),
    );
  }

  // Widget get _shortCut => SingleChildScrollView(
  //     scrollDirection: Axis.horizontal,
  //     child: Row(
  //       children: [
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           '좋은건 다시보기',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(0),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           '슈스를 위한 Hot Clip',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(1),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           '슈스 Special',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(2),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           'SS가 조은 TV-BLUE',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(3),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           '갓!띵!곡!from Joan',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(4),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           '오늘의 틴뮤직',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(5),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           '미듣찬 정주행',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(6),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //         Row(
  //           children: [
  //             const Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
  //             Container(
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(3.0),
  //                     border: Border.all(color: Colors.deepPurpleAccent)),
  //                 child: Padding(
  //                     padding: const EdgeInsets.all(3),
  //                     child: Row(
  //                       children: [
  //                         const Text(
  //                           '슈스의 특송',
  //                           style: TextStyle(color: Colors.deepPurpleAccent),
  //                         ),
  //                         shortCutButton(7),
  //                       ],
  //                     ))),
  //           ],
  //         ),
  //       ],
  //     ));
  final _shortCutButtonStyle = ButtonStyle(
    minimumSize: MaterialStateProperty.all(Size.zero),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
  // Widget shortCutButton(int value) => TextButton(
  //       key: ValueKey<String>('$value'),
  //       onPressed: () => scrollTo(value),
  //       child: Container(
  //           decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(3.0),
  //               border: Border.all(color: Colors.deepPurpleAccent)),
  //           child: Padding(
  //               padding: const EdgeInsets.all(3),
  //               child: Row(
  //                 children: [
  //                   _sectionList[value],
  //                 ],
  //               ))),
  //       style: _shortCutButtonStyle,
  //     );

  Widget list() => SizedBox(
    width: double.infinity,
    height: 40,
    child: ScrollablePositionedList.builder(
          itemScrollController: itemScrollController,
          itemPositionsListener: itemPositionsListener,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: _sectionList.length,
          itemBuilder: (context, index) {
            return TextButton(
              key: ValueKey(_sectionList[index]),
              onPressed: () => scrollTo(index),
              style: TextButton.styleFrom(
                primary: Colors.deepPurpleAccent,
              ),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.0),
                      border: Border.all(color: Colors.deepPurpleAccent)),
                  child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(_sectionList[index],))),
            );
          },
        ),
  );

  Widget item() {
    return SizedBox(
      child: Column(
        children: const [
          TeenReplay(),
          TeenHotClip(),
          TeenSpecial(),
          TeenSSJoanTVBlue(),
          TeenMusicBanner(),
          TeenMusicFromJoan(),
          TeenMusicToday(),
          TeenMusicSpecialLiveList(),
          TeenMusicSpecial(),
          TeenBottomBanner(),
        ],
      ),
    );
  }

  void scrollTo(int index) => {
        // if (itemScrollController.isAttached)
          {
            itemScrollController.scrollTo(
                index: index,
                duration: const Duration(milliseconds: 80),
                curve: Curves.easeInOutCubic,
                alignment: alignment)
          }
      };
}
