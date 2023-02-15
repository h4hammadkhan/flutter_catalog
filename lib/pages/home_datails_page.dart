import 'package:flutter/material.dart';
import 'package:flutter_catalog/Widgets/AddToCart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Model/catalog.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      bottomNavigationBar: Container(
        color: Theme.of(context).cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 40)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Theme.of(context).cardColor,
                width: context.screenWidth,
                height: context.screenHeight,
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(Theme.of(context).accentColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
                        .text
                        .textStyle(context.captionStyle)
                        .xl
                        .align(TextAlign.justify)
                        .make()
                        .p32(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
