import 'package:tenor_gif_app/gifs/data/model/nanomp4.dart';
import 'package:tenor_gif_app/gifs/data/model/nanowebm.dart';

class Media {
  Nanowebm? nanowebm;
  Nanowebm? tinywebm;
  Nanowebm? mediumgif;
  Nanowebm? webm;
  Nanowebm? gif;
  Nanowebm? tinygif;
  Nanomp4? nanomp4;
  Nanomp4? mp4;
  Nanomp4? tinymp4;
  Nanomp4? loopedmp4;
  Nanowebm? nanogif;

  Media(
      {nanowebm,
      tinywebm,
      mediumgif,
      webm,
      gif,
      tinygif,
      nanomp4,
      mp4,
      tinymp4,
      loopedmp4,
      nanogif});

  Media.fromJson(Map<String, dynamic> json) {
    nanowebm = json['nanowebm'] != null
        ?  Nanowebm.fromJson(json['nanowebm'])
        : null;
    tinywebm = json['tinywebm'] != null
        ?  Nanowebm.fromJson(json['tinywebm'])
        : null;
    mediumgif = json['mediumgif'] != null
        ?  Nanowebm.fromJson(json['mediumgif'])
        : null;
    webm = json['webm'] != null ?  Nanowebm.fromJson(json['webm']) : null;
    gif = json['gif'] != null ?  Nanowebm.fromJson(json['gif']) : null;
    tinygif =
        json['tinygif'] != null ?  Nanowebm.fromJson(json['tinygif']) : null;
    nanomp4 =
        json['nanomp4'] != null ?  Nanomp4.fromJson(json['nanomp4']) : null;
    mp4 = json['mp4'] != null ?  Nanomp4.fromJson(json['mp4']) : null;
    tinymp4 =
        json['tinymp4'] != null ?  Nanomp4.fromJson(json['tinymp4']) : null;
    loopedmp4 = json['loopedmp4'] != null
        ?  Nanomp4.fromJson(json['loopedmp4'])
        : null;
    nanogif =
        json['nanogif'] != null ?  Nanowebm.fromJson(json['nanogif']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (nanowebm != null) {
      data['nanowebm'] = nanowebm!.toJson();
    }
    if (tinywebm != null) {
      data['tinywebm'] = tinywebm!.toJson();
    }
    if (mediumgif != null) {
      data['mediumgif'] = mediumgif!.toJson();
    }
    if (webm != null) {
      data['webm'] = webm!.toJson();
    }
    if (gif != null) {
      data['gif'] = gif!.toJson();
    }
    if (tinygif != null) {
      data['tinygif'] = tinygif!.toJson();
    }
    if (nanomp4 != null) {
      data['nanomp4'] = nanomp4!.toJson();
    }
    if (mp4 != null) {
      data['mp4'] = mp4!.toJson();
    }
    if (tinymp4 != null) {
      data['tinymp4'] = tinymp4!.toJson();
    }
    if (loopedmp4 != null) {
      data['loopedmp4'] = loopedmp4!.toJson();
    }
    if (nanogif != null) {
      data['nanogif'] = nanogif!.toJson();
    }
    return data;
  }
}