import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:themar_app_amit/views/auth/login.dart';

import 'core/logic/app_theme.dart';
import 'core/logic/cache_helper.dart';
import 'core/logic/helper.dart';
import 'service_locator.dart';
import 'views/auth/register.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  initServiceLocator();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
      path: "assets/translations",
      fallbackLocale: Locale("en"),
      startLocale: Locale("ar"),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Thimar',
          theme: AppTheme.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: child),
      child: const LoginView(),
    );
  }
}
