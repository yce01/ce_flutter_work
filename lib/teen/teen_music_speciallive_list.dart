import 'package:flutter/material.dart';

class TeenMusicSpecialLiveList extends StatefulWidget {
  const TeenMusicSpecialLiveList({Key? key}) : super(key: key);

  @override
  _TeenMusicSpecialLiveListState createState() =>
      _TeenMusicSpecialLiveListState();
}

class _TeenMusicSpecialLiveListState extends State<TeenMusicSpecialLiveList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Center(
                  child: Text(
                    '미듣찬 정주행',
                    style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
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
    final controller = PageController(viewportFraction: 1.0, keepPage: true);
    final pages = List.generate(
      2,
      (index) => ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: SizedBox(
                  child: Text(
                    "${index + 1}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(color: Colors.transparent)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.network(
                            'https://png.pngtree.com/thumb_back/fw800/back_pic/03/90/42/3457dce0f21d524.jpg',
                            fit: BoxFit.cover,
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                      Text(
                        "미듣찬 Live",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '미듣찬',
                        style: TextStyle(color: Colors.black26, fontSize: 10),
                      ),
                    ]),
                  ],
                ),
                trailing: const Icon(Icons.more_vert_outlined));
          }),
    );
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 230,
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index % pages.length];
                },
                padEnds: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
