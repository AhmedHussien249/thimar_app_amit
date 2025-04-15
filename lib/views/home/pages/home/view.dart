import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        title: const Text("Home"),
        centerTitle: true,
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
