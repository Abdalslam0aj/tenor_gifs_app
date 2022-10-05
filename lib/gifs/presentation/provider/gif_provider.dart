import 'package:flutter/cupertino.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_data.dart';

class GifProvider extends ChangeNotifier {
  List<GifData>? gifs;
  bool hasError = false;
}