// import 'dart:async';

// import 'package:botoxprolog/main.dart';
// import 'package:flutter/material.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// class SplashScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

  

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     checkLogin();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return FutureBuilder(
//     future: checkLogin(),
//     builder: ((context, snapshot) {
//       if(!snapshot.hasData){
//         return Scaffold(
//         key: _scaffoldKey,
      
//       body: Container(
//         decoration: BoxDecoration(gradient: LinearGradient(
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//       colors: [Color(0xff4858cf),Color(0xffc750c0)])),
//         child: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   width: 125,
//                   height : 125,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("icons/icon-128x128.png")
//                     )
//                   ),

//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SpinKitFadingCircle(color: Colors.white ,duration: Duration(seconds: 3))
//               ],
//             ),
            
            
//           ],
//         ),
//       )
//     );

//       }else{
        
//         return Scaffold();
      
//       }
    
//     ;}
//   ));}

//   checkLogin() async {
    



//     if(await checkConnectionInternet()) {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
     
//     } else {
//       _scaffoldKey.currentState!.showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.black.withOpacity(0.5),
//           width: 100,
//           behavior: SnackBarBehavior.floating,
          
//           duration: Duration(seconds: 2),
//           content: GestureDetector(
//             onTap: () {
//               _scaffoldKey.currentState!.hideCurrentSnackBar();
//               checkLogin();
//             },
//             child: Icon(Icons.wifi_lock , color: Colors.red[400],size: 25,),
//           )
//         )
//       );
//     }

//   }

//   Future<bool> checkConnectionInternet() async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     return connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
//   }
// }
// /////////////////////////////////////////////////////////////////////////////////


// import 'package:botoxprolog/main.dart';
// import 'package:botoxprolog/splashScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// void main() => runApp(MaterialApp(
//   debugShowCheckedModeBanner: false,
//   initialRoute: '/splashScreen',
//   routes: {
//     '/splashScreen':(context) => SplashScreen()
//   },
// ));



// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 15),
//       child: WebView(
//        initialUrl: 'https://www.botoxprolong.com/auth/login',
//       ),
//     );
//   }
// }