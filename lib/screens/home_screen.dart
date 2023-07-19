import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/models/models.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/screens/loading_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    if (productService.isLoading) return LoadingScreen();
    final List<Product> products = productService.products;
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            productService.selectedproduct = products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          child: ProductCard(product: products[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          productService.selectedproduct =
              new Product(name: '', price: 0.0, available: false);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
