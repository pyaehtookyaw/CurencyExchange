import 'package:CurrencyExChange/pages/aya.dart';
import 'package:CurrencyExChange/pages/cb.dart';
import 'package:CurrencyExChange/pages/kbz.dart';
import 'package:CurrencyExChange/pages/test.dart';
import 'package:CurrencyExChange/pages/yoma.dart';
import 'package:CurrencyExChange/pages/shwe.dart';
import 'package:division/division.dart';
import 'package:flutter/material.dart';

class BankListPage extends StatefulWidget {
  @override
  _BankListPageState createState() => _BankListPageState();
}

class _BankListPageState extends State<BankListPage> {
  final StyleClass settingsItemIconStyle = StyleClass()
    ..padding(all: 8)
    ..borderRadius(all: 30);

  String checklang = '';
  List textEng = [
    "KBZ Bank",
    "CB Bank",
    "AYA Bank",
    "YOMA Bank",
    "Shwe Bank",
    "AGD Bank",
    "MTB Bank"
  ];

  List textMyan = [
    "KBZ Bank",
    "CB Bank",
    "AYA Bank",
    "YOMA Bank",
    "Shwe Bank",
    "AGD Bank",
    "MTB Bank"
  ];

  @override
  void initState() {
    //checkLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Home"),
        title: Text(
          "Bank List",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
        centerTitle: true,
        textTheme: Theme.of(context).textTheme,
      ),
      body: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                //flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //SizedBox(height: 30.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => KbzPage()),
                        );
                      },
                      child: Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              (checklang == "Eng") ? textEng[0] : textMyan[0],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18),
                            ),
                            leading: Division(
                              style: StyleClass()
                                ..backgroundColor("#FDB78B")
                                ..add(settingsItemIconStyle),
                              child: Icon(
                                Icons.people,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          elevation: 1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CbPage()),
                        );
                      },
                      child: Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              (checklang == "Eng") ? textEng[1] : textMyan[1],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18),
                            ),
                            leading: Division(
                              style: StyleClass()
                                ..backgroundColor("#9F6083")
                                ..add(settingsItemIconStyle),
                              child: Icon(
                                Icons.add_box_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          elevation: 1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AyaPage()),
                        );
                      },
                      child: Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              (checklang == "Eng") ? textEng[2] : textMyan[2],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18),
                            ),
                            leading: Division(
                              style: StyleClass()
                                ..backgroundColor("#57CFE2")
                                ..add(settingsItemIconStyle),
                              child: Icon(
                                Icons.language,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          elevation: 1,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Container(
                    //     child: Card(
                    //       child: ListTile(
                    //         title: Text(
                    //           "Credit Cards",
                    //           style: TextStyle(
                    //               color: Colors.black.withOpacity(0.7), fontSize: 18),
                    //         ),
                    //         leading: Division(
                    //           style: StyleClass()
                    //             ..backgroundColor("#606B7E")
                    //             ..add(settingsItemIconStyle),
                    //           child: Icon(
                    //             Feather.getIconData("credit-card"),
                    //             color: Colors.white,
                    //             size: 20,
                    //           ),
                    //         ),
                    //       ),
                    //       elevation: 1,
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => YomaPage()),
                        );
                      },
                      child: Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              (checklang == "Eng") ? textEng[3] : textMyan[3],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18),
                            ),
                            leading: Division(
                              style: StyleClass()
                                ..backgroundColor("#24ACE9")
                                ..add(settingsItemIconStyle),
                              child: Icon(
                                Icons.help,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          elevation: 1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShwePage()),
                        );
                      },
                      child: Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              (checklang == "Eng") ? textEng[4] : textMyan[4],
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18),
                            ),
                            leading: Division(
                              style: StyleClass()
                                ..backgroundColor("#24ACE9")
                                ..add(settingsItemIconStyle),
                              child: Icon(
                                Icons.help,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          elevation: 1,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TestPage()),
                        );
                      },
                      child: Container(
                        child: Card(
                          child: ListTile(
                            title: Text(
                              "Test",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 18),
                            ),
                            leading: Division(
                              style: StyleClass()
                                ..backgroundColor("#24ACE9")
                                ..add(settingsItemIconStyle),
                              child: Icon(
                                Icons.help,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          elevation: 1,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     //SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    //   },
                    //   child: Container(
                    //     child: Card(
                    //       child: ListTile(
                    //         title: Text(
                    //           "Exit",
                    //           style: TextStyle(
                    //               color: Colors.black.withOpacity(0.7), fontSize: 18),
                    //         ),
                    //         leading: Division(
                    //           style: StyleClass()
                    //             ..backgroundColor("#FB7C7A")
                    //             ..add(settingsItemIconStyle),
                    //           child: Icon(
                    //             Feather.getIconData("log-out"),
                    //             color: Colors.white,
                    //             size: 20,
                    //           ),
                    //         ),
                    //       ),
                    //       elevation: 1,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
