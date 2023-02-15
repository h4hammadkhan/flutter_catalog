// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_catalog/pages/home_datails_page.dart';

import '../../Model/catalog.dart';
import '../AddToCart.dart';
import 'CatalogImage.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  moveToProductDetails(BuildContext context, Item catalog) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeDetailsPage(catalog: catalog),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
            ),
            shrinkWrap: false,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                child: CatalogItem(catalog: catalog),
                onTap: () => moveToProductDetails(context, catalog),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                child: CatalogItem(catalog: catalog),
                onTap: () => moveToProductDetails(context, catalog),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    var innerItems = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(image: catalog.image),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg
                .color(Theme.of(context).accentColor)
                .bold
                .make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                AddToCart(catalog: catalog).pOnly(right: 8.0)
              ],
            )
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: innerItems,
            )
          : Column(
              children: innerItems,
            ),
    ).color(Theme.of(context).cardColor).rounded.square(150).make().py16();
  }
}
