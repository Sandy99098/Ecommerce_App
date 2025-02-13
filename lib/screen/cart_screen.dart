import 'package:ecommerce_app/pages/product_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart_provider.dart';
import '../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: cartProvider.cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartProvider.cartItems.length,
              itemBuilder: (context, index) {
                final product = cartProvider.cartItems[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsPage(product: product)));

                    // print("hello");
                  },
                  child: Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      leading: ClipOval(
                        child: Image.asset(
                          product.imageUrl,
                          height: 120,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(product.name),
                      subtitle: Text("\$${product.price.toStringAsFixed(2)}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          _showDeleteConfirmationDialog(
                              context, cartProvider, product);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _showDeleteConfirmationDialog(
      BuildContext context, CartProvider cartProvider, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        content: Text(
            'Are you sure you want to remove ${product.name} from your cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              cartProvider.removeFromCart(product);
              Navigator.pop(context);
            },
            child: const Text('Yes', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
