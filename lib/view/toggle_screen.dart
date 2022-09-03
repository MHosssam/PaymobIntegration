import 'package:flutter/material.dart';
import 'package:paymob_integration/utils/image_name.dart';
import 'package:paymob_integration/view/ref_code.dart';
import 'package:paymob_integration/view/visa_card.dart';
import 'package:paymob_integration/widgets/toggle_card.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ToggleCard(
                image: ImageName.card,
                title: 'Payment With Card',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VisaCardScreen(),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ToggleCard(
                image: ImageName.amico,
                title: 'Payment With Ref Code',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RefCodeScreen(),
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
