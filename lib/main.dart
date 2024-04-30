import 'package:ezcommerce/provider/cart_provider.dart';
import 'package:ezcommerce/view/favourite.dart';
import 'package:ezcommerce/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/fav_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List screens = [
    const FavoriteScreen(),
    const Profile(),
  ];

  int myindex = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: screens[myindex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              setState(() {
                myindex = index;
              });
            },
            currentIndex: myindex,
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  label: 'Favorite',
                  icon: Icon(Icons.favorite),
                  backgroundColor: Colors.redAccent),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person),
                  backgroundColor: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
