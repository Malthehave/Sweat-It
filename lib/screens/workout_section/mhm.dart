import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class videoHome extends StatefulWidget {
  @override
  _workoutHomeState createState() => _workoutHomeState();
}

class _workoutHomeState extends State<videoHome> {
  VideoPlayerController _controller;


  @override
  void initState() {
    super.initState();
//    _controller = VideoPlayerController.network('https://www.youtube.com/watch?v=re73_NplVlc')
    _controller = VideoPlayerController.asset('assets/videos/mobile.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.redAccent,
//      backgroundColor: secondColor,
      title: Center(child: Text('Sweat It'),),
    ),
    body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Stack(
                            children: <Widget>[
                              Align(
                                child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.redAccent,
                                          width: 4.0
                                        )
                                    ),
                                    height: _controller.value.isPlaying ? 500.0 : 500.0,
                                    child: _controller.value.initialized
                                        ? AspectRatio(
                                      aspectRatio: _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    )
                                        : Container(),
                                  ),
                                ),
                              ),
//                              Align(
//                                alignment: Alignment.bottomCenter,
//                                child: Container(
//                                  height: 250.0,
//                                  child: IconButton(
//                                    iconSize: 44.0,
//                                      onPressed: () {
//                                        setState(() {
//                                          _controller.value.isPlaying
//                                              ? _controller.pause()
//                                              : _controller.play();
//                                        });
//                                      },
//                                      icon: Icon(
//                                        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                                        color: Colors.redAccent,
//                                      ),
//                                  )
//                                ),
//                              ),

                            ],
                        )
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: Text(
                        'Overskrift',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                      child: Text("beer.note"),
                    ),
                    Divider(height: 10.0, indent: 35.0,),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: Text(
                        'Under overskrift',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                      child: Text("Beer.word",),
                    ),
                    Container(
                      color: Colors.redAccent.withAlpha(120),
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
                            child: Text(
                              'Reklame',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.body2.copyWith(
                                  color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                            child: Text("beer.foodMatch",
                              style: TextStyle(
                                  color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Beer.title", style: Theme.of(context).textTheme.body1,),
                          Text('Her kan der stå tid', style: Theme.of(context).textTheme.subhead.copyWith(fontWeight: FontWeight.w500),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

      ],
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
//          openAlertBox(context, _controller);
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),

    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


}


openAlertBox(BuildContext context, VideoPlayerController _controller) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          contentPadding: EdgeInsets.only(top: 2.0),
          content: Container(
            height: 250,
//            width: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
//                height: _controller.value.isPlaying ? 250.0 : 0.0,
                  child: _controller.value.initialized
                      ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                      : Container(),
                ),
                InkWell(
                  child: Container(
//                    padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(14.0),
                            bottomRight: Radius.circular(14.0)),
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