import 'package:ezcommerce/view/DetailsPage.dart';
import 'package:flutter/material.dart';
import '../models/my_product.dart';
import '../models/products.dart';
import 'product_cart.dart';

class ProductPage extends StatefulWidget {

  final Product product;

  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EzCommerce", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            ),
            icon: Icon(Icons.add_shopping_cart, color: Colors.white),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Our Products",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildProductCategory(index: 0, name: "All Product"),
                  _buildProductCategory(index: 1, name: "Shoes"),
                  _buildProductCategory(index: 2, name: "Jacket"),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                  child: isSelected == 0
                      ? _buildAllProducts()
                      : isSelected == 1
                      ? _buildSneaker()
                      : _buildJackets()),
            ],
          ),
        ),
      ),
    );
  }

  _buildProductCategory({required int index, required String name}) =>
      GestureDetector(
        onTap: () => setState(() {
          isSelected = index;
        }),
        child: Container(
          width: 120,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected == index ? Colors.red : Colors.red.shade300,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  _buildAllProducts() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: (100 / 160),
    ),
    scrollDirection: Axis.vertical,
    itemCount: MyProducts.allProducts.length,
    itemBuilder: (context, index) {
      final allProducts = MyProducts.allProducts[index];
      return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(product: allProducts),
              ),
            );
          },
          child: ProductPage(product: allProducts));
    },
  );

  _buildJackets() => GridView.builder(
      itemCount: MyProducts.jacketList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: (100 / 160),
      ),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        final jacketList = MyProducts.jacketList[index];
        return GestureDetector(
          onTap: ()=> Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(product: jacketList),
          ),
          ),
          child: ProductPage(product: jacketList),
        );
      }
      );

  _buildSneaker() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
        childAspectRatio: (100 / 160),
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.sneakersList.length,
      itemBuilder: (context, index) {
        final sneakersList = MyProducts.sneakersList[index];
        return ProductPage(product: sneakersList);
      });
}
