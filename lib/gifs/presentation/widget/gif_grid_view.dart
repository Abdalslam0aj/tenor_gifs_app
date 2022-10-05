import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenor_gif_app/gifs/presentation/provider/gif_provider.dart';
import 'package:tenor_gif_app/gifs/presentation/widget/gif_card_widget.dart';

class GifGridView extends StatefulWidget {
  const GifGridView({Key? key}) : super(key: key);

  @override
  State<GifGridView> createState() => _GifGridViewState();
}

class _GifGridViewState extends State<GifGridView> {
  late ScrollController controller;
  late GifProvider gifProvider;

  void _scrollListener() {
    if (controller.position.extentAfter < 100) {
      gifProvider.getGifsPaging();
    }
  }

  @override
  void initState() {
    super.initState();
    gifProvider = Provider.of<GifProvider>(context, listen: false);
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GifProvider>(builder: (context, gifProvider, child) {
      if (gifProvider.gifResponse != null &&
          gifProvider.gifResponse!.gifDataResults != null) {
        return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            GridView.builder(
                shrinkWrap: true,
                controller: controller,
                itemCount: gifProvider.gifResponse!.gifDataResults!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio: 0.9),
                itemBuilder: (BuildContext context, int index) {
                  return GifCardWiget(
                      gifData: gifProvider.gifResponse!.gifDataResults![index]);
                }),
            if (gifProvider.loading)
              const LinearProgressIndicator(
                color: Colors.red,
              )
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        );
      }
    });
  }
}
