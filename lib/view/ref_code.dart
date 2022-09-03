import 'package:flutter/material.dart';
import 'package:paymob_integration/utils/constants.dart';
import 'package:paymob_integration/utils/sizes.dart';

class RefCodeScreen extends StatelessWidget {
  const RefCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Reference Code',
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You Should Go to Any Market to Pay',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppSizes.verticalMargin),
            const Text(
              'This is Reference Code',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: AppSizes.verticalMargin),
            Card(
              elevation: 12,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(AppSizes.circleRadius),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  AppConstant.refCode,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
