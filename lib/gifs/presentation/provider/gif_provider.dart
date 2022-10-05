import 'package:flutter/cupertino.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_data.dart';
import 'package:tenor_gif_app/gifs/data/model/gif_response.dart';
import 'package:tenor_gif_app/gifs/domain/usecase/gif_usecase.dart';
import 'package:tenor_gif_app/gifs/presentation/pages/gif_details_page.dart';

class GifProvider extends ChangeNotifier {
  GifResponse? _gifResponse;
  String _search = '';
  bool _loading = false;
  GifData? loadedGif;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String get search => _search;

  set search(String value) {
    _search = value;
    if (search.isEmpty) {
      getGifs();
    }
  }

  GifResponse? get gifResponse => _gifResponse;

  set gifResponse(GifResponse? value) {
    _gifResponse = value;
  }

  Future<void> getTrendingGifs() async {
    gifResponse = null;
    _gifResponse = await GifUsecase.getTrendingGifs('');
    notifyListeners();
  }

  Future<void> getTrendingGifsPaging() async {
    if (gifResponse != null && gifResponse!.next != null) {
      List<GifData> gifData = gifResponse!.gifDataResults!;
      _gifResponse = await GifUsecase.getTrendingGifs(gifResponse!.next!);
      gifData..addAll(_gifResponse!.gifDataResults!);
      _gifResponse!.gifDataResults = gifData;
      notifyListeners();
    }
  }

  Future<void> getSearchResualtGifs() async {
    gifResponse = null;
    notifyListeners();
    _gifResponse = await GifUsecase.getSearchResualtGifs(search.trim(), '');
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

  openDetailsPage(BuildContext context, GifData gifData) {
    loadedGif = gifData;
    Navigator.pushNamed(context, GifDetailsPage.id);
  }
}
