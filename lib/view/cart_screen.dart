import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/products.dart';
import '../provider/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final finalList = provider.cart;

    _buildProductQuantiy(IconData icon, int index){

    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: ListView.builder(
        itemCount: finalList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(finalList[index].name),
            subtitle: Text(finalList[index].discription),
            trailing: Text('\$${finalList[index].price}'),
          );
        },
      ),
    );
  }
}
