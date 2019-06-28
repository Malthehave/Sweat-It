import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:sweat_it/screens/workout_section/video.dart';
import 'package:sweat_it/screens/workout_section/mhm.dart';


Color firstColor = Color(0xFF7f70f5);
Color secondColor = Color(0xFF0ea0ff);


class workoutHome extends StatefulWidget {
  @override
  _workoutHomeState createState() => _workoutHomeState();
}

class _workoutHomeState extends State<workoutHome> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
//          backgroundColor: Colors.white,
        accentColor: firstColor,
        brightness: Brightness.light,
        fontFamily: 'Quicksand',
      ),
      child: Scaffold(
//          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        appBar: PreferredSize(
          child: Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    left: 10.0,
                    top: 10.0,
                    bottom: 10.0
                ),
                child: Row(
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: firstColor,
                      mini: true,
                      onPressed: () => Navigator.pop(context),
                      child: Icon(Icons.keyboard_backspace),
                      elevation: 1.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Sweat It',
                      style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white
                      ),
                    ),
                  ],
                )
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      firstColor,
                      secondColor,
                    ]
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  )
                ]
            ),
          ),
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            100.0,
          ),
        ),

        body: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                    child: ExpansionTile(
                      trailing: Icon(Icons.expand_more, color: Colors.black, size: 30.0),
                      title: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                            padding: EdgeInsets.only(right: 12.0),
                            decoration: BoxDecoration(
                              border: Border(right: BorderSide(width: 1.0, color: Colors.grey)),
                            ),
                            child: CachedNetworkImage(
                                    imageUrl: 'https://i.pinimg.com/originals/c5/1c/2d/c51c2d47047f5a08e6ac43bb6944abf6.png',
                                    width: 35.0,
                                  ),
                        ),
                        title: Row(
                          children: <Widget>[
                            Text(
                              "Ben Træning",
                              style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0,
                              ),
                            ),
                            Icon(Icons.crop_square, color: Color(0xFF7f70f5), size: 22.0,),
//                            Icon(Icons.check_box, color: Color(0xFF7f70f5), size: 20.0,),
                          ],
                        ),
                        subtitle: Row(
                            children: <Widget>[
                              Icon(Icons.watch_later, color: Color(0xFF7f70f5), size: 20.0,),
                              Padding(padding: EdgeInsets.only(right: 4.0)),
                              Text("15 Min.", style: TextStyle(color: Colors.black)),
                            ],
                        )
//                          trailing: Icon(Icons.check, color: Colors.black, size: 18.0)
                      ),
                      children: <Widget>[
//                        Divider(height: 35.0, color: Colors.grey,),
                        Container(
                            padding: EdgeInsets.all(10.0),
//                          decoration: BoxDecoration(
//                            border: Border(top: BorderSide(width: 0.5, color: Colors.grey)),
//                          ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Whether you think you can or you think you can't, you're right. Nummer: $index",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    width: 44.0,
                                    child: FloatingActionButton(
                                      heroTag: 'btn1',
                                      tooltip: "Afspil Workout",
                                      backgroundColor: firstColor,
                                      child: Icon(Icons.play_arrow, size: 24.0,),
                                      onPressed: () {
                                        Navigator.of(context).push(PageRouteBuilder(
                                            opaque: false,
                                            pageBuilder: (BuildContext context, _, __) => videoOverlay()
                                        ),);
                                      },
//                                        onPressed: () {
//                                          Navigator.push(
//                                            context,
//                                            MaterialPageRoute(builder: (context) => videoHome()),
//                                          );
//                                        }
                                    ),
                                  ),
                                )
                              ],
                            )
                        )
                      ],
                    )
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}



