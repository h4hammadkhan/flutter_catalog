import 'package:flutter/material.dart';
import 'package:flutter_catalog/Model/cart.dart';
import 'package:flutter_catalog/utilities/MyTheme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/MyStore.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          children: [
            _CartList().p12().expand(),
            Divider(),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, store, status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(Theme.of(context).accentColor)
                  .make();
            },
            mutations: {RemoveMutation},
          ),
          // 20.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Buying is not supported yet."),
                ),
              );
            },
            child: "Buy".text.make(),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).buttonColor),
            ),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final Cart _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Cart Is Empty".text.xl2.make().centered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                onPressed: () => RemoveMutation(_cart.items[index]),
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
