import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_data.dart';
class GifDataCard extends StatelessWidget {
  final GifData loadedGif;
  const GifDataCard({Key? key, required this.loadedGif}) : super(key: key);

  DateTime toDate(double timestamp) {
    return DateTime.fromMillisecondsSinceEpoch(timestamp.ceil() * 1000);
  }

  @override
  Widget build(BuildContext context) {
    return     Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  spreadRadius: 0.5,
                  blurRadius: 0.5,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  children: [
                    const Icon(Icons.share),
                    Text(
                      '${loadedGif.shares}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy EE')
                          .format(toDate(loadedGif.created!)),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}