class Nanomp4 {
  List<int>? dims;
  String? preview;
  String? url;
  int? size;
  double? duration;

  Nanomp4({dims, preview, url, size, duration});

  Nanomp4.fromJson(Map<String, dynamic> json) {
    dims = json['dims'].cast<int>();
    preview = json['preview'];
    url = json['url'];
    size = json['size'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['dims'] = dims;
    data['preview'] = preview;
    data['url'] = url;
    data['size'] = size;
    data['duration'] = duration;
    return data;
  }
}