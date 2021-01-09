import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:url_launcher/url_launcher.dart';

class YomaPage extends StatefulWidget {
  @override
  _YomaPageState createState() => _YomaPageState();
}

class _YomaPageState extends State<YomaPage> {
  final webScraper = WebScraper('https://yomabank.com');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>> currencyName;
  List<Map<String, dynamic>> buyRate;
  List<Map<String, dynamic>> sellRate;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper.loadWebPage('/en/personal/rates')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        // productNames = webScraper.getElement(
        //     'div.view-footer > div.views-row views-row-1 views-row-odd views-row-first views-row-lastviews-row views-row-1 views-row-odd views-row-first views-row-last> div.view-content > div.views-row views-row-1 views-row-odd views-row-first views-row-last> div.views-field views-field-nothing>span.field-content> div.currency-exchange > div.currency-info > div.currency-type',
        //     ['currency-type']);
        currencyName = webScraper.getElement(
            'div.desktopView modernTemplate> section> div.container page-content-section> div.exrates-detail-section> h1.mod-smmaintit mb3', // div.table-responsive-sm exratedetailTlb> table.table> tbody> td.buyrate',
            ['title']);
        // currencyName = webScraper.getElement(
        //     'span.field-content> div.currency-exchange > div.currency-info',
        //     ['buyRate', 'sellRate']);
        buyRate = webScraper.getElement(
            'div.mobileView modernTemplate> div.exrates-detail-section> div.exrates-detail-sectionexrates-detail-section> table.table> td.buyrate',
            ['title']);
        sellRate = webScraper.getElement(
            'span.field-content> div.currency-exchange > div.currency-info > div.currency-sell',
            ['title']);
        // productDescriptions = webScraper.getElement(
        //     'div.thumbnail > div.caption > p.description', ['class']);
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
          "Yoma Bank",
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
                                      // Column(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     crossAxisAlignment:
                                      //         CrossAxisAlignment.center,
                                      //     // Padding(
                                      //     //   padding: const EdgeInsets.all(10.0),
                                      //     children: <Widget>[
                                      //       Padding(
                                      //         padding:
                                      //             const EdgeInsets.all(10.0),
                                      //         child: Text(
                                      //           currencyName[index]['title'],
                                      //           // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                      //           textAlign: TextAlign.left,
                                      //           style: TextStyle(
                                      //             fontSize: 18,
                                      //             fontWeight: FontWeight.w500,
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ]
                                      //     //),
                                      //     ),
                                      // SizedBox(
                                      //   width: 80.0,
                                      // ),
                                      // Align(
                                      //   alignment: Alignment.centerRight,
                                      //   child: Text(
                                      //     'Marry Jane',
                                      //     textAlign: TextAlign.right,
                                      //     style: TextStyle(fontSize: 16),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(10.0),
                                      //   child: Text(
                                      //     buyRate[index]['title'],
                                      //     // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                      //     style: TextStyle(
                                      //       fontSize: 18,
                                      //       fontWeight: FontWeight.w500,
                                      //     ),
                                      //   ),
                                      // ),
                                      // Padding(
                                      //   padding: const EdgeInsets.all(10.0),
                                      //   child: Text(
                                      //     sellRate[index]['title'],
                                      //     // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                      //     style: TextStyle(
                                      //       fontSize: 18,
                                      //       fontWeight: FontWeight.w500,
                                      //     ),
                                      //   ),
                                      // )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    );

                    // Attributes are in the form of List<Map<String, dynamic>>.
                    // Map<String, dynamic> attributes =
                    //     currencyName[index]['attributes'];
                    // return ExpansionTile(
                    //   title: Text(currencyName[index]['title']),
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.all(10.0),
                    //       // child: Column(
                    //       //   children: <Widget>[
                    //       //     Container(
                    //       //       child:
                    //       //           Text(productDescriptions[index]['title']),
                    //       //       margin: EdgeInsets.only(bottom: 10.0),
                    //       //     ),
                    //       //     InkWell(
                    //       //       onTap: () {
                    //       //         // uses UI Launcher to launch in web browser & minor tweaks to generate url
                    //       //         launch(
                    //       //             webScraper.baseUrl + attributes['href']);
                    //       //       },
                    //       //       child: Text(
                    //       //         "View Product",
                    //       //         style: TextStyle(color: Colors.blue),
                    //       //       ),
                    //       //     ),
                    //       //   ],
                    //       // ),
                    //     )
                    //   ],
                    // );
                  })),
    );
  }
}
