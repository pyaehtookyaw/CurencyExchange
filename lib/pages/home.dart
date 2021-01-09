import 'package:CurrencyExChange/global/loading.dart';
import 'package:CurrencyExChange/providers/central_bank.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_scraper/web_scraper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  Map rates;
  // List rates = [];
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  checkUser() async {
    isLoading = true;
    Provider.of<CentralBankRateProvider>(context, listen: false)
        .getCurrencyRate()
        .then((value) {
      setState(() {
        isLoading = false;
      });
      print("My get data");
      print(value);
      rates = value["rates"];
      // for (var row in value) {
      //     setState(() {
      //       rates.add(row);
      //     });
      //   }

      print(rates);
    }, onError: (error) {
      setState(() {
        isLoading = false;
      });
      print("My error");
      print(error.toString());
      //snackbarfalse(error.toString());
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      print("My Catch Error");
      print(error.toString());
      //snackbarfalse(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var _body = new ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: EdgeInsets.all(5.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        // Image(
                        //   image: AssetImage('icon/USD.png'),
                        //   width: 50,
                        //   // height: 50,
                        // ),
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/USD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/EUR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 EUR - ${rates["EUR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/SGD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 SGD - ${rates["SGD"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/CNY.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 CNY - ${rates["CNY"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/JPY.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 JPY - ${rates["JPY"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/THB.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 THB - ${rates["THB"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/EGP.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 EGP - ${rates["EGP"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/AUD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 AUD - ${rates["AUD"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/ZAR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 ZAR - ${rates["ZAR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/DKK.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 DKK - ${rates["DKK"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/NPR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 NPR - ${rates["NPR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/EGP.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 PKR - ${rates["EGP"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/KES.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 KES - ${rates["KES"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/INR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 INR - ${rates["INR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/BND.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 BND - ${rates["BND"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/CHF.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 CHF -${rates["CHF"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/LAK.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 LAK - ${rates["LAK"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/SAR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 SAR - ${rates["SAR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/LKR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 LKR - ${rates["LKR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/GBP.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 GBP - ${rates["GBP"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/CAD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 CAD - ${rates["CAD"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/SEK.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 SEK - ${rates["SEK"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/EGP.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 CZK - ${rates["EGP"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/RUB.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 RUB - ${rates["RUB"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/PHP.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 PHP - ${rates["PHP"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/HKD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 HKD - ${rates["HKD"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/NZD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 NZD - ${rates["NZD"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/BDT.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 BDT - ${rates["BDT"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/VND.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 VND - ${rates["VND"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/KHR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 KHR - ${rates["KHR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/IDR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 IDR - ${rates["IDR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/MYR.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 MYR - ${rates["MYR"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/RSD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 RSD - ${rates["RSD"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/KRW.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 KRW - ${rates["KRW"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/NOK.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 NOK - ${rates["NOK"]} MKK", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/KWD.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 KWD - ${rates["KWD"]} MKK", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/BRL.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 BRL - ${rates["BRL"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/icon/ILS.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "1 ILS - ${rates["ILS"]} Ks", //${userData[index]["last_name"]}
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    var _body1 = new Center(child: Text(""));
    return Scaffold(
      appBar: AppBar(
        //title: Text("Home"),
        title: Text(
          "Central Bank",
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
      body: isLoading
          ? LoadingUI(
              loading: _body1,
            )
          : _body,

      // body: Center(child: Text("hello")),
      // body: ListView.builder(
      //     itemCount: rates == null ? 0 : rates.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       return Container(
      //         child: Center(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.stretch,
      //             children: <Widget>[
      //               Card(
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(10.0),
      //                   child: Row(
      //                     children: <Widget>[
      //                       // Image(
      //                       //   image: AssetImage('icon/USD.png'),
      //                       //   width: 50,
      //                       //   // height: 50,
      //                       // ),
      //                       CircleAvatar(
      //                         backgroundImage:
      //                             AssetImage('assets/icon/USD.png'),
      //                       ),
      //                       Padding(
      //                         padding: const EdgeInsets.all(10.0),
      //                         child: Text(
      //                           rates[index].toString(),
      //                           //"1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
      //                           style: TextStyle(
      //                             fontSize: 18,
      //                             fontWeight: FontWeight.w500,
      //                           ),
      //                         ),
      //                       )
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     }),
    );
  }
}
