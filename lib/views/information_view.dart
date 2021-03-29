import 'package:flutter/material.dart';

import '../web_view_page.dart';

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
              final route = MaterialPageRoute(
                builder: (context) {
                  return const WebViewPage(
                    url: "https://github.com/dhimasdewanto",
                  );
                },
              );
              Navigator.of(context).push(route);
            },
            child: const Text("GitHub"),
          ),
        ],
      ),
    );
  }
}
