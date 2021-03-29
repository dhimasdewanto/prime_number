import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  WebViewWidgetState createState() => WebViewWidgetState();
}

class WebViewWidgetState extends State<WebViewWidget> {
  @override
  void initState() {
    super.initState();
    _enableHybridComposition();
  }

  void _enableHybridComposition() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}
