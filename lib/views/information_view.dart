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
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/profile.jpeg"),
          ),
          const SizedBox(height: 10),
          Text(
            "Dhimas Bagus Rizky Dewanto",
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 10),
          Text(
            "dhimasbrd@gmail.com",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              _lauchUrl("https://github.com/dhimasdewanto");
            },
            child: const Text("GitHub"),
          ),
          ElevatedButton(
            onPressed: () {
              _lauchUrl(
                  "https://www.linkedin.com/in/dhimas-bagus-rizky-dewanto-449b6b151/");
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
