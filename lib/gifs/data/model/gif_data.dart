import 'package:tenor_gif_app/gifs/data/model/media.dart';

class GifData {
  String? id;
  String? title;
  String? contentDescription;
  String? contentRating;
  String? h1Title;
  List<Media>? media;
  String? bgColor;
  double? created;
  String? itemurl;
  String? url;
  List<dynamic>? tags;
  List<dynamic>? flags;
  int? shares;
  bool? hasaudio;
  bool? hascaption;
  String? sourceId;
  dynamic composite;

  GifData(
      {id,
      title,
      contentDescription,
      contentRating,
      h1Title,
      media,
      bgColor,
      created,
      itemurl,
      url,
      tags,
      flags,
      shares,
      hasaudio,
      hascaption,
      sourceId,
      composite});

  GifData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    contentDescription = json['content_description'];
    contentRating = json['content_rating'];
    h1Title = json['h1_title'];
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
    bgColor = json['bg_color'];
    created = json['created'];
    itemurl = json['itemurl'];
    url = json['url'];
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    if (json['flags'] != null) {
      flags = <Null>[];
      json['flags'].forEach((v) {
        flags!.add(v);
      });
    }
    shares = json['shares'];
    hasaudio = json['hasaudio'];
    hascaption = json['hascaption'];
    sourceId = json['source_id'];
    composite = json['composite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['content_description'] = contentDescription;
    data['content_rating'] = contentRating;
    data['h1_title'] = h1Title;
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    data['bg_color'] = bgColor;
    data['created'] = created;
    data['itemurl'] = itemurl;
    data['url'] = url;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    if (flags != null) {
      data['flags'] = flags!.map((v) => v.toJson()).toList();
    }
    data['shares'] = shares;
    data['hasaudio'] = hasaudio;
    data['hascaption'] = hascaption;
    data['source_id'] = sourceId;
    data['composite'] = composite;
    return data;
  }
}