import 'package:flutter/material.dart';
import 'package:monews/screens/add_contact_screen.dart';
import 'package:monews/screens/explore_screen.dart';
import 'package:monews/screens/home_screen.dart';
import 'package:monews/screens/save_screen.dart';
import 'package:monews/screens/splash_screen.dart';
import 'package:monews/screens/user_screen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class BottomNavigatoin extends StatefulWidget {
  BottomNavigatoin({Key? key}) : super(key: key);

  @override
  State<BottomNavigatoin> createState() => _BottomNavigatoinState();
}

class _BottomNavigatoinState extends State<BottomNavigatoin> {
  int _selectedBottomItem = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedBottomItem,
        backgroundColor: Colors.grey,
        selectedIconTheme: IconThemeData(color: Colors.red),
        onTap: (int index) {
          setState(() {
            _selectedBottomItem = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/profile.png'),
            label: '',
            activeIcon: Icon(Icons.account_circle_rounded),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/save_2.png'),
            label: '',
            activeIcon: Icon(Icons.bookmarks),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/add_circle.png'),
            label: '',
            activeIcon: Icon(Icons.add_circle_outline_rounded),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/discover.png'),
            label: '',
            activeIcon: Image.asset('images/discover_active.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/home.png'),
            label: '',
            activeIcon: Image.asset('images/home_active.png'),
          ),
        ],
      ),
      body: _getLayout()[_selectedBottomItem],
    );
  }

  List<Widget> _getLayout() {
    return <Widget>[
      UserScreen(),
      SaveScreen(),
      AddContent(),
      ExploreScreen(),
      HomeScreen(),
    ];
  }
}
