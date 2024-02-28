import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class Foodlist extends StatefulWidget {
  Foodlist({Key? key}) : super(key: key);
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
      title: 'Food List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Foodlist(),
    );
  }
}

class _foodlistState extends State<Foodlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Food List"),
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
                title: Text(snapshot.data?.docs[index]["Menu"] +
                    "\n\n" +
                    snapshot.data?.docs[index]["Description"] +
                    "\n\n" +
                    "Ingredient: " +
                    snapshot.data?.docs[index]["Ingredients"] +
                    "\n\n"),
                subtitle: Image.network(snapshot.data?.docs[index]["imageurl"]),
                tileColor: Color.fromARGB(255, 255, 203, 124)
              );
            },
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final String image;

  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {
                // Handle navigation or action (later)
              },
              icon: Image.network(image), // Changed to display images (later)
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(description),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



/*class _foodlistState extends State<Foodlist> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}*/

/*class _foodlistState extends State<Foodlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text("Online Recipe List")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            SizedBox(
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Savedlist');
                },
                child: Text("Saved list", style: TextStyle(color: Colors.blue)),
              ),
            ),
            ProductBox(
                name: "Pizza",
                description:
                    "Pizza is a dish of Italian origin consisting of a usually round, flat base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients.",
                image: "pizza.png"),
            ProductBox(
                name: "Burger",
                description:
                    "Hamburgers are often sold at fast-food restaurants and diners, but are also sold at various other restaurants.",
                image: "burger.jpg"),
            ProductBox(
                name: "French Fries",
                description:
                    "French fries are served hot, either soft or crispy, and are generally eaten as part of lunch or dinner or by themselves as a snack, and they commonly appear on the menus of diners, fast food restaurants, pubs, and bars.",
                image: "fries.png"),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);
  final String name;
  final String description;
  final String image;
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
                    Navigator.pushNamed(context, '/food');
                  },
                  icon: Image.asset("assets/" + image)),
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
}*/

