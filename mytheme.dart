import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.green,
);
final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.red,
    cardTheme: const CardTheme(
      //se puede serguir modificando
      color: Colors.red,
    ));
final ThemeData thirdTheme = ThemeData(
  scaffoldBackgroundColor: Colors.green,
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  cardTheme: const CardTheme(
    color: Colors.blue,
  ),
);
//de aca
final ThemeData fourTheme = ThemeData(
  scaffoldBackgroundColor: Colors.yellow,
  brightness: Brightness.light,
  primarySwatch: Colors.yellow,
  cardTheme: const CardTheme(
    color: Colors.yellow,
  ),
);
//hasta aca
//v7
//final ThemeData tercertheme = ThemeData(
  //brightness: Brightness.light,
  //scaffoldBackgroundColor: Colors.green,
  //primarySwatch: Colors.green,
//);



//poner un color mas y ver si se rompe 
//quitar iconos

//proba lo de chat gpt ya hiso la version multicolor



//List<ThemeData> listaTheme=[lightTheme,darkTheme,tercertheme];
//crear otro themeservice
//main obio modificar
//crear operador logico para que debuelva el tema y asi
//tratar con los bool del main y botton


//bien
