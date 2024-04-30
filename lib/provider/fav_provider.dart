import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<Product> _favorite = [];
  List<Product> get favorites => _favorite;

  void toggleFavorite(Product product) {
    if (_favorite.contains(product)) {
      _favorite.remove(product);
    } else {
      _favorite.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    return _favorite.contains(product);
  }

  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
