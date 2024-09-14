// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:codificacion_pae/mytheme.dart';
import 'package:codificacion_pae/themeservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'laqueguarda.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themeservice.dart';
import 'mytheme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'themeservice.dart';
import 'mytheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int themeIndex = prefs.getInt(Themeservice.key) ?? 0;

  runApp(MyApp(themeIndex: themeIndex));
}

class MyApp extends StatelessWidget {
  final int themeIndex;

  const MyApp({super.key, required this.themeIndex});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Themeservice>(
          create: (context) => Themeservice(themeIndex),
        ),
        // Aquí puedes agregar otros providers en el futuro
        // ChangeNotifierProvider<OtroService>(create: (_) => OtroService()),
      ],
      child: Consumer<Themeservice>(
        builder: (context, themeService, _) {
          return MaterialApp(
            title: 'SharedPreferences Demo',
            home: const SharedPreferencesDemo(),
            theme: themeService.getTheme(),
          );
        },
      ),
    );
    /*ChangeNotifierProvider<Themeservice>(
      create: (context) => Themeservice(themeIndex),
      child: Consumer<Themeservice>(
        builder: (context, themeService, _) {
          return MaterialApp(
            title: 'SharedPreferences Demo',
            home: const SharedPreferencesDemo(),
            theme: themeService.getTheme(),
          );
        },
      ),
    );*/
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
        actions: [
          Consumer<Themeservice>(
            builder: (context, themeService, _) {
              return IconButton(
                onPressed: () {
                  themeService.toggleTheme();
                },
                icon: Icon(
                  themeService.currentThemeIndex == 0
                      ? Icons.sunny
                      : themeService.currentThemeIndex == 1
                          ? Icons.dark_mode
                          : Icons.brightness_3,
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Theme Switcher'),
            Consumer<Themeservice>(
              builder: (context, themeService, _) {
                return FloatingActionButton(
                  onPressed: () {
                    themeService.toggleTheme();
                  },
                  child: Icon(
                    themeService.currentThemeIndex == 0
                        ? Icons.light_mode
                        : themeService.currentThemeIndex == 1
                            ? Icons.dark_mode
                            : Icons.brightness_3,
                  ),
                );
              },
            ),
            Consumer<Themeservice>(
              builder: (context, themeService, _) {
                return FloatingActionButton(
                  onPressed: () {
                    themeService.cambio(2);
                  },
                  child: const Text('green'),
                );
              },
            ),
            //de aca
            Consumer<Themeservice>(
              builder: (context, themeService, _) {
                return FloatingActionButton(
                  onPressed: () {
                    themeService.cambio(3);
                  },
                  child: const Text('yellow'),
                );
              },
            ),
            //hasta aca
/*
            Consumer<ThemeService>(builder: (context, themeService, _){
              return FloatingActionButton(onPressed: onPressed)
            },),
*/
          ],
        ),
      ),
    );
  }
}



///v7
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkTheme = prefs.getBool(Themeservice.key) ?? false;

  runApp(MyApp(isDarkTheme: isDarkTheme));
}

class MyApp extends StatelessWidget {
  final bool isDarkTheme;

  const MyApp({super.key, required this.isDarkTheme});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Themeservice>(
      create: (context) => Themeservice(isDarkTheme),
      child: Consumer<Themeservice>(
        builder: (context, themeService, _) {
          return MaterialApp(
            title: 'SharedPreferences Demo',
            home: const SharedPreferencesDemo(),
            theme: themeService.darkTheme ? darkTheme : lightTheme,
          );
        },
      ),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
        actions: [
          Consumer<Themeservice>(
            builder: (context, themeService, _) {
              return IconButton(
                onPressed: () {
                  themeService.toggleTheme();
                },
                icon: Icon(
                    themeService.darkTheme ? Icons.sunny : Icons.dark_mode),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('el nuevo'),
            const Text('popo'),
            Consumer<Themeservice>(
              builder: (context, themeService, _) {
                return FloatingActionButton(
                  onPressed: () {
                    themeService.toggleTheme();
                  },
                  child: Icon(themeService.darkTheme
                      ? Icons.light_mode
                      : Icons.dark_mode),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

*/


//esta es la buena que anda
/*
//v5
//https://www.youtube.com/watch?v=qs0FAa93RcA
//veo si anda y luego pruevo poner 3 temas

void main() /*async*/ {
  //4//WidgetsFlutterBinding.ensureInitialized();
  //4//await localstorage.configurePrefs(); //esta inicializado
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Themeservice>(
      //stream: null,
      create: (context) => Themeservice(),
      child: Consumer(
        builder: (context, Themeservice Theme, _) {
          return MaterialApp(
            title: 'SharedPreferences Demo',
            home: SharedPreferencesDemo(),
            theme: Theme.darkTheme!
                ? darkTheme
                : lightTheme, //darkTheme, //aca estoy poniendo el tema
            /*theme: themeService.isDarkTheme
                ? darkTheme
                : lightTheme, */
          );
        },
      ),
/*modificacion para v5
      builder: (context, snapshot) {
        return MaterialApp(
          title: 'SharedPreferences Demo',
          home: SharedPreferencesDemo(),
          theme: darkTheme, //aca estoy poniendo el tema
        );
      }
*/
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  //3//final Future<SharedPreferences> _prefs =
  //3//SharedPreferences.getInstance(); //creo que se crea la instancia _prefs
  //3//late Future<int> _counter;

//https://www.youtube.com/watch?v=GGNiT9PgrFQ&t=318s
//creo variable boleana
//4
  //bool deprueva =   false; //debe ser hijo stateful //el nombre de la variable deprueba

/*
//escrbir info
  // Obtain shared preferences.
final SharedPreferences micontador = await SharedPreferences.getInstance();
// Save an boolean value to 'repeat' key.
await micontador.setBool('repeat', true);
//leer la info
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
final bool? repeat = prefs.getBool('repeat');
*/
//3
/*
  Future<void> _incrementCounter() async {
    final SharedPreferences prefs =
        await _prefs; //creo que se crea la instancia prefs
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }*/

  @override
  void initState() {
    //3
    //super.initState();
//3
/*
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0; //creo que lo guarda
    });*/

    //el video 5:00 al 6:00
    //4
    /*
    if (localstorage.prefs.getBool('elnombre') != null) {
      //leo la data //elnombre es la key
      //si es diferente de null entra al if
      localstorage.prefs.getBool('elnombre') as bool == true
          ? deprueva = true
          : deprueva = false; //rebiso que es tipo bool 7:00
    }
    super.initState();
    */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
        actions: [
          Consumer<Themeservice>(
              //stream: null,
              builder: (context, Themeservice theme, _) {
            return IconButton(
                onPressed: () {
                  theme.toggleTheme();
                },
                icon: Icon(theme.darkTheme!
                    ? Icons.sunny
                    : Icons.dark_mode /*Icons.dark_mode*/));
          }),
        ],
      ),
      body: Center(
          child: Column(
        children: [
//3
/*
          FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Text(
                  'Button tapped ${snapshot.data} ',
                );
              }),
*/
          Text('el nuevo'),
          Text('popo'),
          Consumer<Themeservice>(builder: (context, Themeservice theme, _) {
            return FloatingActionButton(onPressed: () {
              theme.toggleTheme();
            });
          }),

          //4
/*
          SwitchListTile(
              title: const Text('deberiaguardar'),
              value: deprueva,
              onChanged: (bool value) {
                setState(() {
                  localstorage.prefs
                      .setBool('elnombre', value); //setea el nuevo valor 9:00
                  deprueva = value;
                });
              })
              */
        ],
      )),
//3
/*
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    */
    );
  }
}
*/































///version v3 mala shared preference eisijb asjp BOISQDVdaa
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:';
import 'theme_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';
import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

//https://github.com/iamashish1/theme_changer_app/tree/main/lib
//https://medium.com/@iamashishkoirala1/implement-persistent-dark-theme-in-flutter-using-flutter-bloc-part-2-3468918f9aa3

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          theme: themeState.themeData,
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, counterState) {
                return Text(
                  '${counterState.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Increment());
                  },
                  child: Text('Increment'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Decrement());
                  },
                  child: Text('Decrement'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ToggleToYellowTheme());
                  },
                  child: Text('Yellow Theme'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ToggleToBlueTheme());
                  },
                  child: Text('Blue Theme'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

*/








/*
import 'package:flutter/material.dart';
//probar cambiar tema con bloc and equatable ///ya puedo cambiar el color
// luego guardar con share
// pasar lo de la anterior

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/