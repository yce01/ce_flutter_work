import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TeenMusicSpecial extends StatefulWidget {
  const TeenMusicSpecial({Key? key}) : super(key: key);

  @override
  _TeenMusicSpecialState createState() => _TeenMusicSpecialState();
}

class _TeenMusicSpecialState extends State<TeenMusicSpecial> {
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
                  '슈스의 특송',
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
            const SizedBox(
              height: 10,
            ),
            _contentSection(),
          ]),
    );
  }

  Widget _contentSection() {
    final controller = PageController(viewportFraction: 0.4, keepPage: true);
    final pages = List.generate(
        9,
        (index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: 130,
                    height: 130,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.transparent)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Stack(
                        children: [
                          Image.network(
                            'https://i.pinimg.com/474x/eb/16/31/eb16317649aa94686d052f4f4b0ac4e8.jpg',
                            fit: BoxFit.cover,
                            width: 200,
                            height: 150,
                          ),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.play_arrow_rounded, color: Colors.white, size: 35,),
                          )
                        ],
                      )
                    )),
                SizedBox(
                  width: 180,
                  child: Text(
                    "주와 같이 끝까지 $index",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Text(
                    '#흰돌SS #슈스예배특송',
                    style: TextStyle(color: Colors.black26, fontSize: 8),
                  ),
                ),
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
              height: 180,
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
