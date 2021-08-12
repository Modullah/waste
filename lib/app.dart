import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'screens/waste.dart';


class App extends StatefulWidget {
  const App({ Key? key }) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  FirebaseAnalytics analytics = FirebaseAnalytics();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        iconTheme: IconThemeData(color: Colors.white30),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.black26, 
          foregroundColor: Colors.white
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Waste(),
      navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
    );
  }
}