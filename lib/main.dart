import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';
// ignore: import_of_legacy_library_into_null_safe

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.green),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  _callNumber() async {
    const number = '+917012869839';
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  //
  sendMessage() async {
    if (Platform.isAndroid) {
      //FOR Android
      var url = 'sms:+7012869839?body=message';
      await launch(url);
    }
  }

  sendMail() async {
    //FOR Android
    var url = 'mailto:akhilkccpy@gmail.com';
    await launch(url);
  }

//
  static const String _url = 'https://flutter.dev';
  static const String _url1 = 'https://www.radioindia.in/club-fm-uae';
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }

  void _launchURL1() async {
    if (!await launch(_url1)) throw 'Could not launch $_url1';
  }

  late File imageFile;
  _getFromCamera() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF55CA58),
          title: const Center(
              child: Text(
            'Smart Glove Assist',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat',
                color: Colors.black),
          )),
          titleSpacing: 20,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.fromSize(
                          size: Size(70, 70), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF55CA58), // button color
                              child: InkWell(
                                splashColor: Color.fromARGB(
                                    255, 236, 164, 56), // splash color
                                onTap: _callNumber, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.call), // icon
                                    Text("Call"), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(70, 70), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF55CA58), // button color
                              child: InkWell(
                                splashColor: Color.fromARGB(
                                    255, 236, 164, 56), // splash color
                                onTap: sendMessage, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.chat_sharp), // icon
                                    Text("Message"), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(70, 70), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF55CA58), // button color
                              child: InkWell(
                                splashColor: const Color.fromARGB(
                                    255, 236, 164, 56), // splash color
                                onTap: sendMail, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.email_rounded), // icon
                                    Text("Email"), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.fromSize(
                          size: Size(70, 70), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF55CA58), // button color
                              child: InkWell(
                                splashColor: Color.fromARGB(
                                    255, 236, 164, 56), // splash color
                                onTap: _launchURL1, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.radio), // icon
                                    Text("Radio"), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(70, 70), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF55CA58), // button color
                              child: InkWell(
                                splashColor: Color.fromARGB(
                                    255, 236, 164, 56), // splash color
                                onTap: _getFromCamera, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(Icons.add_a_photo), // icon
                                    Text("Camera"), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(70, 70), // button width and height
                          child: ClipOval(
                            child: Material(
                              color: Color(0xFF55CA58), // button color
                              child: InkWell(
                                splashColor: const Color.fromARGB(
                                    255, 236, 164, 56), // splash color
                                onTap: _launchURL, // button pressed
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const <Widget>[
                                    Icon(
                                        Icons.browser_updated_outlined), // icon
                                    Text("Browse"), // text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    SizedBox.fromSize(
                      size: Size(80, 80), // button width and height
                      child: ClipOval(
                        child: Material(
                          color: Color(0xFF55CA58), // button color
                          child: InkWell(
                            splashColor: const Color.fromARGB(
                                255, 236, 164, 56), // splash color
                            onTap: () {}, // button pressed
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const <Widget>[
                                Icon(Icons.health_and_safety_rounded), // icon
                                Text("Pulse"), // text
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
