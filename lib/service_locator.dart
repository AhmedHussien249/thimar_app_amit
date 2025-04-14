import 'package:get_it/get_it.dart';
import 'package:themar_app_amit/features/app_info/bloc.dart';

import 'core/logic/dio_helper.dart';
import 'features/cart/bloc.dart';
import 'features/category_section/cubit.dart';
import 'features/contuct_us/bloc.dart';
import 'features/login/bloc.dart';
import 'features/products/cubit.dart';
import 'features/register/bloc.dart';
import 'features/slider/cubit.dart';
import 'features/update_cart_item/bloc.dart';

void initServiceLocator() {
  final container = GetIt.instance;
  container.registerSingleton(DioHelper());
  container.registerFactory(() => LoginBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => RegisterBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => ContactUsBloc(GetIt.instance<DioHelper>()));
  container
      .registerFactory(() => UpdateCartItemBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(
      () => CartBloc(GetIt.instance<DioHelper>())..add(GetCartEvent()));
  container.registerFactory(
      () => CategoriesCubit(GetIt.instance<DioHelper>())..getData());
  container.registerFactory(
      () => ProductsCubit(GetIt.instance<DioHelper>())..getData());
  container.registerFactory(
      () => SliderCubit(GetIt.instance<DioHelper>())..getData());
  container.registerFactory(
      () => AppInfoBloc(GetIt.instance<DioHelper>())..add(GetAppInfoEvent()));
}
