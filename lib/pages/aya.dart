import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

class AyaPage extends StatefulWidget {
  @override
  _AyaPageState createState() => _AyaPageState();
}

class _AyaPageState extends State<AyaPage> {
  final webScraper = WebScraper('https://www.ayabank.com');

  //Response of getElement is always List<Map<String, dynamic>>
  // List<Map<String, dynamic>> currencyName;
  // List<Map<String, dynamic>> buyRate;
  // List<Map<String, dynamic>> sellRate;

  List<String> title = List();
  List<String> post = List();
  List<String> link = List();
  List<String> currencyName = List();

  void _getData() async {
    final response = await http.get('https://www.ayabank.com/en_US/');
    dom.Document document = parser.parse(response.body);
    final elements = document.getElementsByTagName('tr');
    // final element2 = document.getElementsByClassName('entry-content');
    final element3 =
        document.getElementsByClassName('tablepress tablepress-id-104');
    //final linkElemnt = document.getElementsByClassName('entry-title');
    setState(() {
      title = elements
          .map((element) => element.getElementsByTagName("td")[1].innerHtml)
          .toList();
      // post = element2
      //     .map((element) => element.getElementsByTagName("p")[0].innerHtml)
      //     .toList();
      currencyName = element3
          .map((element) => element.getElementsByTagName("td")[3].innerHtml)
          .toList();
      // link = linkElemnt
      //     .map((element) =>
      //         element.getElementsByTagName("a")[0].attributes['href'])
      //     .toList();
    });
    print(currencyName);
    print(title);
  }

  // void fetchProducts() async {
  //   // Loads web page and downloads into local state of library
  //   if (await webScraper.loadWebPage('/en_US/')) {
  //     setState(() {
  //       // getElement takes the address of html tag/element and attributes you want to scrap from website
  //       // it will return the attributes in the same order passed
  //       // productNames = webScraper.getElement(
  //       //     'div.view-footer > div.views-row views-row-1 views-row-odd views-row-first views-row-lastviews-row views-row-1 views-row-odd views-row-first views-row-last> div.view-content > div.views-row views-row-1 views-row-odd views-row-first views-row-last> div.views-field views-field-nothing>span.field-content> div.currency-exchange > div.currency-info > div.currency-type',
  //       //     ['currency-type']);
  //       currencyName = webScraper.getElement(
  //           'table.tablepress tablepress-id-104> tr.row-2> td.column-3',
  //           ['title']);
  //       // currencyName = webScraper.getElement(
  //       //     'span.field-content> div.currency-exchange > div.currency-info',
  //       //     ['buyRate', 'sellRate']);
  //       // buyRate = webScraper.getElement(
  //       //     'table.tablepress tablepress-id-104> tbody> tr.row-2> td.column-3',
  //       //     ['title']);
  //       // sellRate = webScraper.getElement(
  //       //     'span.field-content> div.currency-exchange > div.currency-info > div.currency-sell',
  //       //     ['title']);
  //       // productDescriptions = webScraper.getElement(
  //       //     'div.thumbnail > div.caption > p.description', ['class']);
  //     });
  //     // print(currencyName);
  //     // print(buyRate);
  //     // print(sellRate);
  //   }
  // }

  @override
  void initState() {
    //checkLanguage();
    super.initState();
    //fetchProducts();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text("Home"),
        title: Text(
          "Aya Bank",
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
                                                  child: Text("",
                                                    // currencyName[index]
                                                    //     ['title'],
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
                                      // Expanded(
                                      //   child: GestureDetector(
                                      //     onTap: () {
                                      //       print('testing');
                                      //     },
                                      //     child: Column(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.center,
                                      //         // Padding(
                                      //         //   padding: const EdgeInsets.all(10.0),
                                      //         children: <Widget>[
                                      //           Padding(
                                      //             padding: const EdgeInsets.all(
                                      //                 10.0),
                                      //             child: Text(
                                      //               buyRate[index]['title'],
                                      //               // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                      //               textAlign: TextAlign.left,
                                      //               style: TextStyle(
                                      //                 fontSize: 18,
                                      //                 fontWeight:
                                      //                     FontWeight.w500,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ]
                                      //         //),
                                      //         ),
                                      //   ),
                                      // ),
                                      // Expanded(
                                      //   child: GestureDetector(
                                      //     onTap: () {
                                      //       print('testing');
                                      //     },
                                      //     child: Column(
                                      //         mainAxisAlignment:
                                      //             MainAxisAlignment.center,
                                      //         crossAxisAlignment:
                                      //             CrossAxisAlignment.end,
                                      //         // Padding(
                                      //         //   padding: const EdgeInsets.all(10.0),
                                      //         children: <Widget>[
                                      //           Padding(
                                      //             padding: const EdgeInsets.all(
                                      //                 10.0),
                                      //             child: Text(
                                      //               sellRate[index]['title'],
                                      //               // "1 USD - ${rates["USD"]} Ks", //${userData[index]["last_name"]}
                                      //               textAlign: TextAlign.left,
                                      //               style: TextStyle(
                                      //                 fontSize: 18,
                                      //                 fontWeight:
                                      //                     FontWeight.w500,
                                      //               ),
                                      //             ),
                                      //           ),
                                      //         ]
                                      //         //),
                                      //         ),
                                      //   ),
                                      // ),
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
