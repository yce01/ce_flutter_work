import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeLive extends StatelessWidget {
  const HomeLive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 20, 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Live',
                      style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )
                  ])),
          Container(
              width: 200,
              height: 100,
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
            width: 200,
            child: const Text(
              'ON-Air',
              style: TextStyle(
                color: Colors.black26,
                fontSize: 18,
              ),
            ),
          ),
          Container(
            width: 200,
            child: const Text(
              '2022년 1월 24일 정규방송',
              style: TextStyle(color: Colors.black54, fontSize: 25),
            ),
          ),
          Container(
              child: Column(
            children: const [
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 1,
                color: Colors.black12,
              )
            ],
          ))
        ],
      ),
    );
  }
}
