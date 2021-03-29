import 'package:flutter/material.dart';

import 'web_view_widget.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(
          url: url,
        ),
      ),
    );
  }
}
