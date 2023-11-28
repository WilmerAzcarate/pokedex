import 'package:flutter/material.dart';
import 'package:pokedex_movil/pages/home_page.dart';

void main() => runApp(const MainApp());


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Mi Pokedex')),
        body: const HomePage()
      ),
    );
  }
}
