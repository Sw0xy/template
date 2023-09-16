import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/helpers/size_helper.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        fallbackLocale: const Locale('en'),
        useOnlyLangCode: true,
        useFallbackTranslations: true,
        path: 'assets/langs',
        assetLoader: JsonAssetLoader(),
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            SizeHelper.instance.initSafeAreaPadding(
                MediaQueryData.fromView(View.of(context)).padding.top,
                MediaQueryData.fromView(View.of(context)).padding.bottom);
            return AnnotatedRegion<SystemUiOverlayStyle>(
                value: SystemUiOverlayStyle.dark,
                child: GetMaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  title: "Application",
                  theme: ThemeData(),
                  debugShowCheckedModeBanner: false,
                  initialRoute: AppPages.INITIAL,
                  getPages: AppPages.routes,
                ));
          },
        )),
  );
}
