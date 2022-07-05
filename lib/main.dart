

import 'dart:async';


import 'package:botoxprolong/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/splashScreen',
  routes: {
    '/splashScreen':(context) => SafeArea(child: SplashScreen())
  },
));



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final Completer<WebViewController> _controllerCompleter =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: WebView(
                  key: UniqueKey(),
                  initialUrl: 'https://www.botoxprolong.com/auth/login'
,
                  
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              
    );
  }
}






