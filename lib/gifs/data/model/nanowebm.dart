class Nanowebm {
  String? url;
  int? size;
  List<int>? dims;
  String? preview;

  Nanowebm({url, size, dims, preview});

  Nanowebm.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    size = json['size'];
    dims = json['dims'].cast<int>();
    preview = json['preview'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['url'] = url;
    data['size'] = size;
    data['dims'] = dims;
    data['preview'] = preview;
    return data;
  }
}