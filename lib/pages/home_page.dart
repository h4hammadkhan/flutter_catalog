import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/Model/cart.dart';
import 'package:flutter_catalog/Model/catalog.dart';
import 'package:flutter_catalog/core/MyStore.dart';
import 'package:flutter_catalog/utilities/Routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import '../Widgets/home_widget/CatalogHeader.dart';
import '../Widgets/home_widget/CatalogList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final dummyItems = List.generate(20, (index) => CatalogModel.items[0]);

  final url = "https://api.jsonbin.io/v3/b/63ea7a93ace6f33a22ddb7fe";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(const Duration(seconds: 3));
    // var catalogJson = await rootBundle.loadString("assets/files/catalog.json");

    // Http call
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);

    // var productData = decodedData["products"];

    // Data form Http request
    var productData = decodedData["record"]["products"];
    CatalogModel.items =
        List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  moveToCartPage(BuildContext context) {
    Navigator.pushNamed(context, MyRoutes.cartPageRoute);
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, store, status) => FloatingActionButton(
          backgroundColor: Theme.of(context).buttonColor,
          onPressed: () => moveToCartPage(context),
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: Vx.red500,
          size: 22,
          count: _cart.items.length,
          textStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  ? CatalogList().py16().expand()
                  : CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
