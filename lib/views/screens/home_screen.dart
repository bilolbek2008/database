import 'package:flutter/material.dart';

import '../../controllers/products_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final productsController = ProductsController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: FutureBuilder(
          future: productsController.getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            final products = snapshot.data;

            return !snapshot.hasData || snapshot.data!.isEmpty
                ? const Center(
                    child: Text('Maxsulotlar mavjud emas'),
                  )
                : ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (ctx, index) {
                      final product = products[index];
                      return Card(
                        child: Column(
                          children: [
                            Image.network(
                              product.images[0],
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                );
                              },
                            )
                          ],
                        ),
                      );
                    });
          }),
    );
  }
}
