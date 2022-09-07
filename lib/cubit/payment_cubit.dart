import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paymob_integration/cubit/payment_state.dart';
import 'package:paymob_integration/utils/constants.dart';
import 'package:paymob_integration/utils/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

  Future getFirstToken(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    emit(LoadingState(true));
    DioHelper.postData(
        url: 'auth/tokens',
        data: {'api_key': AppConstant.apiKey}).then((value) {
      AppConstant.paymobToken = value.data['token'];
      print('First token: ${AppConstant.paymobToken}');
      getOrderId(price, firstName, lastName, email, phone);
      emit(PaymentSuccessState());
    }).catchError((error) {
      emit(PaymentErrorState(error));
    });
  }

  Future getOrderId(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    DioHelper.postData(url: 'ecommerce/orders', data: {
      'auth_token': AppConstant.paymobToken,
      'delivery_needed': 'false',
      'amount_cents': price,
      'currency': 'EGP',
      'items': [],
    }).then((value) {
      AppConstant.paymobOrderId = value.data['id'].toString();
      print('Order ID: ${AppConstant.paymobOrderId}');
      getFinalTokenCard(price, firstName, lastName, email, phone);
      getFinalTokenKiosk(price, firstName, lastName, email, phone);
      emit(PaymentOrderIDSuccessState());
    }).catchError((error) {
      emit(PaymentOrderIDErrorState(error));
    });
  }

  Future getFinalTokenCard(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    DioHelper.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": AppConstant.paymobToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": AppConstant.paymobOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": AppConstant.integrationIDCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      AppConstant.paymentFinalTokenCard = value.data['token'].toString();
      print('Final Token Card: ${AppConstant.paymentFinalTokenCard}');
      emit(PaymentRequestTokenSuccessState());
    }).catchError((error) {
      emit(PaymentRequestTokenErrorState(error));
    });
  }

  Future getFinalTokenKiosk(
    String price,
    String firstName,
    String lastName,
    String email,
    String phone,
  ) async {
    DioHelper.postData(url: 'acceptance/payment_keys', data: {
      "auth_token": AppConstant.paymobToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": AppConstant.paymobOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": AppConstant.integrationIDKiosk,
      "lock_order_when_paid": "false"
    }).then((value) {
      AppConstant.paymentFinalTokenKiosk = value.data['token'].toString();
      print('Final Token Kiosk: ${AppConstant.paymentFinalTokenKiosk}');
      getRefCode();
      emit(PaymentRequestTokenKioskSuccessState());
    }).catchError((error) {
      emit(PaymentRequestTokenKioskErrorState(error));
    });
  }

  Future getRefCode() async {
    DioHelper.postData(url: 'acceptance/payments/pay', data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": AppConstant.paymentFinalTokenKiosk,
    }).then((value) {
      AppConstant.refCode = value.data['id'].toString();
      print('Ref Code: ${AppConstant.refCode}');
      emit(PaymentRefCodeSuccessState());
      emit(LoadingState(false));
    }).catchError((error) {
      emit(PaymentRefCodeErrorState(error));
      emit(LoadingState(false));
    });
  }
}
