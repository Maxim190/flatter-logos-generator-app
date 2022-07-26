import 'package:flutter/material.dart';
import 'package:start_flutter_project/pages/favorites_page.dart';
import 'package:start_flutter_project/pages/home_page.dart';
import 'package:start_flutter_project/navigation/navigation_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Шанти Generator',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.greenAccent,
          ),
        ),
        routes: {
          "/": (context) => const HomePage(),
          FavoritesPage.routeName: (context) => FavoritesPage(),
        });
  }
}
