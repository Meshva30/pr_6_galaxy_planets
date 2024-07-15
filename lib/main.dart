import 'package:flutter/material.dart';
import 'package:pr_6_galaxy_planets/screen/controller/space_controller.dart';
import 'package:pr_6_galaxy_planets/screen/detailsscreen.dart';
import 'package:pr_6_galaxy_planets/screen/homescreen.dart';

import 'package:pr_6_galaxy_planets/screen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlanetProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
        '/': (context)=> Splashscreen(),
        'home': (context)=> Homescreen(),

    },
    );
  }
}
