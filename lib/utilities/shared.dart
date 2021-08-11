// import 'package:shared_preferences/shared_preferences.dart';

// class Shared {

//   static final Shared _instance = Shared._();

//   Shared._();

//   factory Shared() {
//     return _instance;
//   }

//   SharedPreferences? _prefs;

//   init() async {
//     _prefs = await SharedPreferences.getInstance();
//   }

//   String get data => (_prefs?.getString('data')).toString();


//   set data(String value) => _prefs?.setString('data', value);

// }