import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app_amit/core/logic/helper.dart';
import 'package:themar_app_amit/views/cart_view.dart';

import 'components/category_section/category_section_view.dart';
import 'components/products_section/products_section_view.dart';
import 'components/slider_section/slider_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        backgroundColor: Colors.transparent,
        title: const Text("منتاجتنا"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(CartView(),keepHistory: true);
            },
            icon: const Icon(Icons.shopping_cart,color: Color(0xff4C8613)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SliderSection(),
            SizedBox(
              height: 16.h,
            ),
            const CategorySection(),
            SizedBox(
              height: 16.h,
            ),
            const ProductsSection(),
          ],
        ),
      ),
    );
  }
}
