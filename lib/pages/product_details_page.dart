// import 'package:ecommerce_app/pages/esewa_payment_page.dart';
// import 'package:ecommerce_app/pages/esewa_payment_page.dart';
import 'package:ecommerce_app/payment/esewa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../cart_provider.dart';

// esewa
class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.imageUrl,
              fit: BoxFit.scaleDown,
              height: 400,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 400,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.image_not_supported)),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 245, 242, 242),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                cartProvider.addToCart(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
            ),
            ElevatedButton.icon(
              onPressed: () {
//  go to buying logic and screen

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => EsewaPaymentPage()));
                Esewa esewa = Esewa();
                esewa.pay();
              },
              icon: const Icon(
                Icons.shopping_cart_checkout,
                color: Colors.green,
              ),
              label: const Text(
                'Buy Now',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
