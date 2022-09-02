import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:paymob_integration/utils/sizes.dart';
import 'package:sizer/sizer.dart';

void closeKeyBoard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

void showError({required BuildContext context, required String message}) {
  Flushbar(
    margin: EdgeInsets.zero,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    textDirection: Directionality.of(context),
    backgroundColor: Colors.transparent,
    messageSize: 2.sp,
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.h),
            color: Theme.of(context).colorScheme.error,
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.verticalMargin / 2,
            horizontal: AppSizes.horizontalMargin * .5,
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  ).show(context);
}

void showSuccess({required BuildContext context, required String message}) {
  Flushbar(
    margin: EdgeInsets.zero,
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    textDirection: Directionality.of(context),
    backgroundColor: Colors.transparent,
    messageText: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1.h),
            color: Theme.of(context).colorScheme.primary,
          ),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.verticalMargin / 2,
            horizontal: AppSizes.horizontalMargin * .5,
          ),
          child: Text(
            message,
            style: Theme.of(context).textTheme.caption?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 2),
  ).show(context);
}

void showLoading({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(.35),
    builder: (BuildContext context) {
      return const AlertDialog(
        content: Center(child: CircularProgressIndicator()),
      );
    },
  );
}

void hideLoading({required BuildContext context}) {
  Navigator.of(context).pop();
}
