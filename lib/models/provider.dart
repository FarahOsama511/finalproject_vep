import 'package:flutter/material.dart';

class Providerdata with ChangeNotifier {
  Map<int, bool> isfavourite = {};
  bool isFavourite(int postid) {
    return isfavourite[postid] ?? false;
  }

  void togglefav(int postid) {
    isfavourite[postid] = !(isfavourite[postid] ?? false);
    notifyListeners();
  }

  Widget Handlefav(int postid) {
    return IconButton(
      onPressed: () {
        togglefav(postid);
      },
      icon: isFavourite(postid)
          ? Icon(Icons.favorite)
          : Icon(Icons.favorite_border),
      color: isFavourite(postid) ? Colors.red : Colors.white,
    );
  }
}
