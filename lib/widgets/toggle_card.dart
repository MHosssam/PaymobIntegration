import 'package:flutter/material.dart';
import 'package:paymob_integration/utils/sizes.dart';

class ToggleCard extends StatelessWidget {
  const ToggleCard({
    Key? key,
    required this.title,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(AppSizes.horizontalMargin),
        decoration: BoxDecoration(
          borderRadius: AppSizes.circularBorderRadius,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Image.asset(image, fit: BoxFit.contain)),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppSizes.verticalMargin,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
