import 'package:division/division.dart';
import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';
import 'package:url_launcher/url_launcher.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final webScraper = WebScraper('https://webscraper.io');

  // Response of getElement is always List<Map<String, dynamic>>
  List<Map<String, dynamic>> productNames;
  List<Map<String, dynamic>> productDescriptions;

  void fetchProducts() async {
    // Loads web page and downloads into local state of library
    if (await webScraper
        .loadWebPage('/test-sites/e-commerce/allinone/computers/laptops')) {
      setState(() {
        // getElement takes the address of html tag/element and attributes you want to scrap from website
        // it will return the attributes in the same order passed
        productNames = webScraper.getElement(
            'div.thumbnail > div.caption > h4 > a.title', ['href', 'title']);
        productDescriptions = webScraper.getElement(
            'div.thumbnail > div.caption > p.description', ['class']);
      });
      print(productNames);
      print(productDescriptions);
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
          "KBZ",
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
      // body: Center(child: Text("hello")),
      body: SafeArea(
          child: productNames == null
              ? Center(
                  child:
                      CircularProgressIndicator(), // Loads Circular Loading Animation
                )
              : ListView.builder(
                  itemCount: productNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Attributes are in the form of List<Map<String, dynamic>>.
                    Map<String, dynamic> attributes =
                        productNames[index]['attributes'];
                    return ExpansionTile(
                      title: Text(attributes['title']),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child:
                                    Text(productDescriptions[index]['title']),
                                margin: EdgeInsets.only(bottom: 10.0),
                              ),
                              InkWell(
                                onTap: () {
                                  // uses UI Launcher to launch in web browser & minor tweaks to generate url
                                  launch(
                                      webScraper.baseUrl + attributes['href']);
                                },
                                child: Text(
                                  "View Product",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  })),
    );
  }
}
