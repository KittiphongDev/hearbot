import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DescripeWidget extends StatefulWidget {
  const DescripeWidget({super.key});

  @override
  State<DescripeWidget> createState() => _DescripeWidgetState();
}

class _DescripeWidgetState extends State<DescripeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String righttext = '', lefttext = ''; // Declare the text variables here

  @override
  void initState() {
    super.initState();
    loadData(); // Call loadData when the widget is initialized
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
                'assets/images/Descripebg.png',
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
                                onTap: () async {
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  'assets/images/scrpiticon.png',
                                  width: 30,
                                  height: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Result',
                                style: GoogleFonts.readexPro(
                                  fontSize: 25,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(80, 0, 0, 0),
                              child: Text(
                                'Testing',
                                style: GoogleFonts.readexPro(
                                  fontSize: 22,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w200,
                                  fontStyle: FontStyle.italic,
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
                              'assets/images/smallwave.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/centeredear.png',
                              width: 170,
                              height: 230,
                              fit: BoxFit.contain,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/smallwave.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 15),
                            child: Text(
                              'Description',
                              style: GoogleFonts.readexPro(
                                fontSize: 20,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
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
                              'Right :',
                              style: GoogleFonts.readexPro(
                                fontSize: 16,
                                letterSpacing: 0.0,
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
                              width: 280,
                              height: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              alignment: AlignmentDirectional(0, -1),
                              child: Text(
                                righttext,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.readexPro(
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 290,
                        child: Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
                            child: Text(
                              'Left :',
                              style: GoogleFonts.readexPro(
                                fontSize: 16,
                                letterSpacing: 0.0,
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
                              width: 280,
                              height: 115,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              alignment: AlignmentDirectional(0, -1),
                              child: Text(
                                lefttext,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.readexPro(
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w300,
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
    int? rhstate = prefs.getInt('rhstate');
    int? lhstate = prefs.getInt('lhstate');

    if (rhstate != null && lhstate != null) {
      _settext(rhstate, lhstate); // Now _settext will be called after data is loaded
    }
  }

  void _settext(int rhstate, int lhstate) {
    if (rhstate == 1) {
      setState(() {
        righttext = 'Can hear very soft sounds like breathing or leaves rustling. No special care is needed since this is a safe level of sound.';
      });
    } else if (rhstate == 2) {
      setState(() {
        righttext = 'Can hear whispers or soft speech in quiet places. If you have mild hearing loss, it may be hard to hear in noisy places, so try to find a quiet area to help hear better.';
      });
    } else if (rhstate == 3) {
      setState(() {
        righttext = 'Has trouble hearing normal conversation, especially with background noise. Try to avoid noisy areas, and you might need a hearing aid to hear better.';
      });
    } else if (rhstate == 4) {
      setState(() {
        righttext = 'It’s hard to hear normal speech even in quiet places. Use louder speech to help others hear you clearly. Avoid being in loud environments for too long and consider using a hearing aid.';
      });
    } else if (rhstate == 5) {
      setState(() {
        righttext = 'Even loud speech or TV sounds may be hard to hear. You’ll need hearing aids or other devices to help in some situations. Stay away from places with very loud sounds, like concerts, to protect your hearing.';
      });
    } else if (rhstate == 6) {
      setState(() {
        righttext = 'You may only hear very loud sounds, like alarms. Even with hearing aids, it can be hard to understand speech. Avoid very loud environments, and use hearing protection if exposed to sounds above 100 dB.';
      });
    }

    if (lhstate == 1) {
      setState(() {
        lefttext = 'Can hear very soft sounds like breathing or leaves rustling. No special care is needed since this is a safe level of sound.';
      });
    } else if (lhstate == 2) {
      setState(() {
        lefttext = 'Can hear whispers or soft speech in quiet places. If you have mild hearing loss, it may be hard to hear in noisy places, so try to find a quiet area to help hear better.';
      });
    } else if (lhstate == 3) {
      setState(() {
        lefttext = 'Has trouble hearing normal conversation, especially with background noise. Try to avoid noisy areas, and you might need a hearing aid to hear better.';
      });
    } else if (lhstate == 4) {
      setState(() {
        lefttext = 'It’s hard to hear normal speech even in quiet places. Use louder speech to help others hear you clearly. Avoid being in loud environments for too long and consider using a hearing aid.';
      });
    } else if (lhstate == 5) {
      setState(() {
        lefttext = 'Even loud speech or TV sounds may be hard to hear. You’ll need hearing aids or other devices to help in some situations. Stay away from places with very loud sounds, like concerts, to protect your hearing.';
      });
    } else if (lhstate == 6) {
      setState(() {
        lefttext = 'You may only hear very loud sounds, like alarms. Even with hearing aids, it can be hard to understand speech. Avoid very loud environments, and use hearing protection if exposed to sounds above 100 dB.';
      });
    }
  }
}
