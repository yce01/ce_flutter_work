import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PalmTVWord extends StatefulWidget {
  const PalmTVWord({Key? key}) : super(key: key);

  @override
  _PalmTVWordState createState() => _PalmTVWordState();
}

class _PalmTVWordState extends State<PalmTVWord> {
  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  '생명의 말씀',
                  style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Row(children: const <Widget>[
                  Text('더 보기',
                      style: TextStyle(color: Colors.black26, fontSize: 15)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                    size: 10,
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 10,),
            _contentSection(),
          ]),);
  }

  Widget _contentSection() {
    final controller = PageController(viewportFraction: 0.75, keepPage: true);
    final pages = List.generate(
        9,
            (index) => Container(
          // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 250,
                  height: 150,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.transparent)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      'https://png.pngtree.com/thumb_back/fw800/back_pic/03/90/42/3457dce0f21d524.jpg',
                      fit: BoxFit.cover,
                      width: 200,
                      height: 150,
                    ),
                  )),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                child: Text(
                  'text',
                  style: TextStyle(color: Colors.black26, fontSize: 10),
                ),
              ),
              SizedBox(
                width: 180,
                child: Text(
                  "수요일 $index",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ));
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 210,
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
                pageSnapping: false,
                padEnds: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}