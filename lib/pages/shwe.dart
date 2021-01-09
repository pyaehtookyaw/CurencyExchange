import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:url_launcher/url_launcher.dart';

class ShwePage extends StatefulWidget {
  @override
  _ShwePageState createState() => _ShwePageState();
}

class _ShwePageState extends State<ShwePage> {
  final webScraper = WebScraper('https://shwebank.com');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>> currencyName;
  List<Map<String, dynamic>> buyRate;
  List<Map<String, dynamic>> sellRate;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('/')) {
      setState(() {
        currencyName = webScraper.getElement(
            'table.tablepress tablepress-id-1>tbody>tr>td>span.tdtext',
            ['title']);
        buyRate = webScraper.getElement(
            'table.tablepress tablepress-id-1>tbody>tr.row-1>td.column-2>span.tdtext',
            ['title']);
        sellRate = webScraper.getElement(
            'span.field-content> div.currency-exchange > div.currency-info > div.currency-sell',
            ['title']);
      });
      print(currencyName);
      print(buyRate);
      print(sellRate);
    }
  }

  @override
  void initState() {
    //checkLanguage();
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Home"),
        title: Text(
          "Shwe Bank",
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
      //body: Center(child: Text("hello")),
      // body: isLoading
      //     ? LoadingUI(
      //         loading: _body1,
      //       )
      //     : _body,
      body: SafeArea(
          child: currencyName == null
              ? Center(
                  child:
                      CircularProgressIndicator(), // Loads Circular Loading Animation
                )
              : ListView.builder(
                  itemCount: currencyName.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: EdgeInsets.all(0.0),
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            print('testing');
                                          },
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              // Padding(
                                              //   padding: const EdgeInsets.all(10.0),
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    currencyName[index]
                                                        ['title'],
                                                    // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ]
                                              //),
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            print('testing');
                                          },
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              // Padding(
                                              //   padding: const EdgeInsets.all(10.0),
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    buyRate[index]['title'],
                                                    // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ]
                                              //),
                                              ),
                                        ),
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            print('testing');
                                          },
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              // Padding(
                                              //   padding: const EdgeInsets.all(10.0),
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    sellRate[index]['title'],
                                                    // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ]
                                              //),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );
                  })),
    );
  }
}
