import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';

import 'mytheme.dart';

class Themeservice with ChangeNotifier {
  SharedPreferences? sharedPreferences;
  int currentThemeIndex;

  static const String key = 'theme_key';

  Themeservice(this.currentThemeIndex);

  void _initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  ThemeData getTheme() {
    switch (currentThemeIndex) {
      case 0:
        return lightTheme;
      case 1:
        return darkTheme;
      case 2:
        return thirdTheme;
      case 3:
        return fourTheme; //de aca
      default:
        return lightTheme;
    }
  }

  Future<void> toggleTheme() async {
    currentThemeIndex =
        (currentThemeIndex + 1) % 3; //va rotando el tema en tap, bucle
    await _saveSP();
    notifyListeners();
  }

  Future<void> cambio(intColor) async {
    currentThemeIndex = intColor; //va rotando el tema en tap, bucle
    await _saveSP();
    notifyListeners();
  }

  Future<void> _saveSP() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    await sharedPreferences!.setInt(key, currentThemeIndex);
  }
}

//v7
/*
class Themeservice with ChangeNotifier {
  SharedPreferences? sharedPreferences;
  bool darkTheme;
  //int lostemas;

  static const String key = 'key';

  Themeservice(this.darkTheme);

  void _initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> toggleTheme() async {
    darkTheme = !darkTheme;
    await _saveSP();
    notifyListeners();
  }

  Future<void> _saveSP() async {
    sharedPreferences ??= await SharedPreferences.getInstance();
    await sharedPreferences!.setBool(key, darkTheme);
  }
}
*/


//v6 la buena que anda
/*
class Themeservice with ChangeNotifier {
  SharedPreferences? sharedPreferences;
  bool? darkTheme; //= false;
  //bool darkTheme = false;
  static String key = 'key';
  //constructor
  Themeservice() {
    darkTheme = false;
    //darkTheme = false;
    loadSp();
  }
  initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  loadSp() async {
    await initSp();
    darkTheme = sharedPreferences!.getBool(key);
    //darkTheme = sharedPreferences!.getBool(key)!; //revisa el null
    notifyListeners();
    //darkTheme = await sharedPreferences!.setBool(key, darkTheme!);
  }

  saveSP() async {
    await initSp();
    darkTheme = await sharedPreferences!.setBool(key, darkTheme!);
    //notifyListeners();
  }

  toggleTheme() {
    darkTheme = !darkTheme!;
    saveSP();
    notifyListeners();
  }
}
*/