import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenor_gif_app/gifs/presentation/pages/gif_details_page.dart';
import 'package:tenor_gif_app/gifs/presentation/pages/home_page.dart';
import 'package:tenor_gif_app/gifs/presentation/provider/gif_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<GifProvider>(create: (_) => GifProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tenor gif',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          inputDecorationTheme: const  InputDecorationTheme(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigo, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.indigoAccent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(6.0)),
            ),
          )),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        GifDetailsPage.id: (context) => const GifDetailsPage(),
      },
    );
  }
}
