import 'package:flutter/material.dart';
import 'package:tenor_gif_app/gifs/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenor gif',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      routes: {
        HomePage.id:(context)=> const HomePage(),
        

      },
    );
  }
}


