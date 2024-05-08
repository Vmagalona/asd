import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/trash.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late TextEditingController _searchController;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void addTrashToCart(BuildContext context, Trash trash) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Pick-Up"),
          content: Text("Are you sure you want to accept ${trash.name}?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Provider.of<Cart>(context, listen: false).addItemToCart(trash);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Job Added'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: const Text("Accept"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Ready For Pick-Up',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'CaveatBrush',
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Trash Items...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: value.getTrashList().where((trash) {
                return trash.name.toLowerCase().contains(_searchText.toLowerCase());
              }).map((trash) {
                return GestureDetector(
                  onTap: () {
                    addTrashToCart(context, trash);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            trash.imagePath, // Assuming imagePath is the path to the image
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            trash.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Truculenta-VariableFont_opsz,wdth,wght',
                            ),
                          ),
                          Text(
                            'PHP ${trash.price}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: 'CaveatBrush',
                              color: Color.fromARGB(255, 3, 156, 34),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            trash.description,
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: 'Truculenta-VariableFont_opsz,wdth,wght'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
