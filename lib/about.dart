import 'package:flutter/material.dart';
import 'landing.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: Container(
        color: Colors.black,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hey guys!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),),
            Text('This is a fun app I created for a job I am applying for. I had a great time making it. I have to give credit to Icons8. They are a life saver and the free icons they provide are top quality. https://icons8.com', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),)
          ],
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return LandingPage();
                    }));
              }
            });
          }),
    );
  }
}