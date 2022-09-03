import 'package:flutter/material.dart';
import 'package:paymob_integration/utils/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VisaCardScreen extends StatelessWidget {
  const VisaCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Card',
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
      body: WebView(
        initialUrl: AppConstant.iFrameUrl + AppConstant.paymentFinalTokenCard,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (int progress) {},
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        gestureNavigationEnabled: true,
        backgroundColor: const Color(0x00000000),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }
}
