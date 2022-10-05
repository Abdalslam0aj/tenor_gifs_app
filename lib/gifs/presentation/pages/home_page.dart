import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenor_gif_app/gifs/presentation/provider/gif_provider.dart';
import 'package:tenor_gif_app/gifs/presentation/widget/gif_grid_view.dart';

class HomePage extends StatefulWidget {
  static String id = '/HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GifProvider gifProvider;
  @override
  void initState() {
    super.initState();
    gifProvider = Provider.of<GifProvider>(context, listen: false);
    gifProvider.getTrendingGifs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all( 10),
            child: SafeArea(
              child: TextFormField(
                decoration: const InputDecoration(                  
                    hintText: 'search',
                    suffix: Icon(
                      Icons.search,
                      size: 15,
                    )),
                onChanged: (String value) {
                  gifProvider.search = value;
                },
                textInputAction: TextInputAction.search,
                onFieldSubmitted: (String value) {
                  gifProvider.getGifs();
                },
              ),
            ),
          ),
          const Expanded(child: GifGridView()),
        ],
      ),
    );
  }
}
