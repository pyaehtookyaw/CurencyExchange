import 'dart:async';
import 'dart:convert';

import 'package:CurrencyExChange/pages/google_navbar.dart';
import 'package:CurrencyExChange/pages/home.dart';
import 'package:CurrencyExChange/providers/central_bank.dart';
import 'package:CurrencyExChange/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

// void main() => runApp(MyApp());
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: CentralBankRateProvider()),
          // Provider<NetworkProvider>(
          //   create: (context) => NetworkProvider(),
          //   dispose: (context, service) => service.disposeStreams(),
          // ),
        ],
        child: MaterialApp(
          title: 'Currency Rate Myanmar',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: MainSplashScreen(),
        ));
  }
}
