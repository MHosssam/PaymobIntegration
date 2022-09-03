class AppConstant {
  static const String appName = 'PaymobIntegration';
  static const String appLocaleCode = 'en';
  //============== Paymob Info <============================
  static const String apiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPalF4TWpnd05Dd2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuSVpVenprSWZ5Vm1XQ3UwLWFnd2ppZktuVi1aTHNFZ2lEdHJObDdNRUZCeEh2Ri00czRsLTZPMTgtNmZYNDc5cHd0QUtRRjNPOHh3NS1hVWc4WVRwNlE=';

  static const String baseUrl = 'https://accept.paymob.com/api/';
  static const String authenticationUrl = 'auth/tokens';
  static const String orderRegistrationUrl = 'ecommerce/orders';
  static const String paymentKeyUrl = 'acceptance/payment_keys';
  static const String integrationIDCard = '2677950';
  static const String integrationIDKiosk = '2695398';
  static String paymobToken = '';
  static String paymobOrderId = '';
  static String paymentFinalTokenCard = '';
  static String paymentFinalTokenKiosk = '';
  static String refCode = '';
  static const String iFrameUrl =
      'https://accept.paymob.com/api/acceptance/iframes/458249?payment_token=';
}
