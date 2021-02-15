import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // the parent of this widget is products_overview_screen and
    // it does not have Products Provider.
    // the parent of p_o_s is root widget - main and
    // it has Products Provider.
    final productsData = Provider.of<Products>(context);
    // the getter in dart works like below.
    // we can just get like one of public properties.
    final products = productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(
          id: products[i].id,
          title: products[i].title,
          imageUrl: products[i].imageUrl),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
