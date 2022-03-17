// Copyright 2019 The Fuchsia Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

const numberOfItems = 20;
const scrollDuration = Duration(milliseconds: 80);

const randomMax = 1 << 32;

void main() {
  runApp(ScrollablePositionedListExample());
}

// The root widget for the example app.
class ScrollablePositionedListExample extends StatelessWidget {
  const ScrollablePositionedListExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScrollablePositionedList Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ScrollablePositionedListPage(),
    );
  }
}

/// Example widget that uses [ScrollablePositionedList].
///
/// Shows a [ScrollablePositionedList] along with the following controls:
///   - Buttons to jump or scroll to certain items in the list.
///   - Slider to control the alignment of the items being scrolled or jumped
///   to.
///   - A checkbox to reverse the list.
///
/// If the device this example is being used on is in portrait mode, the list
/// will be vertically scrollable, and if the device is in landscape mode, the
/// list will be horizontally scrollable.
class ScrollablePositionedListPage extends StatefulWidget {
  const ScrollablePositionedListPage({Key? key}) : super(key: key);

  @override
  _ScrollablePositionedListPageState createState() =>
      _ScrollablePositionedListPageState();
}

class _ScrollablePositionedListPageState
    extends State<ScrollablePositionedListPage> {
  /// Controller to scroll or jump to a particular item.
  final ItemScrollController itemScrollController = ItemScrollController();

  /// Listener that reports the position of items when the list is scrolled.
  final ItemPositionsListener itemPositionsListener =
  ItemPositionsListener.create();
  late List<double> itemHeights;
  late List<Color> itemColors;
  bool reversed = false;

  /// The alignment to be used next time the user scrolls or jumps to an item.
  double alignment = 0;

  @override
  void initState() {
    super.initState();
    final colorGenerator = Random(42490823);
    itemColors = List<Color>.generate(numberOfItems,
            (int _) => Color(colorGenerator.nextInt(randomMax)).withOpacity(1));
  }

  @override
  Widget build(BuildContext context) => Material(
    child: OrientationBuilder(
      builder: (context, orientation) => Column(
        children: <Widget>[
          Expanded(
            child: list(orientation),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  scrollControlButtons,
                  const SizedBox(height: 50),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );

  Widget list(Orientation orientation) => ScrollablePositionedList.builder(
    itemCount: numberOfItems,
    itemBuilder: (context, index) => item(index, orientation),
    itemScrollController: itemScrollController,
    itemPositionsListener: itemPositionsListener,
    reverse: reversed,
    scrollDirection: orientation == Orientation.portrait
        ? Axis.vertical
        : Axis.horizontal,
  );

  Widget get scrollControlButtons => Row(
    children: <Widget>[
      const Text('scroll to'),
      scrollButton(0),
      scrollButton(5),
      scrollButton(10),
    ],
  );

  final _scrollButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
    ),
    minimumSize: MaterialStateProperty.all(Size.zero),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  Widget scrollButton(int value) => TextButton(
    key: ValueKey<String>('Scroll$value'),
    onPressed: () => scrollTo(value),
    child: Text('$value'),
    style: _scrollButtonStyle,
  );

  void scrollTo(int index) => itemScrollController.scrollTo(
      index: index,
      duration: scrollDuration,
      curve: Curves.easeInOutCubic,
      alignment: alignment);

  /// Generate item number [i].
  Widget item(int i, Orientation orientation) {
    return SizedBox(
      height: 70,
      // width: orientation == Orientation.landscape ? itemHeights[i] : null,
      child: Container(
        color: itemColors[i],
        child: Center(
          child: Text('Item $i'),
        ),
      ),
    );
  }
}