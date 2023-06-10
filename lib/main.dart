import 'package:flutter/material.dart';
import 'package:product/provider/product_provider.dart';
import 'package:product/screen/product_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProductProvider(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: ProductScreen(),
        ));
  }
}
