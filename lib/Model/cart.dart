import 'package:flutter_catalog/Model/catalog.dart';
import 'package:flutter_catalog/core/MyStore.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart {
  // catalog Filed
  late CatalogModel _catalog;

  // collection of IDs - store ids of each item
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  // set catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
