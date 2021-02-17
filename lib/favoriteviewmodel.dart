import 'package:flutter/foundation.dart';

class FavoriteViewModel extends ChangeNotifier{
  bool _liked = false;

  bool get liked {
    return this._liked;
  }

  set liked(bool liked){
    this._liked = liked;
  }

  changeFavorite(){
    this._liked = !this._liked;
    notifyListeners();
  }
}