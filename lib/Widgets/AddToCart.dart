import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/MyStore.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Model/cart.dart';
import '../Model/catalog.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // VxState.listen(context, to: [AddMutation]);
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final Cart _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      // ignore: sort_child_properties_last
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Theme.of(context).buttonColor,
        ),
        shape: MaterialStateProperty.all(
          const StadiumBorder(),
        ),
      ),
    );
  }
}
