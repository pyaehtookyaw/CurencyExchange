import 'package:CurrencyExChange/pages/banks_list.dart';
import 'package:CurrencyExChange/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class GoogleMenu extends StatefulWidget {
  @override
  _GoogleMenuState createState() => _GoogleMenuState();
}

class _GoogleMenuState extends State<GoogleMenu> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Likes',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    // Text(
    //   'Index 3: Profile',
    //   style: optionStyle,
    // ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return WillPopScope(
    //   onWillPop: () => showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (c) => AlertDialog(
    //       title: Text(
    //         'Warning !',
    //         style: TextStyle(color: Colors.amber),
    //       ),
    //       content: Text('Are you sure you want to exit ?'),
    //       actions: [
    //         FlatButton(
    //           child: Text('OK'),
    //           onPressed: () => SystemNavigator.pop(),
    //         ),
    //         FlatButton(
    //           child: Text('Cancel'),
    //           onPressed: () => Navigator.pop(c, false),
    //         ),
    //       ],
    //     ),
    //   ),
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          for (final tabItem in TabNavigationItem.items) tabItem.page,
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                duration: Duration(milliseconds: 800),
                tabBackgroundColor: Colors.green,
                tabs: [
                  GButton(
                    icon: LineAwesomeIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineAwesomeIcons.bank,
                    //icon: new Icon(MaterialCommunityIcons.getIconData("menu"),
                    text: 'Banks',
                  ),
                  GButton(
                    icon: LineAwesomeIcons.user,
                    //icon: new Icon(MaterialCommunityIcons.getIconData("menu"),
                    text: 'Menu',
                  )
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}

class TabNavigationItem {
  final Widget page;
  final Widget title;
  final Icon icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon,
  });

  static List<TabNavigationItem> get items => [
        TabNavigationItem(
          page: HomePage(),
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        TabNavigationItem(
          page: BankListPage(),
          icon: Icon(Icons.menu),
          title: Text("Menu"),
        ),
        TabNavigationItem(
          page: HomePage(),
          icon: Icon(Icons.menu),
          title: Text("Menu"),
        ),
      ];
}
