import 'package:ecommerce_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import '../global_variables.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final productListView = ListView.builder(
      itemCount: allProducts.length,
      itemBuilder: (context, index) {
        final product = allProducts[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(product: product),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported,
                          size: 100, color: Colors.grey);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.category,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$${product.price.toString()}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    final productGridView = GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: allProducts.length,
      itemBuilder: (BuildContext context, int index) {
        final product = allProducts[index];

        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailsPage(product: product)));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    height: 350,
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.image_not_supported,
                          size: 350, color: Colors.grey);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        product.category,
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade700),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "\$${product.price.toString()}",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Product List'),
        centerTitle: true,
      ),
      body: screenWidth < 600 ? productListView : productGridView,
    );
  }
}
