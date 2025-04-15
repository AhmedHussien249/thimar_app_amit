import 'package:flutter/material.dart';

import 'home/pages/home/components/category_section/category_section_view.dart';
import 'home/pages/home/components/products_section/products_section_view.dart';
import 'home/pages/home/components/slider_section/slider_view.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionsView extends StatefulWidget {
  const SectionsView({super.key});

  @override
  State<SectionsView> createState() => _SectionsViewState();
}

class _SectionsViewState extends State<SectionsView> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("منتجات"),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              SliderSection(),
              SizedBox(
                height: 16,
              ),
              CategorySection(),
              SizedBox(
                height: 16,
              ),
              ProductsSection(),
            ],
          ),
        ),
      ),
    );
  }
}

// mvc
// mvp
// mvvm
// mvi
// design architecture

/* state Mangement (statelful - cubit-bloc-provider-getx-redux)
1. separate ui and logic
2. handle code into pieces
3.handle when refresh just refresh the need part
 */
