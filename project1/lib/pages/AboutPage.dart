import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 203, 124),
        appBar: AppBar(
          title: Text('About us'),
        ),
        body: Center(
          child: Column(
            children: [
              Text("\n\n" +
                  'PIMMADA TULARAK 6388072' +
                  "\n" +
                  'PATTANUT SUMRANCHIT 6488140' +
                  "\n" +
                  'KASIDIT TANGBUCHAKIAT 6488141' +
                  "\n" +
                  'POOHTANMAI SIRIWACHIRAPAP 6488191')
            ],
          ),
        ));
  }
}
