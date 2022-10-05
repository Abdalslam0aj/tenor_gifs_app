import 'package:tenor_gif_app/gifs/data/model/gif_data.dart';

class GifResponse {
  String? locale;
  List<GifData>? gifDataResults;
  String? next;
  bool error = false;

  GifResponse({locale, gifDataResults, next, error});

  GifResponse.fromJson(Map<String, dynamic> json) {
    locale = json['locale'];
    if (json['results'] != null) {
      gifDataResults = <GifData>[];
      json['results'].forEach((v) {
        gifDataResults!.add(GifData.fromJson(v));
      });
    }
    next = json['next'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['locale'] = locale;
    if (gifDataResults != null) {
      data['results'] = gifDataResults!.map((v) => v.toJson()).toList();
    }
    data['next'] = next;
    return data;
  }
}








