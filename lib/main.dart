import 'package:flutter/material.dart';
import 'package:paymob_integration/utils/app_theme.dart';
import 'package:paymob_integration/utils/constants.dart';
import 'package:paymob_integration/utils/dio_helper.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getTheme(Brightness.light),
        locale: const Locale(AppConstant.appLocaleCode),
        home: Container(),
      ),
    );
  }
}
