import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  String randomtext = "Hi, user!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 203, 124),
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(""),
              Image(
                image: AssetImage('assets/profile.png'),
                height: 100,
              ),
              Text('Profile',
                  style: TextStyle(fontSize: 20, color: Colors.blue)),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child:
                        Text(randomtext, style: TextStyle(color: Colors.blue)),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: OutlinedButton(
                    onPressed: () => _dialogBuilder(context),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child:
                        Text('Log Out', style: TextStyle(color: Colors.blue)),
                  )),
                ],
              )
            ],
          ),
        ));
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logging out'),
          content: const Text(
            'Are you sure you want to log out?',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.white),
              child: const Text('Log out'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
