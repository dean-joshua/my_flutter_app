import 'package:flutter/material.dart';
import 'login.dart';
import 'about.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  String buttonName = 'Get Started';
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Positive Quotables"),
      ),
      body: Center(
        child: Container(
          color: Colors.black,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Positive Quotables',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Colors.white,
                  ),
                ),
                Image.asset('images/man-cake.png'),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const LoginPage();
                      }));
                    });
                  },
                  child: Text(
                    buttonName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),
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
            if (currentIndex == 1) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return AboutPage();
              }));
            }
          });
        },
      ),
    );
  }
}
