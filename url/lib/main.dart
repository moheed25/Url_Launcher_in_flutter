import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "url app",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

Future<void> CALL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "cannot launch $url";
  }
}

launchurl() async {
  const url = 'https://www.youtube.com/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "cannot launch $url";
  }
}

launchEmail() async {
  launch(
    'mailto:cp277478@gmail.com?subject=TestEmail&body= Subscribe webfun please',
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text(
          'URL Launcher',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              padding: EdgeInsets.only(left: 10, right: 10),
              onPressed: () {
                CALL("tel:9096141591");
              },
              color: Colors.indigo[900],
              child: Text(
                "Call",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.only(left: 10, right: 10),
              onPressed: launchurl,
              color: Colors.indigo[900],
              child: Text(
                "Launch url",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.only(left: 10, right: 10),
              onPressed: launchEmail,
              color: Colors.indigo[900],
              child: Text(
                "Email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
