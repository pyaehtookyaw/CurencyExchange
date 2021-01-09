import 'dart:async';
import 'package:CurrencyExChange/pages/google_navbar.dart';
import 'package:flutter/material.dart';

class MainSplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MainSplashScreen> {
  @override
  void initState() {
    super.initState();
    splash();
  }

  splash() async {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => GoogleMenu()));
    });

    // if (userID != "" || userID != null || profileData != "" || profileData != null) {
    //    Timer(Duration(seconds: 2), () {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => GoogleMenu()));
    //   });
    // } else {
    //   Timer(Duration(seconds: 2), () {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => ContinueWithPhone()));
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        // child: Icon(
                        //   Icons.shopping_cart,
                        //   color: Colors.greenAccent,
                        //   size: 50.0,
                        // ),
                        child: Image.asset(
                          'assets/images/currency.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        "Currency Rate Myanmar",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //CircularProgressIndicator(),
                    Container(
                      child: Image.asset(
                        'assets/images/loading4.gif',
                        color: Colors.green,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "Currency Rate Look For Everyone",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.green),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
