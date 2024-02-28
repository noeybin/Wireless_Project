import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class FoodPage0 extends StatefulWidget {
  FoodPage0({Key? key}) : super(key: key);
  @override
  _foodlistState createState() => _foodlistState();
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
      title: 'Food Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoodPage0(),
    );
  }
}

class _foodlistState extends State<FoodPage0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Food Page"),
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
            itemCount: 1,
            itemBuilder: (context, index) {
              print(snapshot.data?.docs[0]["Menu"]); // debugging
              return ListTile(
                title: Text(snapshot.data?.docs[0]["Menu"] +
                    "\n\n" +
                    snapshot.data?.docs[0]["Description"] +
                    "\n\n" +
                    "Ingredient: " +
                    snapshot.data?.docs[0]["Ingredients"] +
                    "\n\n"),
                subtitle: Image.network(snapshot.data?.docs[0]["imageurl"],),
                tileColor: Color.fromARGB(255, 255, 203, 124)
              );
            },
          );
        },
      ),
    );
  }
}
