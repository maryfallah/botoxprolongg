import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity/connectivity.dart';

import 'main.dart';
class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreen> {
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogin();
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
    builder: ((context, snapshot) {
      if(!snapshot.hasData){
        return BodySplashScreen();

      }else{
        
        return Scaffold(
          body: HomePage(),
        );
      
      }
    
    ;}
  ));}

  checkLogin() async {
    



    if(await checkConnectionInternet()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
     
    } else {
      _BodySplashScreenState._scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          backgroundColor: Colors.black.withOpacity(0.5),
          width: 100,
          behavior: SnackBarBehavior.floating,
          
          duration: Duration(seconds: 100),
          content: GestureDetector(
            onTap: () {
              _BodySplashScreenState._scaffoldKey.currentState!.hideCurrentSnackBar();
              checkLogin();
            },
            child: Icon(Icons.wifi_lock , color: Colors.red[400],size: 25,),
          )
        )
      );
    }

  }

  Future<bool> checkConnectionInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
  }
}

class BodySplashScreen extends StatefulWidget {
  const BodySplashScreen({Key? key}) : super(key: key);

  @override
  State<BodySplashScreen> createState() => _BodySplashScreenState();
}

class _BodySplashScreenState extends State<BodySplashScreen> {
 static final _scaffoldKey = GlobalKey<ScaffoldState>();
 late WebViewController _controller;
 bool loading=true;
  startSplashScreen() async {
    var duration = const Duration(seconds: 13);
    return Timer(
      duration,
      () {
        setState(() {
          loading = false;
        });
      },
    );
  }
 Future<bool> _onWillPop(BuildContext context) async {
    if (await _controller.canGoBack()) {
      _controller.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startSplashScreen();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
      
      body: Container(
        decoration: BoxDecoration(gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color(0xff4858cf),Color(0xffc750c0)])),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 125,
                  height : 125,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("icons/icon-128x128.png")
                    )
                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                SpinKitFadingCircle(color: Colors.white ,duration: Duration(seconds: 3))
              ],
            ),
            
            
          ],
        ),
      )
    );
  }
}