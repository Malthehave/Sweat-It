import 'package:flutter/material.dart';


Color firstColor = Color(0xFF7f70f5);
Color secondColor = Color(0xFF0ea0ff);


ThemeData appTheme = ThemeData(primaryColor: Color(0xFF7f70f5), fontFamily: 'Quicksand');


class SettingsScreen extends StatefulWidget {
  @override
  SettingsScreenState createState() {
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            getListView(),
          ],
        ),
      ),
    );
  }
}

Widget getListView() {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 30.0,
      ),
      Container(
        alignment: Alignment.center,
        child: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: firstColor,
                width: 2.0,
                style: BorderStyle.solid
            ),
//            image: DecorationImage(
//                fit: BoxFit.fill,
//                image: AssetImage('images/portrait.png')
//            ),
          ),
        ),
      ),
      Container(
        child: Text(
          'Velkommen, Navn',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.info,
          color: firstColor,
        ),
        title: Text('Fulde Navn'),
        subtitle: Text('Malthe Have Musaeus'),
        trailing: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        onTap: () {},
      ),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.portrait,
          color: firstColor,
        ),
        title: Text('Køn'),
        subtitle: Text('Mand'),
        trailing: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        onTap: () {},
      ),
      Divider(),
      ListTile(
        leading: Icon(
          Icons.date_range,
          color: firstColor,
        ),
        title: Text('Fødsels Dato'),
        subtitle: Text('17-12-01'),
        trailing: Icon(
          Icons.edit,
          color: Colors.black,
        ),
        onTap: () {},
      ),
    ],
  );
}
