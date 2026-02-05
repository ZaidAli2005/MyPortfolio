import 'package:flutter/material.dart';
import 'package:myportfolio/core/app_spacing.dart';
import 'package:myportfolio/data/profile_data.dart';
import 'package:myportfolio/models/skill.dart';
import 'package:myportfolio/widgets/section_header.dart';
import 'package:myportfolio/widgets/skill_progress_tile.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grouped = <String, List<Skill>>{};
    for (final skill in ProfileData.skills) {
      grouped.putIfAbsent(skill.category, () => []).add(skill);
    }

    return SingleChildScrollView(
      padding: AppSpacing.page,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: grouped.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionHeader(title: entry.key),
              ...entry.value.map((skill) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: SkillProgressTile(skill: skill),
                  )),
              const SizedBox(height: AppSpacing.lg),
            ],
          );
        }).toList(),
      ),
    );
  }
}
