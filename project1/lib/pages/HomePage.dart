import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 203, 124),
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    onPressed: () {
// open Homepage
                      Navigator.pushNamed(context, '/aboutus');
                    },
                    child:
                        Text('About us', style: TextStyle(color: Colors.blue)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    onPressed: () {
// open Homepage
                      Navigator.pushNamed(context, '/foodlist');
                    },
                    child:
                        Text('Food List', style: TextStyle(color: Colors.blue)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    onPressed: () {
// open Homepage
                      Navigator.pushNamed(context, '/Savedlist');
                    },
                    child: Text('Saved List',
                        style: TextStyle(color: Colors.blue)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: MaterialButton(
                    onPressed: () {
// open Homepage
                      Navigator.pushNamed(context, '/profile');
                    },
                    child:
                        Text('Profile', style: TextStyle(color: Colors.blue)),
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
