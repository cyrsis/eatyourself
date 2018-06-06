import 'dart:async';

import 'package:eatyourself/Screens/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => new _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
    .padding.top;
    print(statusBarHeight);
    return new WillPopScope(
        // Prevent swipe popping of this page. Use explicit exit buttons on
        // ly.
        onWillPop: () => new Future<bool>.value(true),
        child: new CupertinoTabScaffold(

          tabBar: new CupertinoTabBar(
            backgroundColor: Colors.transparent,
            activeColor: const Color(0xFF615147),
            inactiveColor: const Color(0xFF918984),
            items: const <BottomNavigationBarItem>[
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home),
                title: const Text('Home'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.search),
                title: const Text('Explore'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.shopping_cart),
                title: const Text('Uncover'),
              ),
              const BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.share),
                title: const Text('Share'),
              ),
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            return new DefaultTextStyle(
              style: const TextStyle(
                fontFamily: '.SF UI Text',
                fontSize: 17.0,
                color: CupertinoColors.black,
              ),
              child: new CupertinoTabView(
                routes: <String, WidgetBuilder>{
                  // Set named routes
                  HomeScreen.routeName: (BuildContext context) =>
                      new HomeScreen(statusBarHeight),
                  "/webview": (_) => new WebviewScaffold(
                        url: "https://www.google.com",
                        appBar: new AppBar(
                          title: new Text("WebView"),
                        ),
                        withJavascript: true,
                        withLocalStorage: true,
                        withZoom: true,
                      )
                },
                builder: (BuildContext context) {
                  switch (index) {
                    case 0:
                      return new HomeScreen(statusBarHeight); //Home
                      break;
                    case 1:
                      return new HomeScreen(statusBarHeight);
                      break;
                    case 2:
                      return new HomeScreen(statusBarHeight);
                      break;
                    case 3:
                      return new HomeScreen(statusBarHeight);
                      break;
                    default:
                  }
                },
              ), //End of Child
            );
          },
        )); //End of IOSTab
  }


}
