import 'package:get_it/get_it.dart';
import 'package:themar_app_amit/features/app_info/bloc.dart';

import 'core/logic/dio_helper.dart';
import 'features/add_to_cart/bloc.dart';
import 'features/cart/bloc.dart';
import 'features/category_section/bloc.dart';
import 'features/contuct_us/bloc.dart';
import 'features/login/bloc.dart';
import 'features/notifications/bloc.dart';
import 'features/otp/bloc.dart';
import 'features/products/bloc.dart';
import 'features/register/bloc.dart';
import 'features/slider/bloc.dart';
import 'features/update_cart_item/bloc.dart';

void initServiceLocator() {
  final container = GetIt.instance;
  container.registerSingleton(DioHelper());
  container.registerFactory(() => LoginBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => RegisterBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => OTPBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => ContactUsBloc(GetIt.instance<DioHelper>()));
  container
      .registerFactory(() => UpdateCartItemBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(
      () => CartBloc(GetIt.instance<DioHelper>())..add(GetCartEvent()));
  container.registerFactory(() =>
      CategoriesBloc(GetIt.instance<DioHelper>())..add(GetCategoriesEvent()));
  container.registerFactory(
      () => ProductsBloc(GetIt.instance<DioHelper>())..add(GetProductsEvent()));

  container.registerFactory(
      () => SliderBloc(GetIt.instance<DioHelper>())..add(GetSliderEvent()));

  container.registerFactory(
      () => AppInfoBloc(GetIt.instance<DioHelper>())..add(GetAppInfoEvent()));
  //container.registerFactory(() => AddToCartBloc(GetIt.instance<DioHelper>()));
  container.registerSingleton(AddToCartBloc(GetIt.instance<DioHelper>()));
  container.registerFactory(() => GetNotificationsBloc(GetIt.instance<DioHelper>())..add(GetNotificationsEvent()));

}
