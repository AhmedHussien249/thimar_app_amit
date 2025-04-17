import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:themar_app_amit/core/designs/app_images.dart';
import 'package:themar_app_amit/features/products/bloc.dart';

import '../../../../../../features/add_to_cart/bloc.dart';




part 'items_products.dart';
part 'loading_products.dart';

class ProductsSection extends StatefulWidget {
  const ProductsSection({super.key});

  @override
  State<ProductsSection> createState() => _ProductsSectionState();
}

class _ProductsSectionState extends State<ProductsSection> {
  final cubit = GetIt.instance<ProductsBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is GetProductsFailedState) {
            return SizedBox(
              height: 218.h,
              child: Column(
                children: [
                  Center(
                    child: Text(
                      state.msg,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                  FilledButton(
                    onPressed: () => cubit.add(GetProductsEvent()),
                    child: const Text("اعادة المحاولة"),
                  )
                ],
              ),
            );
          } else if (state is GetProductsSuccessState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Text(
                    "الاصناف",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                GridView.builder(
                  padding: EdgeInsets.all(16.h.w),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 20,
                    childAspectRatio: 189 / 300,
                  ),
                  itemBuilder: (context, index) => _Item(model: state.list[index]),
                  itemCount: state.list.length,
                ),
              ],
            );
          } else {
            return const _Loading();
          }
        });
  }
}
