import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home_palmstation_guide_seemore.dart';

class HomePalmstationGuide extends StatefulWidget {
  const HomePalmstationGuide({Key? key}) : super(key: key);

  @override
  _HomePalmstationGuideState createState() => _HomePalmstationGuideState();
}

class _HomePalmstationGuideState extends State<HomePalmstationGuide> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                '팜스테이션 가이드',
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              InkWell(
                child: Row(children: const <Widget>[
                  Text('더 보기',
                      style: TextStyle(color: Colors.black26, fontSize: 20)),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                  ),
                ]),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const SeeMore())
                  );
                },
              ),
            ],
          ),
          _guideSection(),
        ]));
  }

  Widget _guideSection() {
    final controller = PageController(viewportFraction: 0.5, keepPage: true);
    final pages = List.generate(
        6,
        (index) => Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
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
                          'https://flutter-examples.com/wp-content/uploads/2019/09/blossom.jpg',
                          fit: BoxFit.fill,
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      "가이드 $index",
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const Text(
                    '업데이트 안내',
                    style: TextStyle(color: Colors.black26, fontSize: 20),
                  ),
                ],
              ),
            ));
    return SafeArea(
      child: SingleChildScrollView(
        // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 200,
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
            Center(
              child: SmoothPageIndicator(
                  controller: controller,
                  count: pages.length,
                  effect: const ScrollingDotsEffect(
                    activeStrokeWidth: 2.6,
                    activeDotScale: 1.3,
                    maxVisibleDots: 5,
                    radius: 8,
                    spacing: 10,
                    dotHeight: 12,
                    dotWidth: 12,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
