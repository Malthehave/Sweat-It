import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Color firstColor = Color(0xFF7f70f5);
Color secondColor = Color(0xFF0ea0ff);


class videoOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: Icon(Icons.keyboard_backspace, color: Colors.white,),
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
      //      floatingActionButton: FloatingActionButton(
//        heroTag: 'btn2',
//        onPressed: null,
//        child: Icon(Icons.airline_seat_legroom_extra),
//      ),
      backgroundColor: Colors.white.withOpacity(0.85), // this is the main reason of transparency at next screen. I am ignoring rest implementation but what i have achieved is you can see.
      body: Container(
        child: video(),
      ),
    );
  }
}


class video extends StatefulWidget {
  @override
  _videoState createState() => _videoState();
}

class _videoState extends State<video> {

  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
//    _controller = VideoPlayerController.network('https://www.youtube.com/watch?v=re73_NplVlc')
    _controller = VideoPlayerController.network('https://firebasestorage.googleapis.com/v0/b/flipay-13-01-19.appspot.com/o/mobile.mp4?alt=media&token=1f595a9d-76cf-42e9-828a-476db22fff0b')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: firstColor,
                      width: 4.0
                  )
              ),
              height: _controller.value.isPlaying ? 500.0 : 500.0,
              child: _controller.value.initialized ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : Container(),
            ),
          ),
        ),
      ],
    );


//      floatingActionButton: FloatingActionButton(
//        heroTag: 'fisse',
//        onPressed: () {
////          openAlertBox(context, _controller);
//          setState(() {
//            _controller.value.isPlaying
//                ? _controller.pause()
//                : _controller.play();
//          });
//        },
//        child: Icon(
//          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//        ),
//      ),

  }
}


