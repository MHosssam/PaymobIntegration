import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_integration/cubit/payment_cubit.dart';
import 'package:paymob_integration/cubit/payment_state.dart';
import 'package:paymob_integration/utils/image_name.dart';
import 'package:paymob_integration/utils/sizes.dart';
import 'package:paymob_integration/utils/validations.dart';
import 'package:paymob_integration/view/toggle_screen.dart';
import 'package:paymob_integration/widgets/custom_form_field.dart';
import 'package:paymob_integration/widgets/loader_widget.dart';

class RegisterScreen extends StatelessWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final priceController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        listener: (context, state) {
          if (state is PaymentRefCodeSuccessState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ToggleScreen()),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is LoadingState;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: Text(
                'Payment Integration',
                style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
              centerTitle: true,
            ),
            body: isLoading == true
                ? const Center(child: LoaderWidget())
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: AppSizes.buttonHeight * 5,
                              child: Image.asset(
                                ImageName.splash,
                                fit: BoxFit.contain,
                              ),
                            ),
                            CustomTextFormField(
                              controller: firstNameController,
                              keyboardType: TextInputType.name,
                              validator: validateNotEmpty,
                              hintText: 'First Name',
                              prefixIconWidget: const Icon(Icons.person),
                            ),
                            SizedBox(height: AppSizes.verticalMargin),
                            CustomTextFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.name,
                              validator: validateNotEmpty,
                              hintText: 'Last Name',
                              prefixIconWidget: const Icon(Icons.person),
                            ),
                            SizedBox(height: AppSizes.verticalMargin),
                            CustomTextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                              hintText: 'Email',
                              prefixIconWidget: const Icon(Icons.email),
                            ),
                            SizedBox(height: AppSizes.verticalMargin),
                            CustomTextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              validator: validateNotEmpty,
                              hintText: 'Phone',
                              prefixIconWidget: const Icon(Icons.phone),
                            ),
                            SizedBox(height: AppSizes.verticalMargin),
                            CustomTextFormField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              validator: validateNotEmpty,
                              hintText: 'Price',
                              prefixIconWidget: const Icon(Icons.price_check),
                            ),
                            SizedBox(height: AppSizes.verticalMargin),
                            ElevatedButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  PaymentCubit.get(context).getFirstToken(
                                      priceController.text,
                                      firstNameController.text,
                                      lastNameController.text,
                                      emailController.text,
                                      phoneController.text);
                                }
                              },
                              child: Text(
                                'Go To Pay',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
