import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/trash.dart';



class Cart extends ChangeNotifier {
  // list
  List<Trash> trashShop = [
    Trash(name: 'Large Item Removal', price: '550', imagePath: 'lib/images/L.jpg', description: 'Furniture, Appliances, Electronics'),
    Trash(name: 'Junk Removal', price: '150', imagePath: 'lib/images/J.jpeg', description: 'Bags of Trash or Yard Waste'),
    Trash(name: 'Recycling', price: '80', imagePath: 'lib/images/R.jpg', description: "Newspapers"),
    Trash(name: 'Garbage', price: '100', imagePath: 'lib/images/G.jpg', description: 'Bags of Trash'),
    Trash(name: 'Yard Waste', price: '150', imagePath: 'lib/images/Y.jpg', description: 'Branches, Leaves, Grass Clippings'),
    Trash(name: 'Recycling', price: '90', imagePath: 'lib/images/R.jpg', description: "Newspapers"),
    Trash(name: 'Garbage', price: '140', imagePath: 'lib/images/G.jpg', description: 'Bags of Trash'),
    Trash(name: 'Yard Waste', price: '190', imagePath: 'lib/images/Y.jpg', description: 'Branches, Leaves, Grass Clippings'),
  ];

  // list of items in cart
  List<Trash> userCart = [];

  // list of shoes for sale
  List<Trash> getTrashList() {
    return trashShop;
  }

  // get cart
  List<Trash> getUserCart() {
    return userCart;
  }

  // add items
  void addItemToCart(Trash trash) {
    userCart.add(trash);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Trash trash) {
    userCart.remove(trash);
    notifyListeners();
  }

  // Calculate total price of items in cart
  double getTotalPrice() {
    double total = 0;
    for (var item in userCart) {
      total += double.parse(item.price);
    }
    return total;
  }

  // UI for the cart
  Widget buildCartUI(BuildContext context) {
    return ListView.builder(
      itemCount: userCart.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(userCart[index].imagePath),
          title: Text(userCart[index].name),
          subtitle: Text(userCart[index].description),
          trailing: Text('₱${userCart[index].price}'),
          onTap: () {
            removeItemFromCart(userCart[index]);
          },
        );
      },
    );
  }

  void removeFromCart(Trash individualTrash) {}
}
