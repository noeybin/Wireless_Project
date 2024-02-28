import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class Savedlist extends StatefulWidget {
  Savedlist({Key? key}) : super(key: key);
  @override
  _SavedlistState createState() => _SavedlistState();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saved List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        
      ),
      home: Savedlist(),
    );
  }
}

class _SavedlistState extends State<Savedlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Saved List"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("Data_Recipe").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              print(snapshot.data?.docs[index]["Menu"]); // debugging
              return ListTile(
                title: Text(snapshot.data?.docs[index]["Menu"]),
                subtitle: Image.network(snapshot.data?.docs[index]["imageurl"]),
                tileColor: Color.fromARGB(255, 255, 203, 124),
                onTap: () {
                  Navigator.pushNamed(context, '/food$index');
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.image,
      required this.link})
      : super(key: key);
  final String name;
  final String description;
  final String image;
  final String link;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              //Image.asset("assets/" + image),

              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/' + this.link);
                  },
                  icon: Image.network(this.image)),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                        ],
                      )))
            ])));
  }
}
