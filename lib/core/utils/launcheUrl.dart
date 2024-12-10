import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launcheCustomUrl(context, String? url) async {
  if (url != null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnackBar(context, "Can't launch the Url");
    }
  }
}

void customSnackBar(context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
