import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sweat_it/components/CustomShapeClipper.dart';


//Color firstColor = Color(0xFFF47D15);
//Color secondColor = Color(0xFFEF772C);

//Color firstColor = Color(0xFF84DAFF);
//Color secondColor = Color(0xFF70cdf4);

Color firstColor = Color(0xFF7f70f5);
Color secondColor = Color(0xFF0ea0ff);


ThemeData appTheme = ThemeData(primaryColor: Color(0xFF7f70f5), fontFamily: 'Quicksand');

var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

final key = new GlobalKey();
final benKey = new GlobalKey();
final rygKey = new GlobalKey();
//final ben = new GlobalKey();


class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              HomeScreenTopPart(),
              HomeScreenBottomPart(),
            ],
          ),
        ),
    );
  }
}

const TextStyle dropDownLabelStyle = TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle = TextStyle(color: Colors.black, fontSize: 24.0);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {

  // Create a text controller. We will use it to retrieve the current value
  // of the TextField!
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Velkommen til Sweat It,\nMalthe',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    child: TextField(
                      controller: myController,
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                      cursorColor: appTheme.primaryColor,
                      decoration: InputDecoration(
                        hintText: "Søg efter program",
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 32.0, vertical: 14.0),
                        suffixIcon: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                          child: InkWell(
                            // This is the search function
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              var myVar = myController.text;
                              myController.clear();
                              myVar = myVar.toUpperCase(); // We need to make the myVar uppercase to make sure it takes all possible inputs into consideration
                              if(myVar == 'BEN') {
                                Scrollable.ensureVisible(benKey.currentContext);
                              } else if(myVar == 'RYG') {
                                Scrollable.ensureVisible(rygKey.currentContext);
                              } else {
                                return openAlertBox(context, '$myVar');
                              }
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//                Row(
//                  mainAxisSize: MainAxisSize.min,
//                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                  children: <Widget>[
//                    roundButton(
//                        Icons.thumb_up,
//                        'Nem'
//                    ),
//                    SizedBox(
//                      width: 20.0,
//                    ),
//                    roundButton(
//                        Icons.thumbs_up_down,
//                        'Mellem'
//                    ),
//                    SizedBox(
//                      width: 20.0,
//                    ),
//                    roundButton(
//                        Icons.thumb_down,
//                        'Svær'
//                    ),
//                  ],
//                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}


Widget roundButton(IconData icon, String title) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration:BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            icon,
            size: 20.0,
            color: Colors.white,
          ),
          SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
    onTap: () => Scrollable.ensureVisible(benKey.currentContext),
  );

}



class HomeScreenBottomPart extends StatefulWidget {
  @override
  HomeScreenBottomPartState createState() {
    return new HomeScreenBottomPartState();
  }
}

class HomeScreenBottomPartState extends State<HomeScreenBottomPart> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//          Container(
//            padding: EdgeInsets.only(left: 10.0, right: 10.0),
//            decoration: BoxDecoration(
//              border: Border.all(
//                  color: firstColor,
//                  width: 2.0,
//                  style: BorderStyle.solid),
//              borderRadius: BorderRadius.circular(20.0),
//            ),
//            child: DropdownButtonHideUnderline(
//              child: DropdownButton(
//                value: _currentValue,
//                items: _dropDownMenuItems,
//                onChanged: changedDropDownItem,
//              ),
//            ),
//          ),
        completeWorkoutList(context, key, 'Anbefalede'),
        completeWorkoutList(context, benKey, 'Ben Træning'),
        completeWorkoutList(context, rygKey, 'Ryg Træning'),
      ],
    );
  }

}


// Workout list widget
Widget workoutThumb(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          child: Stack(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  height: 210.0,
                  width: 160.0,
                  child: CachedNetworkImage(
                    imageUrl: 'https://image.freepik.com/free-vector/fitness-background-design_1212-477.jpg',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(milliseconds: 500),
                    fadeInCurve: Curves.easeIn,
                    placeholder: Center(child: CircularProgressIndicator()),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/course');
                },
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                width: 160.0,
                height: 60.0,
                child: Container(
                  decoration: BoxDecoration( // Made to ensure the black overlay at the bottom
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.1),
                          ]
                      )
                  ),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                right: 10.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Ben Træning',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18.0),
                        ),
                        Text(
                          '02:54 Timer',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 14.0
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      child: Icon(
                        Icons.bubble_chart,
                        color: Colors.black,
                        size: 14.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 5.0,
            ),
            Text(
              'Undertitel',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              "Gammel pris",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0),
            ),
          ],
        ),
      ],
    ),
  );
}


// Complete Workout list widget
Widget completeWorkoutList(BuildContext context, GlobalKey key, String title) {
  return Column(
    children: <Widget>[
      Padding(
        key: key,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style: dropDownMenuItemStyle,
            ),
            Spacer(),
            GestureDetector(
              child: Text(
                "SE ALLE (4)",
                style: viewAllStyle,
              ),
//              onTap: () => print("hej"),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 240.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            workoutThumb(context),
            workoutThumb(context),
            workoutThumb(context),
            workoutThumb(context),
          ],
        ),
      ),
    ],
  );
}



openAlertBox(BuildContext context, String text) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(24.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: Container(
            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Program Ikke Fundet",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Divider(
                  color: Colors.grey,
                  height: 10.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(
                    'Programmet "$text" kunne desværre ikke findes.\n\nTjek at du har stavet det rigtigt.',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                      )
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  child: Container(
//                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      color: firstColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24.0),
                          bottomRight: Radius.circular(24.0)),
                    ),
                    child: MaterialButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      padding: EdgeInsets.all(0.0),
                      child: Text(
                      "Luk",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                      onPressed: () => Navigator.pop(context),
                    )
                  ),
                ),
              ],
            ),
          ),
        );
      }
  );
}