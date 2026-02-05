import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkLauncher {
  static Future<void> open(BuildContext context, String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null) {
      _showFailure(context);
      return;
    }

    if (!await canLaunchUrl(uri)) {
      _showFailure(context);
      return;
    }

    final success = await launchUrl(uri, mode: LaunchMode.externalApplication);

    if (!success) {
      _showFailure(context);
    }
  }

  static void _showFailure(BuildContext context) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Could not open the link. Please try again.'),
      ),
    );
  }
}
