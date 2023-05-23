import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'landing.dart';
import 'dart:math';

class QuotesPage extends StatefulWidget {
  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  int currentIndex = 0;
  var db = FirebaseFirestore.instance;
  Map<String, dynamic> quoteMap = {};
  var quoteArr = [];
  int rng = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quotes"),
      ),
      body: Container(
        color: Colors.black,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            quoteArr.isEmpty
                ? const Text(
                    'Click the button!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                : Image.network(quoteArr[rng]),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (quoteArr.length < 16) {
                    db.collection("quotes").get().then(
                      (querySnapshot) {
                        print("Successfully completed");
                        for (var docSnapshot in querySnapshot.docs) {
                          quoteMap.addEntries(docSnapshot.data().entries);
                          quoteArr.add(quoteMap["link"]);
                        }
                      },
                      onError: (e) => print("Error completing: $e"),
                    );
                  }
                  rng = Random().nextInt(quoteArr.length - 1);
                });
              },
              child: const Text(
                'Generate Quote',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'About',
              icon: Icon(Icons.info),
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
              if (currentIndex == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return LandingPage();
                }));
              }
            });
          }),
    );
  }
}
