
import 'package:tenor_gif_app/gifs/data/api/tenor_api.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_response.dart';

class GifUsecase {

  static Future<GifResponse> getTrendingGifs(String nextPos) async {
    return await TenorApi.getTrendingGifs(nextPos);
  }

  static getSearchResualtGifs(String search, String nextPos) async {
    return await TenorApi.getSearchResualtGifs(search, nextPos);
  }

}