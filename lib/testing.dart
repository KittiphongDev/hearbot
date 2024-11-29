import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart'; // Import for Timer

class TestingWidget extends StatefulWidget {
  const TestingWidget({super.key});


  @override
  State<TestingWidget> createState() => _TestingWidgetState();
}


class _TestingWidgetState extends State<TestingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false; // To track whether the sound is playing or stopped
  List<int> right = [0, 0, 0, 0, 0];
  List<int> left = [0, 0, 0, 0, 0];
  List<String> all_rightavg = [],all_leftavg = [],avgrhstate = [],avglhstate=[];
  int leftround = 1,rightround = 1;
  int rightavg = 0,leftavg = 0;
  int rhstate = 0,lhstate = 0;
  Timer? _timer; // Timer to track elapsed time
  int _elapsedTime = 0; // Track the elapsed time in seconds

  // Variables to hold the text for both buttons
  String rightButtonText = '';
  String leftButtonText = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      rightButtonText = '1st Round';
      leftButtonText = '1st Round';
      right = [0, 0, 0, 0, 0];
      left = [0, 0, 0, 0, 0];
      leftround = 1;
      rightround = 1;
    });
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/testbg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Top Row with Back Button
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Container(
                              width: 40,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(context, 'menu');
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.black,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Title Row with Volume Image and "Sound Waves"
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  'assets/images/Volume.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Sound waves',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Subtitle Row with "Testing"
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                              child: Text(
                                'Testing',
                                style: TextStyle(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w200,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Sound Waves Image
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/waves.png',
                            width: 400,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Right Text Row
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: Text(
                              'Right :',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 1st Round Button (Right)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _playSoundRight(); // Play sound when container is tapped
                              },
                              child: Container(
                                width: 280,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                  child: Text(
                                    rightButtonText, // Use dynamic text for the right button
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFFFEFFFF),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Left Text Row
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: Text(
                              'Left :',
                              style: TextStyle(
                                fontFamily: 'Readex Pro',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // 2nd Round Button (Left)
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _playSoundLeft(); // Play sound when container is tapped
                              },
                              child: Container(
                                width: 280,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                alignment: AlignmentDirectional(-1, 0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                  child: Text(
                                    leftButtonText, // Use dynamic text for the left button
                                    style: TextStyle(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFFFEFFFF),
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Bottom Row with Delete, Record, and Upload Icons
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _resettest(); //reset all test
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/delete.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 0),
                              child: GestureDetector(
                                onTap: () {
                                  _stopSound(); // Stop the sound
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/record.png',
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _calculate();
                                saveData(rhstate,lhstate);
                                Navigator.pushNamed(context, 'descripe');
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/upload.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? all_rightavg = prefs.getStringList('all_rightavg');
    List<String>? all_leftavg = prefs.getStringList('all_leftavg');
    List<String>? avgrhstate = prefs.getStringList('avgrhstate');
    List<String>? avglhstate = prefs.getStringList('avglhstate');
  }
  // Method to play right sound and update button text
  Future<void> _playSoundRight() async {
    setState(() {
      rightButtonText = 'Playing Sound...'; // Update button text
    });

    // Play right sound and start a timer
    await _audioPlayer.play(AssetSource('sounds/wavesoundtest.mp3'));
    _startTimerRight();
  }

  // Method to play left sound and update button text
  Future<void> _playSoundLeft() async {
    setState(() {
      leftButtonText = 'Playing Sound...'; // Update button text
    });

    // Play left sound and start a timer
    await _audioPlayer.play(AssetSource('sounds/wavesoundtest.mp3'));
    _startTimerLeft();
  }

  // Method to stop sound and update button text
  Future<void> _stopSound() async {
    await _audioPlayer.stop();
    setState(() {
      //left
      if(leftround<=5){
        if (left[(leftround-1)] != 0) {
          leftround++;
        }
      }
      if (leftround > 5) {
        leftButtonText = 'Test Completed';
      }
      else if (left[(leftround-1)] == 0) {
        leftButtonText = '$leftround${leftround == 1 ? 'st' : leftround == 2 ? 'nd' : leftround == 3 ? 'rd' : 'th'} Round';
      }

      //right
      if(rightround<=5) {
        if (right[(rightround - 1)] != 0) {
          rightround++;
        }
      }
      if (rightround > 5) {
        rightButtonText = 'Test Completed';
      }
      else if (right[(rightround - 1)] == 0) {
        rightButtonText = '$rightround${rightround == 1 ? 'st' : rightround == 2 ? 'nd' : rightround == 3 ? 'rd' : 'th'} Round';
      }
      print('Right : $right Left : $left');
    });

    _timer?.cancel(); // Stop the timer
    setState(() {
      _elapsedTime = 0; // Reset elapsed time
    });
  }

  // Start a timer to update the elapsed time
  void _startTimerRight() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
        if (_elapsedTime > 40) {
          _elapsedTime = 40;
        }
        if (rightround < 6) {
          right[rightround - 1] = _elapsedTime;
        }
      });
    });
  }

  void _startTimerLeft() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedTime++;
        if (_elapsedTime > 40) {
          _elapsedTime = 40;
        }
        if (leftround < 6) {
          left[leftround - 1] = _elapsedTime;
        }
      });
    });
  }

  void _resettest() {
    setState(() {
      rightButtonText = '1st Round';
      leftButtonText = '1st Round';
      right = [0, 0, 0, 0, 0];
      left = [0, 0, 0, 0, 0];
      rightround = 1;
      leftround = 1;
    });
  }

  //calculate part
  void _calculate(){
    rightavg = ((right[0]+right[1]+right[2]+right[3]+right[4])~/5) as int;
    leftavg = ((left[0]+left[1]+left[2]+left[3]+left[4])~/5) as int;
    _rightcal();
    _leftcal();
  }

  void _rightcal(){
    if (rightavg<=4){
      rhstate = 6;
    }
    else if(rightavg <=12){
      rhstate = 5;
    }
    else if(rightavg <=18){
      rhstate = 4;
    }
    else if(rightavg <=24){
      rhstate = 3;
    }
    else if(rightavg <=32){
      rhstate = 2;
    }
    else if(rightavg <=40){
      rhstate = 1;
    }
    all_rightavg.add(rightavg.toString());
    avgrhstate.add(rhstate.toString());
  }

  void _leftcal(){
    if (leftavg <= 4) {
      lhstate = 6;
    } else if (leftavg <= 12) {
      lhstate = 5;
    } else if (leftavg <= 18) {
      lhstate = 4;
    } else if (leftavg <= 24) {
      lhstate = 3;
    } else if (leftavg <= 32) {
      lhstate = 2;
    } else if (leftavg <= 40) {
      lhstate = 1;
    }
    all_leftavg.add(leftavg.toString());
    avglhstate.add(lhstate.toString());
  }

  Future<void> saveData(int rhstate, int lhstate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('rhstate', rhstate);
    prefs.setInt('lhstate', lhstate);
    prefs.setStringList('all_rightavg', all_rightavg);
    prefs.setStringList('all_leftavg', all_leftavg);
    prefs.setStringList('avgrhstate', avgrhstate);
    prefs.setStringList('avglhstate', avglhstate);
  }
}
