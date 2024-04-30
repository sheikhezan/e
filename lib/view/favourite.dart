import 'package:ezcommerce/provider/fav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final finalList = provider.favorites;
    return Scaffold(
      appBar: AppBar(
        title: Text("My Fav Products"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Favorite Products", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: finalList.length,
              itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            finalList.removeAt(index);
                            setState(() {});
                          },
                          label: 'Delete',
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,// Provide a label here
                        ),
                      ],
                    ),
                    child: ListTile(
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
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

