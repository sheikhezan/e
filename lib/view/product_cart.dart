import 'package:flutter/material.dart';
import '../provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    final finalList = provider.cart;

    _buildProductQuantity(IconData icon, int index ){

    }
    return Scaffold(
        appBar: AppBar(
          title: Text("MyCartProduct"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: finalList.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text(finalList[index].name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
                      subtitle: Text(
                        finalList[index].discription,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.grey,fontSize: 12),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(finalList[index].image,),
                        backgroundColor: Colors.red.shade200,
                      ),
                      trailing: Text('\Rs ${finalList[index].price}',style: TextStyle(fontSize: 20),),
                    );
                  }
              ),
            ),
          ],
        )
    );
  }
}