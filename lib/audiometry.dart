import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

class AudiometryWidget extends StatefulWidget {
  const AudiometryWidget({super.key});

  @override
  State<AudiometryWidget> createState() => _AudiometryWidgetState();
}

class _AudiometryWidgetState extends State<AudiometryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String rightstate_text = '', leftstate_text = '',rightdbtext ='',leftdbtext = '';
  int rightavgsum = 0,leftavgsum = 0;

  @override
  void initState() {
    super.initState();
    loadData(); // Call loadData when the widget is initialized
  }

  @override
  void dispose() {
    super.dispose();
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
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/audiobg.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                            child: Container(
                              width: 40,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25),
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
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
                                  Navigator.pushNamed(context, 'menu');  // Replaced with Navigator
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  'assets/images/headphone.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Pure-Tone Audiometry',
                                style: GoogleFonts.readexPro(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/graph.png',
                              width: 300,
                              height: 230,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 60, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/marker.png',
                                width: 100,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: Text(
                              'Average',
                              style: GoogleFonts.readexPro(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              alignment: AlignmentDirectional(0, -1),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Right ear :',
                                        style: GoogleFonts.readexPro(),
                                      ),
                                      Text(
                                        'Left ear :',
                                        style: GoogleFonts.readexPro(),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          rightdbtext,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.readexPro(),
                                        ),
                                        Text(
                                          leftdbtext,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.readexPro(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 310,
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 20, 0, 0),
                            child: Text(
                              'Degree of hearing',
                              style: GoogleFonts.readexPro(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 310,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              alignment: AlignmentDirectional(0, -1),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Right ear :',
                                        style: GoogleFonts.readexPro(),
                                      ),
                                      Text(
                                        'Left ear :',
                                        style: GoogleFonts.readexPro(),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          rightstate_text,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.readexPro(),
                                        ),
                                        Text(
                                          leftstate_text,
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.readexPro(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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

    if (avgrhstate != null && avglhstate != null) {
      calculateavg(avgrhstate,avglhstate);
    }
    if (all_rightavg != null && all_leftavg != null) {
      calculatedb(all_rightavg,all_leftavg);
    }
  }

  void _settext(avgrhstate,avglhstate) {
    if (avgrhstate == 1) {
      setState(() {
        rightstate_text = 'Normal Hearing';
      });
    } else if (avgrhstate == 2) {
      setState(() {
        rightstate_text = 'Soft Sounds';
      });
    } else if (avgrhstate == 3) {
      setState(() {
        rightstate_text = 'Moderate Hearing Loss';
      });
    } else if (avgrhstate == 4) {
      setState(() {
        rightstate_text = 'Moderate to Severe Hearing Loss';
      });
    } else if (avgrhstate == 5) {
      setState(() {
        rightstate_text = 'Severe Hearing Loss';
      });
    } else if (avgrhstate == 6) {
      setState(() {
        rightstate_text = 'Profound Hearing Loss';
      });
    }

    if (avglhstate == 1) {
      setState(() {
        leftstate_text = 'Normal Hearing';
      });
    } else if (avglhstate == 2) {
      setState(() {
        leftstate_text = 'Soft Sounds';
      });
    } else if (avglhstate == 3) {
      setState(() {
        leftstate_text = 'Moderate Hearing Loss';
      });
    } else if (avglhstate == 4) {
      setState(() {
        leftstate_text = 'Moderate to Severe Hearing Loss';
      });
    } else if (avglhstate == 5) {
      setState(() {
        leftstate_text = 'Severe Hearing Loss';
      });
    } else if (avglhstate == 6) {
      setState(() {
        leftstate_text = 'Profound Hearing Loss';
      });
    }
  }

  void calculateavg(avgrhstate,avglhstate) {
    for (String i in avgrhstate) {
      rightavgsum += int.parse(i);
    }
    rightavgsum = rightavgsum ~/ avgrhstate.length as int;
    for (String i in avglhstate) {
      leftavgsum += int.parse(i);
    }
    leftavgsum = leftavgsum ~/ avglhstate.length as int;
    _settext(rightavgsum,leftavgsum);
  }

  void calculatedb(all_rightavg,all_leftavg) {
    for (String i in all_rightavg) {
      rightavgsum += int.parse(i);
    }
    rightavgsum = ((rightavgsum*2.5).round() / all_rightavg.length).round();
    for (String i in all_leftavg) {
      leftavgsum += int.parse(i);
    }
    leftavgsum = ((leftavgsum*2.5).round() / all_leftavg.length).round();
    _settextdb(rightavgsum,leftavgsum);
  }

  void _settextdb(rightavgsum,leftavgsum){
    if (rightavgsum>=80){
      rightavgsum = 100 - rightavgsum;
      rightdbtext = '$rightavgsum  dB (Normal)';
    }
    else if(rightavgsum >=60){
      rightavgsum = 100 - rightavgsum;
      rightdbtext = '$rightavgsum  dB (Normal)';
    }
    else if(rightavgsum >=45){
      rightavgsum = 100 - rightavgsum;
      rightdbtext = '$rightavgsum  dB (Abnormal)';
    }
    else if(rightavgsum >=30){
      rightavgsum = 100 - rightavgsum;
      rightdbtext = '$rightavgsum  dB (Abnormal)';
    }
    else if(rightavgsum >=10){
      rightavgsum = 100 - rightavgsum;
      rightdbtext = '$rightavgsum  dB (Abnormal)';
    }
    else if(rightavgsum >=0){
      rightavgsum = 100 - rightavgsum;
      rightdbtext = '$rightavgsum  dB (Abnormal)';
    }

    if (leftavgsum>=80){
      leftavgsum = 100 - leftavgsum;
      leftdbtext = '$leftavgsum  dB (Normal)';
    }
    else if(leftavgsum >=60){
      leftavgsum = 100 - leftavgsum;
      leftdbtext = '$leftavgsum  dB (Normal)';
    }
    else if(leftavgsum >=45){
      leftavgsum = 100 - leftavgsum;
      leftdbtext = '$leftavgsum  dB (Abnormal)';
    }
    else if(leftavgsum >=30){
      leftavgsum = 100 - leftavgsum;
      leftdbtext = '$leftavgsum  dB (Abnormal)';
    }
    else if(leftavgsum >=10){
      leftavgsum = 100 - leftavgsum;
      leftdbtext = '$leftavgsum  dB (Abnormal)';
    }
    else if(leftavgsum >=0){
      leftavgsum = 100 - leftavgsum;
      leftdbtext = '$leftavgsum  dB (Abnormal)';
    }
  }
}
