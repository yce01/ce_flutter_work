import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PalmTVChannel extends StatefulWidget {
  const PalmTVChannel({Key? key}) : super(key: key);

  @override
  _PalmTVChannelState createState() => _PalmTVChannelState();
}

class _PalmTVChannelState extends State<PalmTVChannel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                '채널',
                style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Row(children: const <Widget>[
                Text('더 보기', style: TextStyle(color: Colors.black26, fontSize: 10)),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.deepPurple,
                ),
              ]),
            ],
          ),
          const SizedBox(height: 10,),
          _contentSection(),
        ]
      )
    );
  }

  Widget _contentSection() {
    final controller = PageController(viewportFraction: 0.3, keepPage: true);
    final pages = List.generate(
        7,
            (index) => Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: Colors.transparent)),
                  child: const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage('https://interactive-examples.mdn.mozilla.net/media/cc0-images/grapefruit-slice-332-332.jpg'),
                  )),
              Center(
                child: Text(
                  "캐미조아 $index",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
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
              height: 110,
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