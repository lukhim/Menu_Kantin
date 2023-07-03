import 'package:flutter/material.dart';
import 'package:menu_kantin/ui/menu_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      title: 'Menu Kantin',
      debugShowCheckedModeBanner: false,
      home: MenuPage(),
    );
  }
}
