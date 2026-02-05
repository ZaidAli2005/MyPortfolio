import 'package:flutter/material.dart';
import 'package:myportfolio/core/app_spacing.dart';
import 'package:myportfolio/models/social_link.dart';
import 'package:myportfolio/services/link_launcher.dart';

class SocialLinksRow extends StatelessWidget {
  const SocialLinksRow({
    super.key,
    required this.links,
  });

  final List<SocialLink> links;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.xs,
      children: links
          .map(
            (link) => ActionChip(
              avatar: Icon(link.icon, size: 18),
              label: Text(link.label),
              onPressed: () => LinkLauncher.open(context, link.url),
            ),
          )
          .toList(),
    );
  }
}
