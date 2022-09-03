import 'package:flutter/material.dart';
import 'package:paymob_integration/utils/sizes.dart';

class CustomTextFormField extends StatefulWidget {
  final Widget? prefixIconWidget;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIconWidget;
  final bool? obscureText;
  final int? maxLine;
  final String? Function(String?)? validator;
  final AutovalidateMode validateType;
  final TextInputType? keyboardType;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;

  const CustomTextFormField({
    Key? key,
    this.prefixIconWidget,
    this.controller,
    this.hintText,
    this.obscureText,
    this.maxLine,
    this.suffixIconWidget,
    this.validator,
    this.keyboardType,
    this.validateType = AutovalidateMode.onUserInteraction,
    this.readOnly = false,
    this.onTap,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.verticalMargin * 0.7),
      child: TextFormField(
        onTap: widget.onTap,
        controller: widget.controller,
        focusNode: _focusNode,
        validator: widget.validator,
        autovalidateMode: widget.validateType,
        obscureText: widget.obscureText ?? false,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLine ?? 1,
        readOnly: widget.readOnly,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.background,
          contentPadding: EdgeInsets.symmetric(
            vertical: AppSizes.verticalMargin,
            horizontal: AppSizes.horizontalMargin,
          ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                fontWeight: FontWeight.w600,
              ),
          prefixIcon: widget.prefixIconWidget,
          suffixIcon: widget.suffixIconWidget,
        ),
        style: Theme.of(context).textTheme.caption?.copyWith(
            height: 1, color: Theme.of(context).colorScheme.primaryContainer),
      ),
    );
  }
}
