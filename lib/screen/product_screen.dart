import 'package:flutter/material.dart';
import 'package:product/provider/product_provider.dart';
import 'package:product/utils/size_utils.dart';
import 'package:product/widget/product_design.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductProvider>(context, listen: false).getAllProduct();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeUtils().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Product"),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          final product = value.product;
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 2,
                vertical: SizeUtils.horizontalBlockSize * 2,
              ),
              child: GridView.count(
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                children: List.generate(
                  product.length,
                      (index) {
                    final products = product[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.horizontalBlockSize * 0.1,
                        horizontal: SizeUtils.horizontalBlockSize * 0.1,
                      ),
                      child: productDesign(
                        title: products.title ?? "",
                        image: products.image ?? "",
                        category: products.category ?? "",
                        count: products.rating?.count.toString() ?? "",
                        price: products.price ?? 0,
                        rate: products.rating?.rate ?? 0,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
