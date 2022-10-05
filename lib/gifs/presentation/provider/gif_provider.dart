import 'package:flutter/cupertino.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_data.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_response.dart';
import 'package:tenor_gif_app/gifs/domain/usecase/gif_usecase.dart';

class GifProvider extends ChangeNotifier {
  GifResponse? _gifResponse;
  String _search = '';
  bool loading = false;
  String get search => this._search;

  set search(String value) {
    _search = value;
    notifyListeners();
  }

  GifResponse? get gifResponse => this._gifResponse;

  set gifResponse(GifResponse? value) => this._gifResponse = value;

  Future<void> getTrendingGifs() async {
    gifResponse = null;
    gifResponse = await GifUsecase.getTrendingGifs('');
    notifyListeners();
  }

  Future<void> getTrendingGifsPaging() async {
    if (gifResponse != null && gifResponse!.next != null) {
      List<GifData> gifData = gifResponse!.gifDataResults!;
      gifResponse = await GifUsecase.getTrendingGifs(gifResponse!.next!);
      gifData..addAll(gifResponse!.gifDataResults!);
      gifResponse!.gifDataResults = gifData;
      notifyListeners();
    }
  }

  Future<void> getSearchResualtGifs() async {
    gifResponse = null;
    gifResponse = await GifUsecase.getSearchResualtGifs(
        search.trim(), gifResponse!.next!);
    notifyListeners();
  }

  Future<void> getSearchResualtGifsPaging() async {
    if (gifResponse != null && gifResponse!.next != null) {
      List<GifData> gifData = gifResponse!.gifDataResults!;
      gifResponse =
          await GifUsecase.getSearchResualtGifs(search, gifResponse!.next!);
      gifData..addAll(gifResponse!.gifDataResults!);
      gifResponse!.gifDataResults = gifData;
      notifyListeners();
    }
  }

  Future<void> getGifs() async {
    if (search.trim().isEmpty) {
      await getTrendingGifs();
    } else {
      await getSearchResualtGifs();
    }
  }

  Future<void> getGifsPaging() async {
    if (!loading) {
      loading = true;
      if (search.trim().isEmpty) {
        await getTrendingGifsPaging();
      } else {
        await getSearchResualtGifsPaging();
      }
      loading = false;
    }
  }
}
