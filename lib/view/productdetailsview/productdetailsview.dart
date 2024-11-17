import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../home_view/ProductProvider.dart';

class ProductDetailsView extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailsView({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product['thumbnail']),
            SizedBox(height: 16),
            Text(
              product['title'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: 8),
            Text('\$${product['price']}',
                style: TextStyle(color: Colors.green, fontSize: 14)),
            SizedBox(height: 16),
            Text('Description:'),
            SizedBox(height: 8),
            Text(product['description'] ?? 'No description available'),
            SizedBox(height: 32),
            // Add to Favorites Button with Animation
            Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                bool isFavorite = productProvider.favorites
                    .any((item) => item['id'] == product['id']);

                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: ElevatedButton.icon(
                    key: ValueKey<bool>(isFavorite),
                    onPressed: () {
                      productProvider.toggleFavorite(product);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(isFavorite
                            ? 'Removed from Favorites'
                            : 'Added to Favorites'),
                      ));
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    label: Text(isFavorite
                        ? 'Remove from Favorites'
                        : 'Add to Favorites'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 16),
            // Share Button
            ElevatedButton.icon(
              onPressed: () {
                String productDetails =
                    'Check out this product: ${product['title']}\nPrice: \$${product['price']}\nDescription: ${product['description'] ?? 'No description available'} ${product['thumbnail']}';
                Share.share(productDetails);
              },
              icon: Icon(Icons.share, color: Colors.white),
              label: Text('Share Product'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set background color to blue
                foregroundColor: Colors.white, // Set text and icon color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
