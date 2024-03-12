import 'package:flutter/material.dart';
import 'package:lab6_excercise/animation.dart';
import 'package:lab6_excercise/animationCart.dart';
import 'package:lab6_excercise/changeColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static final List<Widget> _pages = <Widget>[
    const HomePage(),
    const ExerciseAnimation(),
    const ChangeColors(),
    const Bai2(),
  ];

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lab5_excercise',
      home: Scaffold(
        body: MyApp._pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(40, 40, 40, 1),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.animation),
              label: 'Animation1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.data_object),
              label: 'Colors obj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.change_circle),
              label: 'cart',
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            'Home Page',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              height: 100,
              child: const Text(
                'Welcome to my app!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              heightFactor: 2,
              alignment: Alignment.center,
              child: Text(
                'Introduce',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              borderOnForeground: true,
              color: Colors.blue[300],
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: Nguyen Phi Hieu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Student code: DH52005810',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Class: D20_TH09',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Align(
              heightFactor: 2,
              alignment: Alignment.center,
              child: Text(
                'Exercise',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              height: 600,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.amber[400],
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: const Column(
                children: [
                  Text(
                    'LAB 05',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flutter_dash_outlined,
                        color: Colors.blue,
                        size: 100,
                      ),
                      Text(
                        'Flutter',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 10),
                    child: Text(
                      'Sate Managerment',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Animation',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Change Color',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'cart adding',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
