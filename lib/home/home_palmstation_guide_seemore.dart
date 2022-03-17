import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HomePalmstationGuideSeeMore extends StatelessWidget {
  const HomePalmstationGuideSeeMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '더보기',
      home: SeeMore(),
    );
  }
}

class SeeMore extends StatefulWidget {
  const SeeMore({Key? key}) : super(key: key);

  @override
  _SeeMoreState createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  final ScrollController _scrollController =
      ScrollController();
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  void _itemCount() {
    setState(() {
      if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
        print('print');
        _suggestions.addAll(generateWordPairs().take(30));
      }
    });

  }

  @override
  void initState() {
    super.initState();
    _suggestions.addAll(generateWordPairs().take(20));
    _scrollController.addListener(() {
      // print(_scrollController.offset);
      _itemCount();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('더 보기'),
        ),
        body: Scrollbar(
          controller: _scrollController,
          isAlwaysShown: true,
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(16.0),
            itemCount: _suggestions.length,
            itemBuilder: /*1*/ (context, i) {
              if (i.isOdd) return const Divider(); /*2*/

              final index = i ~/ 2; /*3*/
              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10)); /*4*/
              }
              return ListTile(
                title: Text(
                  _suggestions[index].asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          ),
        ));
  }
}
