import 'package:flutter_catalog/Model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Model/cart.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late Cart cart;

  MyStore() {
    catalog = CatalogModel();
    cart = Cart();
    cart.catalog = catalog;
  }
}
