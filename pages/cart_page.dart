import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/trash.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 1),
              if (value.getUserCart().isEmpty)
                const Center(
                  child: Text(
                    'No Accepted Job',
                    style: TextStyle(fontSize: 20),
                  ),
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: value.getUserCart().length,
                    itemBuilder: (context, index) {
                      Trash individualTrash = value.getUserCart()[index];
                      return Column(
                        children: [
                          ListTile(
                            leading: Image.network(
                              individualTrash.imagePath,
                              width: 100,
                              height: 50,
                            ),
                            title: Text(individualTrash.name),
                            subtitle: Text(
                              'PHP ${double.parse(individualTrash.price).toStringAsFixed(2)}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                value.removeItemFromCart(individualTrash);
                              },
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    },
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Total Price: PHP ${value.getTotalPrice().toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CaveatBrush',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
