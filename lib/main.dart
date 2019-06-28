import 'package:flutter/material.dart';
import 'package:sweat_it/screens/home_screen.dart';
import 'package:sweat_it/screens/intro/intro.dart';
import 'package:sweat_it/screens/intro/login.dart';
import 'package:sweat_it/screens/settings.dart';
import 'package:sweat_it/screens/workout_section/workout.dart';

//Color firstColor = Color(0xFFF47D15);
//Color secondColor = Color(0xFFEF772C);

//Color firstColor = Color(0xFF3d6dff);
//Color secondColor = Color(0xFF3063ff);

Color firstColor = Color(0xFF7f70f5);
Color secondColor = Color(0xFF0ea0ff);


ThemeData appTheme = ThemeData(primaryColor: Color(0xFF7f70f5), fontFamily: 'Quicksand');

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);



void main() {
  runApp(
      MaterialApp(
        title: 'Sweat It',
        theme: ThemeData(
          primaryColor: firstColor,
          // This is for the scroll overlay
          accentColor: firstColor,
          accentColorBrightness: Brightness.light,
          fontFamily: 'Quicksand'
        ),
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingMainPage(),
        '/login': (context) => loginScreen(),
        '/home': (context) => mainScreen(),
        '/course': (context) => workoutHome(),
      },
    )
  );
}



class mainScreen extends StatefulWidget {
  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<mainScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomeScreen(),
    Text('For Nylig'),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
//          height: 83,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top
          ),
          child: Padding(
              padding: EdgeInsets.only(
                  left: 10.0,
                  top: 10.0,
                  bottom: 10.0
              ),
              child: Text(
                      'Sweat It',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white
                      ),
                    ),
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    firstColor,
                    secondColor,
                  ]
              ),
//              boxShadow: [
//                BoxShadow(
////                  color: Colors.grey[500],
//                  blurRadius: 0.0,
//                  spreadRadius: 0.0,
//                )
//              ]
          ),
        ),
        preferredSize: Size(
            MediaQuery.of(context).size.width,
            150.0
        ),
      ),

      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.white,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: firstColor,
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: TextStyle(color: Colors.black))), // sets the inactive color of the `BottomNavigationBar`,
        child: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Hjem"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch_later),
              title: Text("For nylig"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Indstillinger"),
            ),
          ],
        ),
      ),
      body: _pageOptions[_selectedPage],
    );
  }
}
