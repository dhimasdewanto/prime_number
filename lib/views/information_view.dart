import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InformationView extends StatelessWidget {
  const InformationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              _lauchUrl("https://github.com/dhimasdewanto");
            },
            child: const Text("GitHub"),
          ),
          ElevatedButton(
            onPressed: () {
              _lauchUrl("https://www.linkedin.com/in/dhimas-bagus-rizky-dewanto-449b6b151/");
            },
            child: const Text("LinkedIn"),
          ),
        ],
      ),
    );
  }

  Future<void> _lauchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
