import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PalmTVBanner extends StatefulWidget {
  const PalmTVBanner({Key? key}) : super(key: key);

  @override
  _PalmTVBannerState createState() => _PalmTVBannerState();
}

class _PalmTVBannerState extends State<PalmTVBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _dawnsSection(),
        ]
      )
    );
  }

  Widget _dawnsSection() {
    final controller = PageController(viewportFraction: 1.0, keepPage: true);
    final pages = List.generate(
        6,
            (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 70,
                    child: ClipRRect(
                      child: Image.network(
                        'https://cdn.notefolio.net/img/8c/d6/8cd646a2f7031f8564ca4cbf07aed08ca3ff79a90a81996b8465bc9bb341b278_v1.jpg',
                        fit: BoxFit.cover,
                      ),
                    )),
              ],
            ));
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 80,
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
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
                    spacing: 15,
                    dotHeight: 5,
                    dotWidth: 5,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}