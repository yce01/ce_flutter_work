import 'package:flutter/material.dart';

class PalmTVJoanChoice extends StatefulWidget {
  const PalmTVJoanChoice({Key? key}) : super(key: key);

  @override
  _PalmTVJoanChoiceState createState() => _PalmTVJoanChoiceState();
}

class _PalmTVJoanChoiceState extends State<PalmTVJoanChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'JOAN CHOICE',
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
    final controller = PageController(viewportFraction: 0.5, keepPage: true);
    final pages = List.generate(
      9,
          (index) => Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 200,
                height: 100,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.transparent)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    'https://file.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1103582_16381760674866648.jpg',
                    fit: BoxFit.cover,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                '말씀과 진리로 모든 걸 얻은 우리',
                style: TextStyle(color: Colors.black26, fontSize: 10),
              ),
            ),
            Container(
              width: 180,
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                "진리로 $index",
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                ),
              ),
            ),
            const Text(
              '주일예배 특송',
              style: TextStyle(color: Colors.black26, fontSize: 11),
            ),
          ],
        ),
      ),);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 170,
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
