import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tenor_gif_app/gifs/data/api/end_points.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_response.dart';
import 'package:tenor_gif_app/gifs/util/app_consts.dart';

class TenorApi {

  static Future<GifResponse> getTrendingGifs(String pos) async {
    try {
      var uri = Uri.parse('${TenorEndPoints.baseUrl}${TenorEndPoints.trendingEP}?key=${TenorEndPoints.key}&pos=$pos&limit=${AppConst.pageLimit}');
      var response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var jsonRes =  json.decode(response.body);
        return GifResponse.fromJson(jsonRes);
      } else {
        return GifResponse(error: true);
      }
    } catch (ex, st) {
      log('$ex$st');
      return GifResponse(error: true);
    }
  }

  static Future getSearchResualtGifs(String search, String pos) async {
     try {
      var uri = Uri.parse('${TenorEndPoints.baseUrl}${TenorEndPoints.searchEP}?q=$search&key=${TenorEndPoints.key}&pos=$pos&limit=${AppConst.pageLimit}');
      var response = await http.get(
        uri,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        var jsonRes =  json.decode(response.body);
        return GifResponse.fromJson(jsonRes);
      } else {
        return GifResponse(error: true);
      }
    } catch (ex) {
      log(ex.toString());
      return GifResponse(error: true);
    }
  }

}
