import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenor_gif_app/gifs/presentation/provider/gif_provider.dart';
import 'package:tenor_gif_app/gifs/presentation/widget/gif_data_card.dart';

class GifDetailsPage extends StatefulWidget {
  static String id = '/GifDetailsPage';

  const GifDetailsPage({Key? key}) : super(key: key);

  @override
  State<GifDetailsPage> createState() => _GifDetailsPageState();
}

class _GifDetailsPageState extends State<GifDetailsPage> {
  late GifProvider gifProvider;

  @override
  void initState() {
    super.initState();
    gifProvider = Provider.of<GifProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                gifProvider.loadedGif!.media!.first.mediumgif!.url!,
                loadingBuilder:
                    (BuildContext context, Widget child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5)),
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                child: Text(
                  '${gifProvider.loadedGif!.id}',
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          GifDataCard(loadedGif: gifProvider.loadedGif!),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
            child: Text(
              '${gifProvider.loadedGif!.contentDescription}',
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
            ),
          ),
        ],
      ),
    );
  }
}
